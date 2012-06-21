#ifndef WAVELIST_INCLUDE
#define WAVELIST_INCLUDE

#include "waveutils"

Function/S WaveList_getByPrefix(prefix)
    String prefix
    return WaveList_getByPattern(prefix+"*")
End

Function/S WaveList_getBySuffix(suffix)
    String suffix
    return WaveList_getByPattern("*"+suffix)
End

Function/S WaveList_getByPattern(pattern)
    String pattern

    String wave_names = WaveList(pattern, ";", "")

    String fullpath_list = ""
    Variable wave_count = List_getLength(wave_names)
    Variable i
    for (i=0; i<wave_count; i+=1)
        Wave currwave = $(List_getItem(wave_names, i))
        String fullpath = Wave_getPath(currwave)
        fullpath_list = List_addItem(fullpath_list, fullpath)
    endfor
    return fullpath_list
End

Function/S WaveList_getByPatternFromDF(df_name, pattern)
    String df_name
    String pattern

    DFREF savedDFR = GetDataFolderDFR()  // save current folder for restore
    SetDataFolder $(df_name)
    String wave_list = WaveList_getByPattern(pattern)
    SetDataFolder savedDFR
    return wave_list
End

Function/S WaveList_filterByNoteKeyValue(wave_list, key, value)
    String wave_list
    String key, value

    Variable wave_count = List_getLength(wave_list)
    Variable i
    String new_list = ""
    for (i=0; i<wave_count; i+=1)
        String wave_name = List_getItem(wave_list, i)
        String wave_note = Note($(wave_name))
        if (Dict_hasItem(wave_note, key, value))
            new_list = List_addItem(new_list, wave_name)
        endif
    endfor
    return new_list
End

Function WaveList_isAllEqual(wave_list)
    // Return true if all waves in the wave list are equal
    String wave_list
    Variable wave_count = List_getLength(wave_list)

    if (wave_count == 0)        // an empty list is equal
        return TRUE
    endif

    Wave waveA = $(List_getItem(wave_list, 0))
    Variable i
    for (i=1; i<wave_count; i+=1)
        Wave waveB = $(List_getItem(wave_list, i))
        if (!isWavesEqual(waveA, waveB))
            return FALSE
        endif
    endfor
    return TRUE
End

Function WaveList_display(wave_list, [graph_name])
    String wave_list
    String graph_name

    if (ParamIsDefault(graph_name))
        graph_name = Graph_create()
    else
        graph_name = Graph_create(graph_name=graph_name)
    endif
    WaveList_appendToGraph(wave_list, graph_name=graph_name)
End

Function WaveList_appendToGraph(wave_list, [graph_name])
    String wave_list
    String graph_name

    if (ParamIsDefault(graph_name))
        graph_name = Graph_getTopName()
    endif

    Variable wave_count = List_getLength(wave_list)
    Variable i
    for (i=0; i<wave_count; i+=1)
        Wave currwave = $(List_getItem(wave_list, i))
        AppendToGraph/W=$(graph_name) currwave
    endfor
End

Function WaveList_average(wave_list, outwave_name)
	// Return a wave called `outwave_name` containing the average
	// across all waves in a list of waves
	String wave_list, outwave_name

	Algo_ApplyToWaveListAndRetWave(wave_list, outwave_name, addWaves)
	Wave outwave = $outwave_name

	Variable wave_count = List_getLength(wave_list)
	outwave /= wave_count

	//String outwave_note
	//sprintf outwave_note, "AveragedWaves:%s", wave_list
	//Note/K outwave, outwave_note
End

Function WaveList_averageSubrange(wave_list, outwave_name, point_min, point_max)
	// Return a wave called `outwave_name` containing the average of the
	// subrange [point_min, point_max] across all waves in a list of waves
	String wave_list, outwave_name
	Variable point_min, point_max

	WaveList_average(wave_list, outwave_name)
	Wave outwave = $outwave_name

	Wave outwave_slice = Wave_getSlice(outwave, point_min, point_max)
	Duplicate/O outwave_slice, outwave
End

Function Algo_ApplyToWaveListAndRetWave(wave_list, outwave_name, func)
	// An algorithm encapsulation function that iterates over a list of waves, applying
	// a function to each wave in turn, and creates an output wave with the result
	//
	// The function `func` must return a wave reference and take the input and output waves
	// as wave references, in that order. See `protofunc_inoutwave` for the function prototype
	String wave_list
	String outwave_name
	FUNCREF protofunc_inoutwave func

	String currwave_name
	currwave_name = List_getItem(wave_list, 0)

    Duplicate/O $(currwave_name) $(outwave_name)
	Wave outwave = $(outwave_name)
	outwave = 0

	Variable wave_count = List_getLength(wave_list)
	Variable i
	for (i = 0; i < wave_count; i += 1)
		currwave_name = List_getItem(wave_list, i)
		Wave curr_wave = $currwave_name
		if (!WaveExists(curr_wave))
			break
		endif
		func(curr_wave, outwave)
	endfor
	return outwave
End

Function protofunc_inoutwave(wave_in, wave_out)
	WAVE wave_in
	WAVE wave_out
End

#endif