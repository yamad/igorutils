===========
 igorutils
===========

Utility modules for WaveMetrics' `Igor Pro`_

`igorutils` provides a set of reusable modules that provide a more
consistent API for writing code in `Igor Pro`_.

Project Goals
=============

`Igor Pro`_ is a popular scientifc graphing and data analysis
program. Igor provides a powerful set of built-in functions and
operations, but the API is somewhat inconsistent.

`igorutils` makes programming in Igor easier by providing:

  * more consistent conventions and clearer names for common tasks
  * data structures like lists, dictionaries/maps, and sets
  * general purpose utilities (see below)

For example, to append a row to an Igor wave using the built-in API,
you would write::

 InsertPoints/M=0 numpnts(<wave>), 1, <wave>

With the `igorutils` wave module, the code is clearer::

 #include "waveutils"
 Wave_appendRow(<wave>)

Some particularly useful features
=================================

 * `rangespec` -- a flexible format for specifying number ranges
   (e.g. `1-3` --> `1;2;3`). particularly useful for specifying a
   subset of items in a list.
 * `unit` -- SI units/prefixes and common derived
   units. (e.g. `Unit_scaleWave(<wave>, 'pA')` will correctly rescale
   wave values and units to picoamperes, and yell at you if you
   provide incompatible units)
 * `refpath` -- easy object references. very useful for working across data folders
 * `color` -- nice color palettes from `D3`_ and `ColorBrewer`_. apply
   a palette to all the lines in a graph with
   `Graph_colorTraces(<palette>, [<graph>])`.
 * `List_compact` and `List_expand` -- simple
   compression/decompression of a list by prefix
   (e.g. "wave1;wave2;wave3" --> "wave{1;2;3}"). originally designed
   to fit long lists into wave notes.
 * `Wave_store` -- save a wave to a given location. This is harder
   to get right than it seems. Particularly useful for saving free
   waves and in conjuction with `refpath` utilities
 * `wavelist` -- convenient creation and handling of lists of wave
   (e.g. `WaveList_average(<list>, <output_path>)` stores a wave at
   `output_path` containing the average across waves in the `list`)

See the documentation in the code and the tests for more information.

A note on lists and dictionaries: these data structures are
implemented as strings in Igor and so have the performance
characteristics of strings. This is the representation the built-in
Igor API encourages and `igorutils` therefore adopts it. An
`igorutils` "list" is the same as an Igor "list", just with added
semantics and conveniences. Likewise for dictionaries.

.. _`Igor Pro`: http://www.wavemetrics.com
.. _`D3`: http://d3js.org
.. _`ColorBrewer`: http://colorbrewer2.org
