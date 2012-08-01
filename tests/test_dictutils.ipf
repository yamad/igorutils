#include "dictutils"

Function utest_Dict__addstring()
    // Dict_addItem -- adds a string at key
    String dict = ""
    dict = Dict_addItem(dict, "key", "value")
    ASSERT_STREQ("key:value;", dict)
End

Function utest_Dict__getstring()
    // Dict_getItem -- gets a string
    String dict = "key:value;"
    String result = Dict_getItem(dict, "key")
    ASSERT_STREQ("value", result)
End

Function utest_Dict__convertsep()
    // Dict_convertKeySep -- converts pair separator
    String dict = "a:val;b:hh:mm:ss;c:note: foo;"
    String expected = "a=val;b=hh:mm:ss;c=note: foo;"
    String result = Dict_convertKeySep(dict, ":", new_sep="=")
    ASSERT_STREQ(expected, result)
End

Function utest_Dict__convertsepdef()
    // Dict_convertKeySep -- new separator defaults to KEYSEP
    String dict = "a=val1;b=val2;c=val3;"
    String expected = "a:val1;b:val2;c:val3;"
    String result = Dict_convertKeySep(dict, "=")
    ASSERT_STREQ(expected, result)
End
