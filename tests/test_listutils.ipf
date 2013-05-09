#include "IgorUnit"
#include "listutils"

Function utest_List__slice()
    String list_in = "0;1;2;3;4;5;6;7;"
    String expect = "2;3;4;"
    ASSERT_STREQ(expect, List_getSlice(list_in, 2, 4))
End

Function utest_List__reverse()
    EXPECT_STREQ("1;0;", List_reverse("0;1;"))
    EXPECT_STREQ("1;0;", List_reverse("0;1"))
    EXPECT_STREQ("2;1;0;", List_reverse("0;1;2;"))
End