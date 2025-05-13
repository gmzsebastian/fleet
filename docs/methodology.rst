.. _methodology:

Methodology
===========

The core of ``fleet`` is handled by ``predict``.


Predict
-------

This is how dust works.

Models
~~~~~~

These are models.

.. math::

   f(r|\nu,\sigma) = \frac{r}{\sigma^2} \exp\left(-\frac{r^2 + \nu^2}{2\sigma^2}\right) I_0\left(\frac{r\nu}{\sigma^2}\right)

where:

* :math:`r` is the measured separation
* :math:`\nu` is the true separation
* :math:`\sigma` is the measurement uncertainty
* :math:`I_0` is the modified Bessel function of the first kind with order zero

.. _example:

.. figure:: images/2020kn.png
   :alt: Example
   :align: center
   :width: 100%

   **This is an example.** This is the example.
