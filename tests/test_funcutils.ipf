#include "IgorUnit"
#include "funcutils"

// test comment
Function utest_getDocString__single_line()
    // _getDocString -- gets a single line comment preceding the function
    String expected = "// test comment"
    ASSERT_STREQ(expected, Func_getDocString("utest_getDocString__single_line"))
End

#include "IgorUnit"
// test comment
Function utest_getDocString__noincludes()
    // _getDocString -- ignores includes if preceding commment
    String expected = "// test comment"
    ASSERT_STREQ(expected, Func_getDocString("utest_getDocString__noincludes"))
End

// Line one
// Line two
Function utest_getDocString__multiline()
    // _getDocString -- gets multiline comments
    String expected = "// Line one\r// Line two"
    ASSERT_STREQ(expected, Func_getDocString("utest_getDocString__multiline"))
End

// First line
//
// This is the second line
Function utest_getDocString__intblank()
    // _getDocString -- gets multiline comments with internal blanks
    String expected = "// First line\r//\r// This is the second line"
    ASSERT_STREQ(expected, Func_getDocString("utest_getDocString__intblank"))
End

// Impossible to ignore this comment

// First line
Function utest_getDocString__noblanks()
    // _getDocString -- cannot break the comment at blank lines
    String expected = "// Impossible to ignore this comment\r// First line"
    // Because the underlying Igor procedure that returns the text
    // automatically removes blank lines, there is no way to
    // distinguish comments before a function that are separated by
    // blanks lines
    ASSERT_STREQ(expected, Func_getDocString("utest_getDocString__noblanks"))
End

Function utest_PostDocString__noblanks()
    // _getPostDocString -- breaks the comment at blank lines

    // Ignore this comment
    String expected = "// _getPostDocString -- breaks the comment at blank lines"
    ASSERT_STREQ(expected, Func_getPostDocString("utest_PostDocString__noblanks"))
End

Function utest_PostDocString__blankcomm()
    // _getPostDocString -- gets comment lines with no content
    //
    // Don't ignore this comment
    String expected = "// _getPostDocString -- gets comment lines with no content\r    //\r    // Don't ignore this comment"
    ASSERT_STREQ(expected, Func_getPostDocString("utest_PostDocString__blankcomm"))
End