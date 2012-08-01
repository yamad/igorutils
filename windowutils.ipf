#pragma rtGlobals=1

// windowutils - utilities for working with Igor windows (panels, graphs, etc)

#ifndef WINDOWUTILS_INCLUDE
#define WINDOWUTILS_INCLUDE

#include "stringutils"

Static Strconstant SUBWIN_SEP = "#"

Function/S Window_getParentName(window_name)
    // Returns the name of the immediate parent window or an empty
    // string if none exists. Will return empty if a relative path is
    // passed
    String window_name

    // find last subwindow separator
    Variable sep2 = String_searchBack(window_name, SUBWIN_SEP)
    // relative path or no parent in window name
    if (sep2 <= 0)
        return ""
    endif

    // find penultimate subwindow separator
    //
    // the string indexing works even if no other separator exists,
    // b/c sep1+1 will be 0
    Variable sep1 = String_searchBack(window_name, SUBWIN_SEP, start=sep2-1)
    return window_name[sep1+1, sep2-1]
End

Function/S Window_getListAll()
    return WinList("*", ";", "")
End

#endif