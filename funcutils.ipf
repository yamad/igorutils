#ifndef STRINGUTILS_INCLUDE
#define STRINGUTILS_INCLUDE

#include "dictutils"

Function isFunctionExists(in_funcname)
    String in_funcname
    if (exists(in_funcname) == 3 || exists(in_funcname) == 6)
        return TRUE
    endif
    return FALSE
End

Function/S Func_getDocString(funcname)
    // Get comment immediately before procedure signature line
    //
    // ProcedureText(x, -1) returns *all* lines before the procedure
    // and removes blank lines. This makes for strange behavior that
    // will return unexpected lines such as #include lines and
    // comments that aren't directly related even if separated by
    // blank lines. For this reason, :func:`Func_getPostDocString` is
    // preferred.
    String funcname

    String proc_text = ProcedureText(funcname, -1)
    String docstr_re = "\\s*((?:[\\t ]*//[\\t ]*[^\\r]*?\\r)+)"
    String out = String_getRegexMatch(proc_text, docstr_re)
    return String_trim(out)
End

Function/S Func_getPostDocString(funcname)
    // Get comment immediately after procedure signature line
    String funcname

    String proc_text = ProcedureText(funcname)
    String docstr_re = "^Function.*?\\r((?:[\\t ]*//[\\t ]*[^\\r]*\\r)+)"
    String out = String_getRegexMatch(proc_text, docstr_re)
    return String_trim(out)
End

Function/S Func_getFilename(funcname)
    // Get filename of file containing function name `funcname`
    String funcname
    String funcinfo = FunctionInfo(funcname)
    return Dict_getItem(funcinfo, "PROCWIN")
End

Function Func_getLineNumber(funcname)
    // Get first line number of the function name `funcname` in the file
    String funcname
    String funcinfo = FunctionInfo(funcname)
    return str2num(Dict_getItem(funcinfo, "PROCLINE"))
End

#endif