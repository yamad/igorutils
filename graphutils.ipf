#pragma rtGlobals=1		// Use modern global access method.

// graphutils - utilities for working with Igor graphs

#ifndef GRAPHUTILS_INCLUDE
#define GRAPHUTILS_INCLUDE

#include "waveutils"
#include "colorutils"

Function/S Graph_getListAll()
    return WinList("*", ";", "WIN:1")
End

Function/S Graph_getTopName()
    return WinName(0, 1)
//    return List_getItemByIndex(Graph_getListAll(), 0)
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
    // Return list of axes in the given graph. If string `type` is
    // specified, return only axes of the given type.
    //
    // `type` may be one of: left, right, top, bottom, vertical,
    // horizontal. Any other string passed to `type` acts as if no
    // type were specified.
    String graph_name
    String type

    String accepted_types = "left;right;top;bottom;vertical;horizontal;"

    String axlist = AxisList(graph_name)
    // return full list, if no type is specified
    if (ParamIsDefault(type) || !List_hasItem(accepted_types, type))
        return axlist
    endif

    String filtered_list = ""
    String filter_types = ""
    if (isStringsEqual("vertical", type))
        filter_types = "left;right;"
    elseif (isStringsEqual("horizontal", type))
        filter_types = "top;bottom;"
    else
        filter_types = type
    endif

    Variable list_len = List_getLength(axlist)
    Variable i
    for (i=0; i<list_len; i+=1)
        String caxis = List_getItem(axlist, i)
        String axinfo = AxisInfo(graph_name, caxis)
        String axtype = Dict_getItem(axinfo, "AXTYPE")
        if (List_hasItem(filter_types, axtype))
            filtered_list = List_addItem(filtered_list, caxis)
        endif
    endfor
    return filtered_list
End

Function/S Graph_getTraceList([graph_name, xaxis, yaxis])
    // Return list of traces in a graph, optionally specified by axis
    String graph_name
    String xaxis, yaxis

    if (ParamIsDefault(graph_name))
        graph_name = Graph_getTopName()
    endif
    if (ParamIsDefault(xaxis) || isStringsEqual(xaxis, "all"))
        xaxis = ""
    endif
    if (ParamIsDefault(yaxis) || isStringsEqual(yaxis, "all"))
        yaxis = ""
    endif

    String trace_list = TraceNameList(graph_name, ";", 1)
    // return full list if no filters are specified
    if (!isStringExists(xaxis) && !isStringExists(yaxis))
        return trace_list
    endif

    String filtered_list = ""
    Variable list_len = List_getLength(trace_list)
    Variable i
    for (i=0; i<list_len; i+=1)
        String ctrace = List_getItem(trace_list, i)
        String tinfo = TraceInfo(graph_name, ctrace, 0)
        String cxaxis = Dict_getItem(tinfo, "XAXIS")
        String cyaxis = Dict_getItem(tinfo, "YAXIS")
        if (!isStringExists(xaxis) || isStringsEqual(xaxis, cxaxis))
            if (!isStringExists(yaxis) || isStringsEqual(yaxis, cyaxis))
                filtered_list = List_addItem(filtered_list, ctrace)
            endif
        endif
    endfor
    return filtered_list
End

Function/S Graph_getVisibleTraceList([graph_name, xaxis, yaxis])
    String graph_name
    String xaxis, yaxis

    if (ParamIsDefault(graph_name))
        graph_name = Graph_getTopName()
    endif
    if (ParamIsDefault(xaxis) || isStringsEqual(xaxis, "all"))
        xaxis = ""
    endif
    if (ParamIsDefault(yaxis) || isStringsEqual(yaxis, "all"))
        yaxis = ""
    endif

    String filtered_traces = Graph_getTraceList(graph_name=graph_name, xaxis=xaxis, yaxis=yaxis)
    String visible_traces = TraceNameList(graph_name, ";", 1+4)

    String result = ""
    Variable i
    Variable len = List_getLength(filtered_traces)
    for (i=0; i<len; i+=1)
        String tracename = List_getItem(filtered_traces, i)
        if (WhichListItem(tracename, visible_traces) != -1)
            result = List_addItem(result, tracename)
        endif
    endfor
    return result
End

Function Graph_colorTraces(palette, [graph_name, xaxis, yaxis])
    String palette
    String graph_name
    String xaxis
    String yaxis

    if (ParamIsDefault(graph_name))
        graph_name = Graph_getTopName()
    endif
    if (ParamIsDefault(xaxis) || isStringsEqual(xaxis, "all"))
        xaxis = ""
    endif
    if (ParamIsDefault(yaxis) || isStringsEqual(yaxis, "all"))
        yaxis = ""
    endif

    String trace_list = Graph_getTraceList(graph_name=graph_name, xaxis=xaxis, yaxis=yaxis)
    Variable i, j
    Variable trace_count = List_getLength(trace_list)
    Variable color_count = List_getLength(palette)

    for (i=0; i<trace_count; i+=1)
        Variable color = str2num(List_getItem(palette, mod(i,color_count)))
        String trace = List_getItem(trace_list, i)
        ModifyGraph/W=$graph_name rgb($trace)=(hexcolor_red(color), hexcolor_green(color), hexcolor_blue(color))
    endfor
End



#endif