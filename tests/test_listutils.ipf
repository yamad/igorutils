#include "IgorUnit"
#include "listutils"

Function utest_List__slice()
    String list_in = "0;1;2;3;4;5;6;7;"
    String expect = "2;3;4;"
    ASSERT_STREQ(expect, List_getSlice(list_in, 2, 4))
End