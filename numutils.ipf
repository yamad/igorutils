#ifndef NUMUTILS_INCLUDE
#define NUMUTILS_INCLUDE

Function isNaN(var)
    Variable var
    if (numtype(var) == 2)
        return 1
    endif
    return 0
End

#endif