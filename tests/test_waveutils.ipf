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