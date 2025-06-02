# import os
# import pytest
# import numpy as np
from fleet.model import (d_linex)


def test_d_linex():
    # Check that the get data returns None
    output = d_linex(1, 1, 1)
    assert output is not None
