#pragma rtGlobals=1		// Use modern global access method.

// dictutils - Utility functions to work with a dictionary (a string containing key:value pairs)

#ifndef DICTUTILS_INCLUDE
#define DICTUTILS_INCLUDE

#include "listutils"
#include "stringutils"

Strconstant KEYSEP = ":"

Function/S Dict_addItem(dict, key, value)
    String dict
    String key
    String value
    return ReplaceStringByKey(key, dict, value)
End

Function/S Dict_getItem(dict, key)
    String dict
    String key
    return StringByKey(key, dict)
End

Function/S Dict_removeItem(dict, key)
    String dict
    String key
    return RemoveByKey(key, dict)
End

Function/S Dict_getPairByIndex(dict, index)
    String dict
    Variable index
    return List_getItem(dict, index)
End

Function/S Dict_getKeyByIndex(dict, index, [key_sep, list_sep])
    String dict
    Variable index
    String key_sep, list_sep

    if (ParamIsDefault(key_sep))
        key_sep = KEYSEP
    endif
    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    String pair = Dict_getPairByIndex(dict, index)
    return pair[0,strsearch(pair,key_sep,0)]
End

Function/S Dict_getKeys(dict)
    String dict
    Variable item_count = Dict_getLength(dict)
    String key_list = ""
    Variable i
    for (i=0; i<item_count; i+=1)
        key_list = List_addItem(key_list, Dict_getKeyByIndex(dict, i))
    endfor
    return key_list
End

Function Dict_getLength(dict)
    String dict
    return List_getLength(dict)
End

Function Dict_hasItem(dict, key, value)
    String dict
    String key, value

    String item = Dict_getItem(dict, key)
    if (isStringsEqual(item, value))
        return TRUE
    endif
    return FALSE
End

Function Dict_hasKey(dict, key)
    String dict
    String key
    if (isStringExists(Dict_getItem(dict, key)))
        return TRUE
    endif
    return FALSE
End

Function/S Dict_convertKeySep(dict, old_sep, [new_sep, list_sep])
    String dict
    String old_sep
    String new_sep
    String list_sep

    if (ParamIsDefault(new_sep))
        new_sep = KEYSEP
    endif

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif

    // if separators are the same, nothing to do
    if (isStringsEqual(old_sep, new_sep))
        return dict
    endif

    Variable pair_count = List_getLength(dict, list_sep=list_sep)

    Variable i
    String dict_out = ""
    for (i = 0; i < pair_count; i += 1)
        String curr_pair = List_getItem(dict, i, list_sep=list_sep)
        curr_pair = ReplaceString(old_sep, curr_pair, new_sep, 0, 1)
        dict_out = List_addItem(dict_out, curr_pair, list_sep=list_sep)
    endfor
    return dict_out
End

#endif