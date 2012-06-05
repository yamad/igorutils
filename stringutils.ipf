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

#endif