#include "IgorUnit"
#include "numutils"

Function utest_Num_getUnitPrefix()
    EXPECT_STREQ("", Num_getUnitPrefix(3))
    EXPECT_STREQ("kilo(k)", Num_getUnitPrefix(3e3))
    EXPECT_STREQ("milli(m)", Num_getUnitPrefix(1.0e-3))
End

Function utest_Num_getUnitMagnitude()
    EXPECT_EQ(3, Num_getUnitMagnitude(1e5))
End