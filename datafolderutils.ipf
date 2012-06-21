#ifndef DATAFOLDERUTILS_INCLUDE
#define DATAFOLDERUTILS_INCLUDE

#include "waveutils"

Function/DF DataFolder_create(dfpath, [overwrite])
    String dfpath
    Variable overwrite

    if (ParamIsDefault(overwrite))
        overwrite = 0
    endif

    if (overwrite)
        NewDataFolder/O $(dfpath)
    else
        if (DataFolderExists(dfpath))
            String err_msg
            sprintf err_msg, "Given data folder (%s) already exists", dfpath
            Abort err_msg
        endif
        NewDataFolder $(dfpath)
    endif

    DFREF df_ref = $(dfpath)
    return df_ref
End

Function/DF DataFolder_getDFRfromPath(dfpath)
    String dfpath
    if (!DataFolderExists(dfpath))
        Abort "Given data folder does not exist"
    endif
    DFREF df_ref = $(dfpath)
    return df_ref
End

Function/DF DataFolder_createOrGet(dfpath)
    String dfpath
    if (!DataFolderExists(dfpath))
        return DataFolder_create(dfpath)
    else
        return DataFolder_getDFRfromPath(dfpath)
    endif
End

// Determine if the wave at refpath exists. If it does, then that wave
// contains one point which stores a DFREF are located. If this wave
// does not exist then initialize it.
Function/DF DataFolder_createOrGetHidden(refpath)
    String refpath
    Wave/DF/Z df_ptr = $(refpath)
    if (!WaveExists(df_ptr) || (DataFolderRefStatus(df_ptr[0]) == 0))
        Make/O/N=1/DF $(refpath)
        Wave/DF df_ptr = $(refpath)
        df_ptr[0] = NewFreeDataFolder()
    endif
    return df_ptr[0]
End

Function isDataFolderExists(df_ref)
    DFREF df_ref

    if (DataFolderRefStatus(df_ref) != 0)
        String df_path = DataFolder_getPath(df_ref)
        if (isStringExists(df_path) && DataFolderExists(df_path))
            return TRUE
        endif
    endif
    return FALSE
End

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