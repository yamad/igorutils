#include "IgorUnit"
#include "graphutils"


Function setup_Graph()
    Make/N=100 testwave
    testwave = sin(x)
    Display/N=testgraph testwave
End

Function teardown_Graph()
    KillWindow testgraph
    KillWaves testwave
End

Function utest_Graph__axislist()
    // Graph_getAxisList -- gets list of all axes, if none specified
    ASSERT_STREQ("left;bottom;", Graph_getAxisList("testgraph"))
End

Function utest_Graph__axlistleft()
    // Graph_getAxisList -- gets all left axes, when type="left"
    AppendToGraph/L=leftaxis2 testwave
    ASSERT_STREQ("left;leftaxis2;", Graph_getAxisList("testgraph", type="left"))
End