#include "IgorUnit"
#include "refpathutils"

Function utest_RefPath_isFull()
    EXPECT_TRUE(RefPath_isFull("root:"))
    EXPECT_TRUE(RefPath_isFull("root:$(df1):df2:"))
    EXPECT_TRUE(RefPath_isFull("root:'lib name':df2:"))
    EXPECT_TRUE(RefPath_isFull("root:df1:obj"))

    EXPECT_FALSE(RefPath_isFull(":df1:obj"))
    EXPECT_FALSE(RefPath_isFull(":obj"))
    EXPECT_FALSE(RefPath_isFull("obj"))
    EXPECT_FALSE(RefPath_isFull("'lib name'"))
End

Function utest_RefPath_isRelative()
    EXPECT_TRUE(RefPath_isRelative(":sub_df1"))
    EXPECT_TRUE(RefPath_isRelative(":::sub_df1"))

    EXPECT_FALSE(RefPath_isRelative("root:::sub_df1"))
    EXPECT_FALSE(RefPath_isRelative("'lib name'"))
End