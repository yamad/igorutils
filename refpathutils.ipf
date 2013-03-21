#pragma rtGlobals=1

/// refpathutils -- object reference path utilities
//
// This module provides the function `RefPath_resolve`. All
// interaction with this module should be through that single
// function.

#ifndef REFPATHUTILS_INCLUDE
#define REFPATHUTILS_INCLUDE

#include "listutils"
#include "stringutils"
#include "datafolderutils"

/// Return the full object reference path to a given object ref string
//
// This function can take any object reference path (full path,
// partial path, object name, or a path with backlinks (multiple colon
// syntax)). It will "do the right thing" and return the full object
// reference with respect to the current data folder. Note that, by
// design, no error checking is performed to ensure that the object
// reference actually exists.
//
// Backlink paths will resolve back to the root folder if too many
// backlinks are given.
Function/S RefPath_resolve(rp)
    String rp

    rp = String_trim(rp)

    String curr_dfs = DataFolder_currentPath()
    if (!RefPath_hasTrailingColon(curr_dfs))
        curr_dfs += ":"
    endif

    String result = ""
    if (RefPath_isFull(rp))
        result = rp
    elseif (RefPath_isRelative(rp))
        result = curr_dfs + rp[1, strlen(rp)-1]
        result = RefPath_handleBacks(result)
        result = RefPath_resolve(result)
    else                        // object name
        result = curr_dfs + rp
    endif

    return result
End

/// Returns true if path is full (absolute)
Function RefPath_isFull(rp)
    String rp
    rp = String_trim(rp)
    if (isStringsEqual("root", rp[0, 3]))
        return 1
    endif
    return 0
End

/// Returns true if path is relative to current data folder
Function RefPath_isRelative(rp)
    String rp
    rp = String_trim(rp)
    if (isStringsEqual(":", rp[0]))
        return 1
    endif
    return 0
End

// Returns true if path is an object name
Function RefPath_isObjName(rp)
    String rp
    rp = String_trim(rp)
    if (!RefPath_isFull(rp) && !RefPath_isRelative(rp))
        return 1
    endif
    return 0
End

Function/S RefPath_handleBacks(rp)
    String rp
    rp = String_trim(rp)

    String pre, backs, post
    String re = "(.*?:)(:+)(.*)"
    SplitString/E=re rp, pre, backs, post

    Variable back_count = strlen(backs)
    if (back_count == 0)
        return rp
    endif

    // too many backlinks resolves to root
    if (List_getLength(pre, list_sep=":") < back_count)
        pre = ""
    else
        Variable i
        for (i=0; i<back_count; i+=1)
            List_pop(pre, list_sep=":")
        endfor
    endif
    return pre + RefPath_handleBacks(post)
End

Function RefPath_hasTrailingColon(rp)
    String rp
    rp = String_trim(rp)
    if (isStringsEqual(":", rp[strlen(rp)-1]))
        return 1
    endif
    return 0
End


#endif