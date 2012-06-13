#include "IgorUnit"
#include "numutils"

Function utest_Num_getUnitMagnitude()
    EXPECT_EQ(3, Num_getUnitMagnitude(1e5))
    EXPECT_EQ(6, Num_getUnitMagnitude(1e6))
End