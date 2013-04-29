#include "IgorUnit"
#include "numutils"

Function utest_Num_getUnitMagnitude()
    EXPECT_EQ(3, Num_getUnitMagnitude(1e5))
    EXPECT_EQ(6, Num_getUnitMagnitude(1e6))
End

Static Constant kTOLd = 1e-13          // double precision tolerance
Function utest_Nums_areEqual()
	EXPECT_TRUE(Nums_areEqual(-inf, -inf, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(inf, inf, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(NaN, NaN, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(NaN, -NaN, tol=kTOLd))	// Signed bit of NaN should be ignored
	EXPECT_TRUE(Nums_areEqual(-1, -1, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(1, 1, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(0, 0, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(1, 1, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(inf * 0, NaN, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(0, 0, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(sqrt(-1), NaN, tol=kTOLd))
	EXPECT_TRUE(Nums_areEqual(kTOLd * 0.999, 0, tol=kTOLd))	// due to tolerance
	EXPECT_TRUE(Nums_areEqual(1234567890e256, 1234567890e256, tol=kTOLd))
End