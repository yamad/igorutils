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

Function isWavesEqual(waveA, waveB)
    Wave waveA, waveB
    return EqualWaves(waveA, waveB, -1)
End

Function addWaves(waveA, waveB)
	Wave waveA, waveB
	waveB += waveA
End

#endif
