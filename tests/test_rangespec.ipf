#include "IgorUnit"
#include "rangespec"

Function utest_RangeSpec__default1()
    // RangeSpec -- ascending range default is 1
    String spec = "1-4"
    String expected = "1;2;3;4;"
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__stepints()
    // RangeSpec -- return step intervals if step argument given
    String spec = "0-6:2"
    String expected = "0;2;4;6;"
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__skipend()
    // RangeSpec -- skip end value if step goes past it
    String spec = "1-6:2"
    String expected = "1;3;5;"
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__ascnegstep()
    // RangeSpec -- negative step for asceding range returns empty
    String spec = "0-6:-2"
    String expected = ""
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__asczerostep()
    // RangeSpec -- zero step for ascending range returns nothing
    String spec = "0-6:0"
    String expected = ""
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__singlevalue()
    // RangeSpec -- single value returns as given (in list form)
    String spec = "1"
    String expected = "1;"
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__multiranges()
    // RangeSpec -- operate on multiple ranges
    String spec = "0-6:2, 5, 7-10"
    String expected = "0;2;4;6;5;7;8;9;10;"
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__nodups()
    // RangeSpec -- acts as a set (no duplicate values)
    String spec = "1-4,3-6"
    String expected = "1;2;3;4;5;6;"
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__descnostep()
    // RangeSpec -- descending range is empty without a step
    String spec = "4-0"
    String expected = ""
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__descwstep()
    // RangeSpec -- end larger than beginning and negative step returns descending range
    String spec = "4-0:-1"
    String expected = "4;3;2;1;0;"
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End

Function utest_RangeSpec__desczerostep()
    // RangeSpec -- descending range with zero step is empty
    String spec = "4-0:0"
    String expected = ""
    ASSERT_STREQ(expected, RangeSpec_expand(spec))
End