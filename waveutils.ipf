#pragma rtGlobals=1		// Use modern global access method.

#ifndef WAVEUTILS_INCLUDE
#define WAVEUTILS_INCLUDE

#include "booleanutils"

Function Wave_appendRow(wave_in)
    // Add a new row to a wave and return the index of the new row
    Wave wave_in
    return Wave_appendRows(wave_in, 1)
End

Function Wave_appendRows(wave_in, number_rows_to_add)
    // Adds *number_rows_to_add* new rows to the end of the wave and
    // return the index of the first new row
    Wave wave_in
    Variable number_rows_to_add
    Variable last_row = Wave_getLastRowIndex(wave_in)
    InsertPoints/M=0 last_row+1, number_rows_to_add, wave_in
    return Wave_getLastRowIndex(wave_in)
End

Constant WAVEEXPAND_FACTOR = 0.1
Function Wave_expandRows(wave_in)
    // Adds a number of rows proportional to the total number of rows
    //   To mitigate memory fragmentation, add multiple rows at a time
    Wave wave_in
    Variable row_count = Wave_getRowCount(wave_in)
    Variable new_rows = row_count * WAVEEXPAND_FACTOR
    return Wave_appendRows(wave_in, new_rows)
End

Function Wave_getLastRowIndex(wave_in)
    Wave wave_in
    return Wave_getRowCount(wave_in) - 1
End

Function Wave_getRowCount(wave_in)
    Wave wave_in
    return DimSize(wave_in, 0)
End

Function Wave_getColumnCount(wave_in)
    Wave wave_in
    return DimSize(wave_in, 1)
End

Function/S Wave_getUniqueName(base_name)
    String base_name
    return UniqueName(base_name, 1, 0)
End

Function/WAVE Wave_getSubrange(wave_in, point_min, point_max)
	Wave wave_in
	Variable point_min, point_max
	
	Duplicate/FREE/R=[point_min,point_max] wave_in, wave_out
	return wave_out
End

Function/S Wave_getPath(wave_in)
    Wave wave_in
    return GetWavesDataFolder(wave_in, 2)
End

Function Wave2D_getColumnIndex(wave_in, onedim_index)
    // Return the column index in a 2D wave when given a 1D index
    Wave wave_in
    Variable onedim_index
    Variable row_count = Wave_getRowCount(wave_in)
    return floor(onedim_index / row_count)
End

Function Wave2D_getRowIndex(wave_in, onedim_index, col_index)
    // Return the row index in a 2D wave when given a 1D index
    Wave wave_in
    Variable onedim_index, col_index

    Variable row_count = Wave_getRowCount(wave_in)
    return (onedim_index - (col_index * row_count))
End

Function/WAVE Wave_getSliceByX(wave_in, start_x, end_x)
    Wave wave_in
    Variable start_x, end_x
    Duplicate/FREE/R=(start_x, end_x) wave_in, wave_out
    return wave_out
End

Function/WAVE Wave_getSlice(wave_in, start_pt, end_pt)
	Wave wave_in
	Variable start_pt, end_pt
	Duplicate/FREE/R=[start_pt, end_pt] wave_in, wave_out

    String wave_note = Note(wave_in)
    String point_str
    sprintf point_str, "%d,%d", start_pt, end_pt
    wave_note = Dict_addItem(wave_note, "Slice", point_str)
    Note/K wave_out, wave_note
    return wave_out
End

Function Wave_saveSliceByX(wave_in, start_x, end_x, waveout_name)
    Wave wave_in
    Variable start_x, end_x
    String waveout_name
    Wave_saveSlice(wave_in, x2pnt(wave_in, start_x), x2pnt(wave_in, end_x), waveout_name)
End

Function Wave_saveSlice(wave_in, start_pt, end_pt, waveout_name)
    Wave wave_in
    Variable start_pt, end_pt
    String waveout_name

    Wave wave_out = Wave_getSlice(wave_in, start_pt, end_pt)
    if (WaveExists($(waveout_name)))
        KillWaves $(waveout_name)
    endif
    MoveWave wave_out, $(waveout_name)
End

Function isWavesEqual(waveA, waveB)
    Wave waveA, waveB
    return EqualWaves(waveA, waveB, 7)
End

Function addWaves(waveA, waveB)
	Wave waveA, waveB
	waveB += waveA
End

// Make a new wave named *waveout_name* by reducing the sampling
// interval to *x_interval* and averaging over windows of size *x_avg*
// centered over each new point.
//
// Built-in functions like Resample are supposed to be able to handle
// this, but the options were confusing to me. See also the help topic
// "Decimation by Smoothing"
Function Wave_decimate(wave_in, x_interval, x_avg, waveout_name, [no_ends])
    Wave wave_in
    String waveout_name         // name of wave to save results to

    Variable x_interval         // interval (in x units) between
                                // points in new wave
    Variable x_avg              // size (in x units) of window to average
                                // over for each point
    Variable no_ends            // 

    if (ParamIsDefault(no_ends))
        no_ends = 0
    endif

    Variable orig_start = DimOffset(wave_in, 0)
    Variable orig_delta = DimDelta(wave_in, 0)
    Variable orig_size = DimSize(wave_in, 0)
    Variable orig_end = orig_size*orig_delta + orig_start

    Variable half_window = x_avg / 2
    // Do not allow upsampling or interval values of 0
    if (x_interval < orig_delta) 
        x_interval = orig_delta
    endif

    Variable new_start = orig_start
    Variable new_end = orig_end + x_interval
    if (no_ends > 0)
        new_start += half_window
        new_end -= half_window
    endif
    Variable new_size = floor(((new_end-new_start) / x_interval))

    Make/O/D/N=(new_size) $(waveout_name)
    Wave wave_out = $(waveout_name)
    SetScale/P x new_start, x_interval, WaveUnits(wave_in, 0), wave_out

    wave_out = mean(wave_in, x-half_window, x+half_window)
End

// Return a clipped copy of wave *wave_in* in a wave named
// *waveout_name* with values limited to the minimum value *min_y* and
// maximum value *max_y*. Values outside this range are clipped to
// *min_y* and *max_y*.
Function Wave_clip(wave_in, min_y, max_y, waveout_name)
    Wave wave_in
    Variable min_y, max_y
    String waveout_name

    Duplicate/O wave_in, $(waveout_name)
    Wave wave_out = $(waveout_name)
    wave_out = limit(wave_out, min_y, max_y)
End

// Return a clipped copy of wave *wave_in* in a wave named
// *waveout_name* with values limited to the minimum value *min_y* and
// maximum value *max_y*. Values outside this range are replaced with NaN.
Function Wave_clipToNaN(wave_in, min_y, max_y, waveout_name)
    Wave wave_in
    Variable min_y, max_y
    String waveout_name

    WaveSlice_clipToNaN(wave_in, 0, Wave_getRowCount(wave_in), min_y, max_y, waveout_name)
End

Function WaveSlice_clipToNaN(wave_in, start_pt, end_pt, min_y, max_y, waveout_name)
    Wave wave_in
    Variable start_pt, end_pt
    Variable min_y, max_y
    String waveout_name

    Wave_saveSlice(wave_in, start_pt, end_pt, waveout_name)
    Wave wave_out = $(waveout_name)
    wave_out = wave_out[p] < min_y ? NaN : wave_out[p]
    wave_out = wave_out[p] > max_y ? NaN : wave_out[p]
End

#endif
