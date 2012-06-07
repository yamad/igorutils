#ifndef RANGESPEC_INCLUDE
#define RANGESPEC_INCLUDE

#include "listutils"

// rangespec -- convenience functions for number ranges
//
// This module defines a range specification format, or *range_spec*,
// to make working with lists of numbers easy.
//
// A range spec is a string of the format "start-end:step" or a
// comma-separated list of range specs. *start*, *end*, and *step* are
// integers, specifying the start, end, and step interval of a number
// range. A range spec is passed to the function *RangeSpec_expand* to
// obtain the specified list of numbers.
//
//  * Single integers are valid range specs
//  * An end variable can be specified by a dash (-), followed by the desired ending integer
//  * A step variable can be speciifed by a colon (:), follwed by the desired step interval
//  * If the step variable is missing, a default step of 1 is used
//  * Multiple specs can be separated by commas. Repeated values are automatically pruned
//  * Descending ranges can be given by a negative step and a start
//  integer that is higher than the end integer
//
// Examples::
//
//     spec                    expanded
//     -----                   --------
//     1                -->    1
//     1-4              -->    1,2,3,4
//     1-4:1            -->    1,2,3,4
//     1-5:2            -->    1,3,5
//     1-4, 7-9         -->    1,2,3,4,7,8,9
//     1-4, 3-6         -->    1,2,3,4,5,6
//     4-1:-1           -->    4,3,2,1
//
// See also the unit tests in *tests/test_rangespec*


// Returns an expanded list of numbers specified by the range
// specification *range_spec*.
Function/S RangeSpec_expand(range_spec)
    String range_spec

    String out_list = ""
    Variable spec_count = List_getLength(range_spec, list_sep=",")
    Variable i
    for (i=0; i<spec_count; i+=1)
        String curr_spec = List_getItemByIndex(range_spec, i, list_sep=",")
        out_list = List_extend(out_list, RangeSpec_expandSingle(curr_spec))
    endfor
    return List_unique(out_list)
End

// Returns an expanded list for a single range spec. Cannot accept a
// comma-separated list. See *RangeSpec_expand*
Static Function/S RangeSpec_expandSingle(range_str)
    String range_str

    Variable num_start, num_end, step
    RangeSpec_splitParts(range_str, num_start, num_end, step)
    return expandRange(num_start, num_end, step=step)
End

// Split a range specification (start-end:step) into its start, end,
// and step components. num_start, num_end, and step are passed by
// reference and are filled as a side effect.
Static Function RangeSpec_splitParts(range_str, num_start, num_end, step)
    String range_str

    Variable &num_start, &num_end, &step

    String range_re = "^\\s*([+-]?\\d+)(?:-([+-]?\\d+)(?::([+-]?\\d+))?)?\\s*$"
    String start_str, end_str, int_str
    SplitString/E=range_re range_str, start_str, end_str, int_str

    if (strlen(end_str) == 0)
        end_str = start_str
    endif

    if (strlen(int_str) == 0)
        int_str = "1"
    endif
    
    num_start = str2num(start_str)
    num_end = str2num(end_str)
    step = str2num(int_str)
End

// Return a list with evenly spaced numbers from num_start to num_end
// in step intervals.
Static Function/S expandRange(num_start, num_end, [step])
    Variable num_start, num_end, step

    if (ParamIsDefault(step))
        step = 1
    endif

    String res = ""
    Variable curr_num

    if (num_start <= num_end)    // ascending range
        if (step <=  0)
            return res
        endif
        for (curr_num = num_start; curr_num <= num_end; curr_num += step)
            res = List_addItem(res, num2str(curr_num))
        endfor
    else                        // descending range
        if (step >= 0)
            return res
        endif
        for (curr_num = num_start; curr_num >= num_end; curr_num += step)
            res = List_addItem(res, num2str(curr_num))
        endfor
    endif
    return res
End

#endif