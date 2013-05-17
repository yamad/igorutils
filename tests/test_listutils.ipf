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

Function utest_List__compact()
    EXPECT_STREQ("a{a;b;c;d;}", List_compact("aa;ab;ac;ad;"))
    EXPECT_STREQ("ab{b;ba;bac;d;}", List_compact("abb;abba;abbac;abd;"))
    EXPECT_STREQ("abb;abba;abbac;;", List_compact("abb;abba;abbac;;"))
End

Function utest_List__expand()
    EXPECT_STREQ("aa;ab;ac;ad;", List_expand(List_compact("aa;ab;ac;ad;")))
    EXPECT_STREQ("abb;abba;abbac;abd;", List_expand(List_compact("abb;abba;abbac;abd;")))
    EXPECT_STREQ("abb;abba;abbac;;", List_expand(List_compact("abb;abba;abbac;;")))
End
