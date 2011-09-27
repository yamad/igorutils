===========
 igorutils
===========

:Author: Jason Yamada-Hanff <jyamada1@gmail.com>

Utility modules for WaveMetrics' `Igor Pro`_

`igorutils` aims to provide a set of reusable modules that present a
consistent and clear API for code written using `Igor Pro`_.

Project Goals
=============

`Igor Pro`_ is a scientifc graphing and data analysis program that
includes extensive programming capabilities. Igor provides a set of
built-in functions and operations that are powerful but often
confusing due to inconsistent conventions. Thus, writing and reading
code that uses this built-in API is much more difficult than it needs
to be.

`igorutils` is an attempt to make programming in Igor easier by
encapsulating some of Igor's confusing syntax in a set of functions
with consistent conventions and clear naming.

For example, to add a row to the end of an Igor wave using the
built-in API requires the following line of code::

 InsertPoints/M=0 numpnts(<wave>), 1, <wave>

Using the `igorutils` wave module, the magic numbers in the built-in
expression disappear and the intent of the function is clearer::

 Wave_appendRow(<wave>)

.. _`Igor Pro`: http://www.wavemetrics.com
