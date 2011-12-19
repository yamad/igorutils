#ifndef STRINGUTILS_INCLUDE
#define STRINGUTILS_INCLUDE

Function isStringExists(in_string)
    String in_string
    if (strlen(in_string) != 0)
        return 1
    endif
    return 0
End

Function isStringsEqual(stringA, stringB)
    String stringA, stringB
    if (cmpstr(stringA, stringB, 1) == 0)
        return 1
    endif
    return 0
End

Function/S String_quoteForLiberalName(string_in)
    String string_in
    return PossiblyQuoteName(string_in)
End

#endif