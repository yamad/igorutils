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

Function utest_String__searchback()
    // String_searchBack -- finds last occurrence of a string
    String input = "A A A "
    EXPECT_EQ(4, String_searchBack(input, "A"))
    EXPECT_EQ(2, String_searchBack(input, "A", start=3))
    EXPECT_EQ(0, String_searchBack(input, "A", start=1))
End

Function utest_String__searchbackempty()
    // String_searchBack -- returns -1 if no match
    String input = "A A A "
    ASSERT_EQ(-1, String_searchBack(input, "B"))
End

