#include "IgorUnit"
#include "waveutils"

Function utest_Wave_store__persist()
    Make/FREE/N=(5) free_wave
    String wave_path = "stored_wave"

    if (WaveExists($(wave_path)))
        EXPECT_FAIL(fail_msg="Wave already exists, but should not")
    endif

    Wave_store(free_wave, wave_path)

    if (WaveExists($(wave_path)))
        EXPECT_SUCCEED(fail_msg="Wave was not persisted")
    endif
End

Function utest_Wave_store__nooverwrite()
    // Return error if a wave already exists at location
    Make/N=5 existing_wave
    existing_wave = 1

    Make/FREE/N=5 free_wave
    free_wave = 0

    String wave_path = "existing_wave"

    Variable err
    err = Wave_store(free_wave, wave_path)
    if (err != -1)              // return 0 for no error
        EXPECT_FAIL(fail_msg="Wave overwrote existing wave")
    endif

    Wave new_wave = $(wave_path)
    ASSERT_EQ(1, new_wave[0])   // fetched data is existing wave
End

Function utest_Wave_store__overwrite()
    // Overwrite wave if one already exists at specified location
    Make/N=5 existing_wave
    existing_wave = 1

    Make/FREE/N=5 free_wave
    free_wave = 0

    String wave_path = "existing_wave"

    Variable err
    err = Wave_store(free_wave, wave_path, overwrite=1)
    if (err == -1)              // return 0 for no error
        EXPECT_FAIL(fail_msg="Wave should overwrite existing wave")
    endif

    Wave new_wave = $(wave_path)
    ASSERT_EQ(0, new_wave[0])   // fetched data is new wave
end

Function utest_Wave_store__saveexisting()
    // Save existing wave to new location
    Make/N=5 global_wave
    global_wave = 1

    Wave_store(global_wave, "new_wave_loc")
    Wave w = $("new_wave_loc")
    ASSERT_EQ(1, w[0])
End

Function utest_Wave_store__ownloc()
    // Transparent "failure" if wave provides its own location
    Make/N=5 global_wave
    global_wave = 1

    Wave_store(global_wave, "global_wave", overwrite=1)
    Wave w = $("global_wave")
    ASSERT_EQ(1, w[0])
End

Function utest_Wave_fNC__newchange()
    // Wave_findNextChange -- finds next large change
    Make/N=100 w
    w = 0
    w[20,30] = 10
    w[50,60] = 10
    EXPECT_EQ(20, Wave_findNextChange(w))
    EXPECT_EQ(31, Wave_findNextChange(w, start_pt=20))
End

Function utest_Wave_fNC__nochange()
    // Wave_findNextChange -- returns -1 if no change
    Make/N=100 w
    w = 0
    EXPECT_EQ(-1, Wave_findNextChange(w))
End

Function utest_Wave_fNC__tol()
    // Wave_findNextChange -- rejects change less than tol
    Make/N=100 w
    w = 0
    w[20,30] = 1
    EXPECT_EQ(-1, Wave_findNextChange(w, tol=2))
End

Function utest_Wave_fNC__attol()
    // Wave_findNextChange -- accepts change of exactly tol
    Make/N=100 w
    w = 0
    w[20,30] = 1
    EXPECT_EQ(20, Wave_findNextChange(w, tol=1))
End

Function utest_Wave_fNC__1pnt()
    // Wave_findNextChange -- change at extremes
    Make/N=100 w
    w = 0
    w[1,98] = 10
    EXPECT_EQ(1, Wave_findNextChange(w))
    EXPECT_EQ(99, Wave_findNextChange(w, start_pt=1))
End

Function utest_Wave_fConsec__simple()
    // Wave_findConsec -- finds consecutive run
    Make/N=100 w
    w = 0
    EXPECT_EQ(0, Wave_findConsec(w, 10))
    EXPECT_EQ(10, Wave_findConsec(w, 10, start_pt=10))

    w[5] = 1
    EXPECT_EQ(6, Wave_findConsec(w, 10))
End

Function utest_Wave_fConsec__failsend()
    // Wave_findConsec -- finds consecutive run at end
    Make/N=15 w
    w = 1
    w[5,14] = 2

    EXPECT_EQ(5, Wave_findConsec(w, 10))

    w = 1
    w[6,14] = 2
    EXPECT_EQ(-1, Wave_findConsec(w, 10))
End

Function utest_Wave_fConsec__tol()
    // Wave_findConsec -- allows deviation by tolerance
    Make/N=10 w
    w = 1
    w[4,8] = 2
    w[6] = 2.01
    w[7] = 1.99
    w[8] = 2.01

    EXPECT_EQ(4, Wave_findConsec(w, 5, tol=0.02))
End

Function utest_Wave_equal__allzero()
    // isWavesEqual -- equal if all zero
    Make/N=10 a
    Make/N=10 b
    a = 0
    b = 0

    ASSERT_TRUE(isWavesEqual(a, b))
End

Function utest_Wave_equal__step()
    // isWavesEqual -- equal if a step
    Make/N=100 a
    Make/N=100 b

    a = 0
    b = 0

    a[50,60] = 4
    b[50,60] = 4

    ASSERT_TRUE(isWavesEqual(a, b))
End

Function utest_Wave_equal__diffsize()
    // isWavesEqual -- fails if different sizes
    Make/N=10 a
    Make/N=11 b

    a = 0
    b = 0

    ASSERT_FALSE(isWavesEqual(a, b))
End

Function utest_Wave_equal__diffcol()
    // isWavesEqual -- fails if different sized columns
    Make/N=(10, 5) a
    Make/N=(10, 10) b

    a = 0
    b = 0

    ASSERT_FALSE(isWavesEqual(a, b))
End

Function utest_Wave_equal__tol()
    // isWavesEqual -- equal within tolerance
    Make/N=1000 a
    Make/N=1000 b

    SetRandomSeed 0.5
    a = 1                       // constant
    b = a + enoise(-1, 1)       // random within tol

    ASSERT_TRUE(isWavesEqual(a, b, tol=1.0))
End

Function utest_Wave_equal__nulls()
    // isWavesEqual -- not equal if either wave is null
    Wave/Z a = $""
    Wave/Z b = $""
    Make/N=10 c

    ASSERT_FALSE(isWavesEqual(a, b))
    ASSERT_FALSE(isWavesEqual(a, c))
    ASSERT_FALSE(isWavesEqual(c, a))
End

Function utest_Wave_removeRows__1row()
    // Wave_removeRows -- removes a row at given index
    Make/N=10 a
    a = p
    Wave_removeRows(a, 1, 1)
    EXPECT_EQ(9, Wave_getRowCount(a))
    EXPECT_EQ(a[0], 0)
    EXPECT_EQ(a[1], 2)
End

Function utest_Wave_removeRows__nrows()
    Make/N=10 a
    a = p
    Wave_removeRows(a, 0, 4)
    EXPECT_EQ(5, Wave_getRowCount(a))
    EXPECT_EQ(a[0], 5)
    EXPECT_EQ(a[4], 9)
End

Function utest_Wave_removeRows__2d()
    Make/N=(10,2) a
    a = p*(q+1)
    Wave_removeRows(a, 1, 2)
    EXPECT_EQ(8, Wave_getRowCount(a))
    EXPECT_EQ(a[1][0], 3)
    EXPECT_EQ(a[1][1], 6)
End

Function utest_Wave_removeRows__flipped()
    // Wave_removeRows -- no op for start past end index
    Make/N=10 a
    a = p
    Wave_removeRows(a, 4, 0)
    EXPECT_EQ(10, Wave_getRowCount(a))
End

Function utest_Wave_removeRows__bounds()
    // Wave_removeRows -- out of bounds
    Make/N=10 a
    a = p
    Wave_removeRows(a, -1, 10)
    EXPECT_EQ(0, Wave_getRowCount(a))
End