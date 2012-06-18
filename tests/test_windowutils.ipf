#include "IgorUnit"
#include "windowutils"

Function utest_Window__parentname()
    String a = "Graph0#subgraph0"
    EXPECT_STREQ("Graph0", Window_getParentName(a))

    a = "Graph0#subgraph0#subsubgraph1"
    EXPECT_STREQ("subgraph0", Window_getParentName(a))

    a = "Graph0"
    EXPECT_STREQ("", Window_getParentName(a))

    a = "#sub0"
    EXPECT_STREQ("", Window_getParentName(a))

    a = "#"
    EXPECT_STREQ("", Window_getParentName(a))

    a = "##"
    EXPECT_STREQ("", Window_getParentName(a))
End