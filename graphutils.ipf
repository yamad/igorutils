#pragma rtGlobals=1		// Use modern global access method.

// graphutils - utilities for working with Igor graphs

#ifndef GRAPHUTILS_INCLUDE
#define GRAPHUTILS_INCLUDE

#include "waveutils"

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

Function GraphLine_createFromWave(wave_in, waveout_name)
    Wave wave_in
    String waveout_name

    Duplicate/O/R=[0,1] wave_in, $(waveout_name)
    Wave wave_out = $(waveout_name)
    SetScale/I x Wave_getFirstX(wave_in), Wave_getLastX(wave_in), wave_out
End

Function/S Graph_getAxisList(graph_name, [type])
    String graph_name
    String type

    if (ParamIsDefault(type))
        type = "all"
    endif

    String axlist = AxisList(graph_name)
    String filtered_list = ""
    if (List_hasItem("left;right;top;bottom;", type))
        Variable list_len = List_getLength(axlist)
        Variable i
        for (i=0; i<list_len; i+=1)
            String caxis = List_getItem(axlist, i)
            String axinfo = AxisInfo(graph_name, caxis)
            String axtype = Dict_getItem(axinfo, "AXTYPE")
            if (isStringsEqual(axtype, type))
                filtered_list = List_addItem(filtered_list, caxis)
            endif
        endfor
        axlist = filtered_list
    endif
    return axlist
End

#endif