#include "IgorUnit"
#include "numutils"

Function utest_Num_getUnitPrefix()
    EXPECT_STREQ("", Num_getUnitPrefix(3))
    EXPECT_STREQ("kilo", Num_getUnitPrefix(3e4))
End