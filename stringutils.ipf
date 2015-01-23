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

Function/S String_findRegex(string_in, regex)
    String string_in
    String regex

    String full_regex = regex + "(.*)" // capture rest of string
                                       // in last subpattern
    String match = "", rest = ""
    String res = ""

    do
        SplitString/E=(full_regex) string_in, match, rest
        if (strlen(match) == 0)
            break
        endif
        string_in = rest
        res = List_addItem(res, match)
    while(1)
    return res
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

/// Returns the length of the shared prefix of strings str1 and str2.
//
// code ported from JUnit (http://github.com/junit-team/junit)
Function String_findCommonPrefix(str1, str2)
    String str1, str2

    Variable len = min(strlen(str1), strlen(str2))
    Variable res
    for (res=0; res < len; res+=1)
        if (!isStringsEqual(str1[res], str2[res]))
            break
        endif
    endfor
    return res
End

/// Returns the length of the shared suffix of strings str1 and str2.
Function String_findCommonSuffix(str1, str2)
    String str1, str2

    Variable len = min(strlen(str1), strlen(str2))
    Variable res
    for (res=len; res > 0; res-=1)
        if (!isStringsEqual(str1[res-1], str2[res-1]))
            break
        endif
    endfor
    return (len - res)
End

#endif