#pragma rtGlobals=1		// Use modern global access method.

// graphutils - utilities for working with Igor graphs

#ifndef GRAPHUTILS_INCLUDE
#define GRAPHUTILS_INCLUDE

Function/S Graph_getListAll()
    return WinList("*", ";", "WIN:1")
End

Function/S Graph_getTopName()
    return List_getItemByIndex(Graph_getListAll(), 0)
End

// Return the name of a new empty graph named *graph_name*. If no name
// is given, Igor automatically gives a name.
Function/S Graph_create([graph_name])
    String graph_name
    if (ParamIsDefault(graph_name))
        Display
    else
        Display as graph_name
    endif
    return Graph_getTopName()
End

#endif