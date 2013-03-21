#include "IgorUnit"
#include "datafolderutils"

Function utest_DF_currentpath()
    // DataFolder_currentPath() -- gets current path
    EXPECT_STREQ(GetDataFolder(1), DataFolder_currentPath())
End