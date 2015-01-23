===========
 igorutils
===========

Utility modules for WaveMetrics' `Igor Pro`_

`igorutils` provides a set of reusable modules with a consistent and
clear API for writing code in `Igor Pro`_.

Project Goals
=============

`Igor Pro`_ is a scientifc graphing and data analysis program that
includes extensive programming capabilities. Igor provides a set of
built-in functions and operations that are powerful. Unfortunately,
writing and reading code that uses this built-in API can be confusing
due to inconsistent naming and programming conventions.

`igorutils` is an attempt to make programming in Igor easier by:

  * encapsulating obscure syntax in a set of functions with consistent
    conventions and clear naming.
  * providing utiliies for general purposes, such as for working with
    units (`unitutils`) or lists of numbers (`rangespec`).

For example, using the built-in API, appending a row to an Igor wave
requires the following line of code::

 InsertPoints/M=0 numpnts(<wave>), 1, <wave>

Using the `igorutils` wave module, appending a row is more
straightforward::

 #include "waveutils"
 Wave_appendRow(<wave>)

.. _`Igor Pro`: http://www.wavemetrics.com
