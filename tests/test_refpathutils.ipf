#include "IgorUnit"
#include "refpathutils"

Function utest_RefPath_resolve__objname()
    // RefPath_resolve -- returns full path of simple object names
    String currdf = GetDataFolder(1)

    String new_obj = "str1"
    EXPECT_STREQ(currdf+new_obj, RefPath_resolve(new_obj))

    new_obj = "'liberal name'"
    EXPECT_STREQ(currdf+new_obj, RefPath_resolve(new_obj))
End

Function utest_RefPath_resolve__full()
    // RefPath_resolve -- echoes full paths
    String path_to_obj = "root:sub_df1:obj"
    EXPECT_STREQ(path_to_obj, RefPath_resolve(path_to_obj))
End

Function utest_RefPath_resolve__relative()
    // RefPath_resolve -- returns full path of relative paths
    String currdf = GetDataFolder(1)

    String path_to_obj = ":sub_df1:$(df2):obj"
    String expected = currdf + path_to_obj[1,strlen(path_to_obj)-1]
    EXPECT_STREQ(expected, RefPath_resolve(path_to_obj))
End

Function utest_RefPath_resolve__backlink()
    // RefPath_resolve -- returns full path of backlink paths
    String currdf = GetDataFolder(1)

    String path_to_obj = ":sub_df1:df2:::obj"
    String expected = currdf + "obj"
    EXPECT_STREQ(expected, RefPath_resolve(path_to_obj))
End

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

Function utest_RefPath_hasTrailingColon()
    EXPECT_TRUE(RefPath_hasTrailingColon("root:sub_df1:subsub:"))
    EXPECT_TRUE(RefPath_hasTrailingColon(":sub_df1:subsub:"))
    EXPECT_TRUE(RefPath_hasTrailingColon(":sub_df1:subsub:"))

    EXPECT_FALSE(RefPath_hasTrailingColon(":sub_df1:subsub"))
End

Function utest_RefPath_isObjName()
    EXPECT_TRUE(RefPath_isObjName("simple"))
    EXPECT_TRUE(RefPath_isObjName("'liberal name'"))

    EXPECT_FALSE(RefPath_isObjName(":simple"))
    EXPECT_FALSE(RefPath_isObjName("root:simple"))
End

Function utest_RefPath_handleBacks()
    String path_w_backs = "root:df1:sub_df2::obj"
    String expected = "root:df1:obj"
    EXPECT_STREQ(expected, RefPath_handleBacks(path_w_backs))

    path_w_backs = "root:df1:sub_df2:::obj"
    expected = "root:obj"
    EXPECT_STREQ(expected, RefPath_handleBacks(path_w_backs))

    path_w_backs = "root:df1:sub_df2::::obj"
    expected = "obj"
    EXPECT_STREQ(expected, RefPath_handleBacks(path_w_backs))

    path_w_backs = "root:d1::d2::d3::d4:::d5:obj"
    expected = "root:d5:obj"
    EXPECT_STREQ(expected, RefPath_handleBacks(path_w_backs))
End