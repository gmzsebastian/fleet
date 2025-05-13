.. _usage:

Usage
=====

Basic Usage
-----------

The simplest way to use ``fleet`` is through the main function:

.. code-block:: python

    import fleet

    # Fit dust

This function will produce a plot with all diagnostics to determine if the transient is nuclear.

Requirements
------------

For ``fleet`` to work properly:

* The Photometry must be...

Core Functions
--------------

predict
~~~~~~~
The ``predict`` function fits the data:

.. code-block:: python

    from fleet.model import predict
    
    predict("2018hyz")

