#ifndef DATAFOLDERUTILS_INCLUDE
#define DATAFOLDERUTILS_INCLUDE

#include "list"
#include "wave"

Function DataFolder_countWaves(df_ref)
    DFREF df_ref
    return CountObjectsDFR(df_ref, 1)
End

Function DataFolder_countSubfolders(df_ref)
	DFREF df_ref
	return CountObjectsDFR(df_ref, 4)
End

Function/S DataFolder_getWaveNameByIndex(df_ref, wave_idx)
    DFREF df_ref
    Variable wave_idx
    return GetIndexedObjNameDFR(df_ref, 1, wave_idx)
End

Function/S DataFolder_getDFNameByIndex(df_ref, df_idx)
    DFREF df_ref
    Variable df_idx
    return GetIndexedObjNameDFR(df_ref, 4, df_idx)
End

Function/WAVE DataFolder_getWaveByIndex(df_ref, wave_idx)
    DFREF df_ref
    Variable wave_idx
    String wave_name = DataFolder_getWaveNameByIndex(df_ref, wave_idx)
    return df_ref:$(wave_name)
End

Function/DF DataFolder_getDFByIndex(df_ref, df_idx)
    DFREF df_ref
    Variable df_idx
    String df_name = DataFolder_getDFNameByIndex(df_ref, df_idx)
    return df_ref:$(df_name)
End

Function/S DataFolder_getWaveList(df_ref)
    DFREF df_ref
    Variable wave_count = DataFolder_countWaves(df_ref)
    String wave_list = ""
    Variable i
    for (i=0; i<wave_count; i+=1)
        Wave currwave = DataFolder_getWaveByIndex(df_ref, i)
        wave_list = List_addItem(wave_list, Wave_getPath(currwave))
    endfor
    return wave_list
End

#endif