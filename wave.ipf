#pragma rtGlobals=1		// Use modern global access method.

#ifndef WAVEUTILS_INCLUDE
#define WAVEUTILS_INCLUDE

Function Wave_appendRow(wave_in)
    // Add a new row to a wave and return the index of the new row
    Wave wave_in
    Variable rowCount = Wave_getRowCount(wave_in)
    InsertPoints/M=0 rowCount, 1, wave_in
    return Wave_getRowCount(wave_in)
End

Function Wave_getRowCount(wave_in)
    Wave wave_in
    return DimSize(wave_in, 0)
End

Function Wave_getColumnCount(wave_in)
    Wave wave_in
    return DimSize(wave_in, 1)
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

#endif