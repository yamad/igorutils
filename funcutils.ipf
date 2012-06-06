#ifndef STRINGUTILS_INCLUDE
#define STRINGUTILS_INCLUDE

#include "booleanutils"
#include "stringutils"
#include "dictutils"

Function isFunctionExists(in_funcname)
    String in_funcname
    if (exists(in_funcname) == 3 || exists(in_funcname) == 6)
        return TRUE
    endif
    return FALSE
End

// get comment immediately before procedure signature line
Function/S Func_getDocString(funcname)
    String funcname

    String proc_text = ProcedureText(funcname, -1)
    String docstr_re = "^((?:\\s*//\\s*.*?\\r)+)"
    String out = String_getRegexMatch(proc_text, docstr_re)
    return out
End

// get comment immediately after procedure signature line
Function/S Func_getPostDocString(funcname)
    String funcname

    String proc_text = ProcedureText(funcname)
    String docstr_re = "^Function.*?\\r((?:\\s*//\\s*.*?\\r)+)"
    String out = String_getRegexMatch(proc_text, docstr_re)
    return out
End

Function/S Func_getFilename(funcname)
    String funcname
    String funcinfo = FunctionInfo(funcname)
    return Dict_getItem(funcinfo, "PROCWIN")
End

Function Func_getLineNumber(funcname)
    String funcname
    String funcinfo = FunctionInfo(funcname)
    return str2num(Dict_getItem(funcinfo, "PROCLINE"))
End

#endif