#ifndef STRINGUTILS_INCLUDE
#define STRINGUTILS_INCLUDE

#include "booleanutils"

Function isFunctionExists(in_funcname)
    String in_funcname
    if (exists(in_funcname) == 3 || exists(in_funcname) == 6)
        return TRUE
    endif
    return FALSE
End

#endif