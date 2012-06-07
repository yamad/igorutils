#include "dictutils"

Function utest_Dict__addstring()
    // Dict_addItem -- adds a string at key
    String dict = ""
    dict = Dict_addItem(dict, "key", "value")
    ASSERT_STREQ("key:value;", dict)
End

Function utest_Dict__getstring()
    // Dict_getItem -- gets a string
    String expected = "key:value;"
    String result = Dict_getItem(dict, "key")
    ASSERT_STREQ(expected, result)
End
