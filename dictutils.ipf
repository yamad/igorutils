#pragma rtGlobals=1		// Use modern global access method.

// dictutils - Utility functions to work with a dictionary (a string containing key:value pairs)

#ifndef DICTUTILS_INCLUDE
#define DICTUTILS_INCLUDE

#include "booleanutils"
#include "listutils"
#include "stringutils"

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

#endif