# FLEET (scikit-learn random-forest transient classifier) inference image.
# The RF model pickles, the bundled training/host catalogs, and the SFD dust maps
# are all baked in so a job can classify from staged inputs without network.
#
# NOTE: FLEET's default data acquisition (ALeRCE/ZTF/Rubin light curves, TNS, and
# the SDSS/PS1/Gaia/WISE/Vizier host crossmatch) hits external services at runtime.
# For offline use (e.g. OSG), the caller must pre-stage the photometry + host
# catalog cache and run predict() with the download_* flags off (see README of the
# osg-skyportal-plugin integration). This image makes that offline path possible;
# it does not itself provide the staged inputs.

FROM python:3.11-slim-bookworm

# libgomp1: OpenMP runtime for scikit-learn. git/build-essential: a couple of
# FLEET deps (casjobs/mastcasjobs) install from source. curl/ca-certificates for
# the dust-map download.
RUN apt-get update && apt-get install -y --no-install-recommends \
        libgomp1 git build-essential curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ENV PIP_NO_CACHE_DIR=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    MPLBACKEND=Agg \
    fleet_data=/opt/fleet-data \
    DUSTMAPS_DATA_DIR=/opt/dustmaps

WORKDIR /src
COPY . .

# requests for the analysis-callback upload; setup.py pulls the science stack.
RUN pip install --upgrade pip \
    && pip install . requests

# Bake the SFD dust maps so dust_map='SFD' works offline.
RUN mkdir -p "$DUSTMAPS_DATA_DIR" \
    && python -c "from dustmaps.config import config; config['data_dir']='$DUSTMAPS_DATA_DIR'; import dustmaps.sfd; dustmaps.sfd.fetch()"

# Train + bake the random-forest classifier pickles into $fleet_data.
RUN mkdir -p "$fleet_data" \
    && python -c "from fleet.classify import save_pickles; save_pickles(overwrite=True)" \
    && rm -rf /src

# Fail the build if the package or its baked models/maps don't load.
RUN python -c "import fleet.classify, glob, os; \
p=glob.glob(os.path.join(os.environ['fleet_data'],'main_late_*.pkl')); \
assert p, 'no RF pickles baked'; print('fleet ok:', len(p), 'main_late pickles')"

WORKDIR /work
CMD ["python"]
