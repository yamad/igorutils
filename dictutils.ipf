#pragma rtGlobals=1		// Use modern global access method.

// dictutils - Utility functions to work with a dictionary (a string containing key:value pairs)

#ifndef DICTUTILS_INCLUDE
#define DICTUTILS_INCLUDE

#include "list"

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

#endif