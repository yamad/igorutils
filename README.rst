===========
 igorutils
===========

Utility modules for WaveMetrics' `Igor Pro`_

`igorutils` aims to provide a set of reusable modules that present a
consistent and clear API for writing code in `Igor Pro`_.

Project Goals
=============

`Igor Pro`_ is a scientifc graphing and data analysis program that
includes extensive programming capabilities. Igor provides a set of
built-in functions and operations that are powerful, but using these
facilities is often confusing due to inconsistent naming/usage
conventions that have crept into the Igor API over the
years. Unfortunately, writing and reading code that uses this built-in
API is much more difficult than it needs to be.

`igorutils` is an attempt to make programming in Igor easier by
encapsulating some of Igor's confusing syntax in a set of functions
with consistent conventions and clear naming.

For example, using the built-in API, appending a row to an Igor wave
requires the following line of code::

 InsertPoints/M=0 numpnts(<wave>), 1, <wave>

Using the `igorutils` wave module, appending a row is more
straightforward::

 #include "waveutils"
 Wave_appendRow(<wave>)

.. _`Igor Pro`: http://www.wavemetrics.com
