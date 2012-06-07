#include "IgorUnit"
#include "stringutils"

Function utest_String__trimfront()
    // String_trim -- trims whitespace from front
    String input = "\t  \n\r   foo"
    String expected = "foo"
    ASSERT_STREQ(expected, String_trim(input))
End

Function utest_String__trimback()
    // String_trim -- trims whitespace from back
    String input = "foo\t\n\r  "
    String expected = "foo"
    ASSERT_STREQ(expected, String_trim(input))
End

Function utest_String__trimboth()
    // String_trim -- trims whitespace from both sides
    String input = "   foo\t\n\r  "
    String expected = "foo"
    ASSERT_STREQ(expected, String_trim(input))
End

Function utest_String__nointernal()
    // String_trim -- does not trim internal whitespace
    String input = "   foo bar    \tbaz\t\n\r  "
    String expected = "foo bar    \tbaz"
    ASSERT_STREQ(expected, String_trim(input))
End

