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

Function utest_Graph__axlist()
    // Graph_getAxisList -- gets list of all axes, if no type specified
    ASSERT_STREQ("left;bottom;", Graph_getAxisList("testgraph"))
End

Function utest_Graph__axlistunk()
    // Graph_getAxisList -- gets list of all axes, with unknown type
    ASSERT_STREQ("left;bottom;", Graph_getAxisList("testgraph", type="foo"))
End

Function utest_Graph__axlistleft()
    // Graph_getAxisList -- gets all left axes, when type="left"
    AppendToGraph/L=leftaxis2 testwave
    ASSERT_STREQ("left;leftaxis2;", Graph_getAxisList("testgraph", type="left"))
End

Function utest_Graph__axlistvert()
    // Graph_getAxisList -- gets all vertical axes
    AppendToGraph/R=rightaxis testwave
    ASSERT_STREQ("left;rightaxis;", Graph_getAxisList("testgraph", type="vertical"))
End

Function utest_Graph__axlisthoriz()
    // Graph_getAxisList -- gets all horizontal axes
    AppendToGraph/T=top testwave
    ASSERT_STREQ("bottom;top;", Graph_getAxisList("testgraph", type="horizontal"))
End

Function utest_Graph__trlist()
    // Graph_getTraceList -- gets list of all traces, if no axes specified
    Make foo, bar, baz
    AppendToGraph foo, bar, baz
    ASSERT_STREQ("testwave;foo;bar;baz;", Graph_getTraceList("testgraph"))
End

Function utest_Graph__trlistx()
    // Graph_getTraceList -- gets list of all traces on specified xaxis
    Make foo, bar, baz
    AppendToGraph/T=top/L=left2 foo
    AppendToGraph/T=top/R=right1 bar
    AppendToGraph/B=bottom2 baz
    ASSERT_STREQ("foo;bar;", Graph_getTraceList("testgraph", xaxis="top"))
End

Function utest_Graph__trlisty()
    // Graph_getTraceList -- gets list of all traces on specified yaxis
    Make foo, bar, baz
    AppendToGraph/L=left2/B=bottom2 foo
    AppendToGraph/L=left2/B=bottom3 bar
    AppendToGraph/L=left3/T=top baz
    ASSERT_STREQ("foo;bar;", Graph_getTraceList("testgraph", yaxis="left2"))
End

Function utest_Graph__trlistxy()
    // Graph_getTraceList -- gets list of all traces on x/y axis
    Make foo, bar, baz
    AppendToGraph/L=left2/B=bottom2 foo
    AppendToGraph/L=left2/B=bottom2 bar
    AppendToGraph/L=left2/B=bottom3 baz
    ASSERT_STREQ("foo;bar;", Graph_getTraceList("testgraph", yaxis="left2", xaxis="bottom2"))
End
