.. image:: images/fleet.png
   :alt: fleet logo
   :width: 200px
   :align: center
   
FLEET
=====

``fleet`` is a Python package for FLEET, the *Finding Luminous and Exotic Extragalactic Transients* machine learning algorithm desgined to find the most likely superluminous supernovae (SLSNe) and tidal disruption events (TDEs) from transient surveys.

.. toctree::
   :maxdepth: 2
   :caption: User Guide

   installation
   usage
   methodology

Requirements
------------

* Python 3.7 or later
* Having the ``emcee`` package installed
* Having a PanSTARRS key
* Having a TNS key

See :ref:`installation` for detailed setup instructions.

Citation
--------

If you use FLEET, please cite the `original paper <https://ui.adsabs.harvard.edu/abs/2020ApJ...904...74G>`_ describing the algorithm and its application to superluminous supernovae (SLSNe).

If you use FLEET to search for TDEs, please cite the `TDE paper <https://ui.adsabs.harvard.edu/abs/2023ApJ...949..113G>`_ describing the algorithm and its application to tidal disruption events (TDEs).

The first two years of operations in search paperfor SLSNe can be found in the `updated paper <https://arxiv.org/abs/2210.10811>`_.

License & Attribution
---------------------

Copyright 2024 Sebastian Gomez and `contributors <https://github.com/gmzsebastian/fleet/graphs/contributors>`_.
``fleet`` is free software made available under the MIT License.