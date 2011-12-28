#ifndef DATAFOLDERUTILS_INCLUDE
#define DATAFOLDERUTILS_INCLUDE

#include "listutils"
#include "waveutils"

Function DataFolder_countWaves(df_ref)
    DFREF df_ref
    return CountObjectsDFR(df_ref, 1)
End

Function DataFolder_countSubfolders(df_ref)
	DFREF df_ref
	return CountObjectsDFR(df_ref, 4)
End

Function/S DataFolder_getPath(df_ref)
    DFREF df_ref
    return GetDataFolder(1, df_ref)
End

Function/S DataFolder_getWaveNameByIndex(df_ref, wave_idx)
    DFREF df_ref
    Variable wave_idx
    String parent_path = DataFolder_getPath(df_ref)
    String wave_name = GetIndexedObjNameDFR(df_ref, 1, wave_idx)
    wave_name = String_quoteForLiberalName(wave_name)
    if (!isStringExists(wave_name))
        return ""
    endif
    return parent_path + wave_name
End

Function/S DataFolder_getDFNameByIndex(df_ref, df_idx)
    DFREF df_ref
    Variable df_idx
    String parent_path = DataFolder_getPath(df_ref)
    String df_name = GetIndexedObjNameDFR(df_ref, 4, df_idx)
    df_name = String_quoteForLiberalName(df_name)
    if (!isStringExists(df_name))
        return ""
    endif
    return parent_path + df_name
End

Function/WAVE DataFolder_getWaveByIndex(df_ref, wave_idx)
    DFREF df_ref
    Variable wave_idx
    String wave_name = DataFolder_getWaveNameByIndex(df_ref, wave_idx)
    return $(wave_name)
End

Function/DF DataFolder_getDFByIndex(df_ref, df_idx)
    DFREF df_ref
    Variable df_idx
    String df_name = DataFolder_getDFNameByIndex(df_ref, df_idx)
    return $(df_name)
End

Function/S DataFolder_getWaveList(df_ref)
    DFREF df_ref
    Variable wave_count = DataFolder_countWaves(df_ref)
    String wave_list = ""
    Variable i
    for (i=0; i<wave_count; i+=1)
        String currwave_name = DataFolder_getWaveNameByIndex(df_ref, i)
        wave_list = List_addItem(wave_list, currwave_name)
    endfor
    return wave_list
End

Function/S DataFolder_getSubfolderList(df_ref)
    DFREF df_ref
    Variable folder_count = DataFolder_countSubfolders(df_ref)
    String folder_list = ""
    Variable i
    for (i=0; i<folder_count; i+=1)
        String currdf_name = DataFolder_getDFNameByIndex(df_ref, i)
        folder_list = List_addItem(folder_list, currdf_name)
    endfor
    return folder_list
End

#endif