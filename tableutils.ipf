#pragma rtGlobals=3

#ifndef TABLEUTILS_INCLUDE
#define TABLEUTILS_INCLUDE

// Return the name of a new empty table named *table_name*. If no name
// is given, Igor automatically gives a name.
Function/S Table_create([table_name])
    String table_name
    if (ParamIsDefault(table_name))
        Edit
    else
        Edit as table_name
    endif
    return Table_getTopName()
End

Function/S Table_getTopName()
    return WinName(0, 2)
End

#endif