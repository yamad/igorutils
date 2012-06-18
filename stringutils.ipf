#ifndef STRINGUTILS_INCLUDE
#define STRINGUTILS_INCLUDE

#include "booleanutils"
#include "numutils"

Function isStringNull(in_string)
    String in_string
    if (isNaN(strlen(in_string)))
        return TRUE
    endif
    return FALSE
End

Function isStringExists(in_string)
    String in_string
    if (strlen(in_string) != 0 && !isStringNull(in_string))
        return TRUE
    endif
    return FALSE
End

Function isStringsEqual(stringA, stringB)
    String stringA, stringB
    if (cmpstr(stringA, stringB, 1) == 0)
        return TRUE
    endif
    return FALSE
End

Function isStringsEqual_NoCase(stringA, stringB)
    String stringA, stringB
    if (cmpstr(stringA, stringB, 0) == 0)
        return TRUE
    endif
    return FALSE
End

Function/S String_quoteForLiberalName(string_in)
    String string_in
    return PossiblyQuoteName(string_in)
End

Function/S String_getRegexMatch(string_in, regex)
    String string_in
    String regex

    String output
    SplitString/E=regex string_in, output
    return output
End

Function String_searchBack(string_in, find_str, [start])
    // Return index of last occurrence of `find_str` in `string_in`.
    //
    // Searches backwards from the end of `string_in`. Returns index
    // of first char of `find_str`, or -1 if no match is found.
    // Optional `start` parameter is the index to start the search
    // from. If missing, search starts from the end of the string.
    String string_in
    String find_str
    Variable start
    if (ParamIsDefault(start))
        start = Inf
    endif
    return strsearch(string_in, find_str, start, 1)
End

Function/S String_trim(string_in)
    String string_in

    String trim_re = "\\s*(\\S(?:.*\\S)?)\\s*"
    return String_getRegexMatch(string_in, trim_re)
End

#endif