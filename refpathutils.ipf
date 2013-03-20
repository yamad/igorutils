#pragma rtGlobals=1

#ifndef REFPATHUTILS_INCLUDE
#define REFPATHUTILS_INCLUDE

#include "stringutils"

Function RefPath_isFull(rp)
    String rp
    rp = String_trim(rp)
    if (isStringsEqual("root", rp[0, 3]))
        return 1
    endif
    return 0
End

Function RefPath_isRelative(rp)
    String rp
    rp = String_trim(rp)
    if (isStringsEqual(":", rp[0]))
        return 1
    endif
    return 0
End

#endif