#include "IgorUnit"
#include "unitutils"

Function utest_Unit__known()
    // Unit_isKnown -- returns true if a unit is known to the unit module
    EXPECT_TRUE(Unit_isKnown("mole"), fail_msg="mole not known")
    EXPECT_TRUE(Unit_isKnown("ampere"), fail_msg="ampere not known")
End

Function utest_Unit_split__base()
    // Unit_split -- if already base unit, returns no prefix
    String prefix, base_unit

    String test_units = "meter;m;gram;joule;J;C;d;day;L;liter"
    do
        String curr_unit = List_pop(test_units)
        expect_unit_split_is(curr_unit, "", curr_unit)
    while (List_getLength(test_units) != 0)
End

Function utest_Unit_split__wpre()
    // Unit_split -- if prefix exists, should get it
    expect_unit_split_is("mm", "m", "m")
    expect_unit_split_is("mmeter", "m", "meter")
    expect_unit_split_is("kg", "k", "g")
    expect_unit_split_is("millimeter", "milli", "meter")
    expect_unit_split_is("MJ", "M", "J")
    expect_unit_split_is("daDa", "da", "Da")
    expect_unit_split_is("deciliter", "deci", "liter")
End

Function utest_Unit_split__prelong()
    // Unit_split -- all known long prefixes
    expect_unit_split_is("yoctometer", "yocto", "meter")
    expect_unit_split_is("attometer", "atto", "meter")
    expect_unit_split_is("femtometer", "femto", "meter")
    expect_unit_split_is("picometer", "pico", "meter")
    expect_unit_split_is("nanometer", "nano", "meter")
    expect_unit_split_is("micrometer", "micro", "meter")
    expect_unit_split_is("millimeter", "milli", "meter")
    expect_unit_split_is("centimeter", "centi", "meter")
    expect_unit_split_is("decimeter", "deci", "meter")
    expect_unit_split_is("dekameter", "deka", "meter")
    expect_unit_split_is("decameter", "deca", "meter")
    expect_unit_split_is("hectometer", "hecto", "meter")
    expect_unit_split_is("kilometer", "kilo", "meter")
    expect_unit_split_is("megameter", "mega", "meter")
    expect_unit_split_is("gigameter", "giga", "meter")
    expect_unit_split_is("terameter", "tera", "meter")
    expect_unit_split_is("petameter", "peta", "meter")
    expect_unit_split_is("exameter", "exa", "meter")
    expect_unit_split_is("zettameter", "zetta", "meter")
    expect_unit_split_is("yottameter", "yotta", "meter")
End

Function utest_Unit_split__preshort()
    // Unit_split -- all known short prefixes
    expect_unit_split_is("ym", "y", "m")
    expect_unit_split_is("am", "a", "m")
    expect_unit_split_is("fm", "f", "m")
    expect_unit_split_is("pm", "p", "m")
    expect_unit_split_is("nm", "n", "m")
    expect_unit_split_is("um", "u", "m")
    expect_unit_split_is("mm", "m", "m")
    expect_unit_split_is("cm", "c", "m")
    expect_unit_split_is("dm", "d", "m")
    expect_unit_split_is("dam", "da", "m")
    expect_unit_split_is("hm", "h", "m")
    expect_unit_split_is("km", "k", "m")
    expect_unit_split_is("Mm", "M", "m")
    expect_unit_split_is("Gm", "G", "m")
    expect_unit_split_is("Tm", "T", "m")
    expect_unit_split_is("Pm", "P", "m")
    expect_unit_split_is("Em", "E", "m")
    expect_unit_split_is("Zm", "Z", "m")
    expect_unit_split_is("Ym", "Y", "m")
End

Function utest_Unit_split__baselongs()
    // Unit_split -- all known short prefixes with long base
    expect_unit_split_is("ymol", "y", "mol")
    expect_unit_split_is("amol", "a", "mol")
    expect_unit_split_is("fmol", "f", "mol")
    expect_unit_split_is("pmol", "p", "mol")
    expect_unit_split_is("nmol", "n", "mol")
    expect_unit_split_is("umol", "u", "mol")
    expect_unit_split_is("mmol", "m", "mol")
    expect_unit_split_is("cmol", "c", "mol")
    expect_unit_split_is("dmol", "d", "mol")
    expect_unit_split_is("damol", "da", "mol")
    expect_unit_split_is("hmol", "h", "mol")
    expect_unit_split_is("kmol", "k", "mol")
    expect_unit_split_is("Mmol", "M", "mol")
    expect_unit_split_is("Gmol", "G", "mol")
    expect_unit_split_is("Tmol", "T", "mol")
    expect_unit_split_is("Pmol", "P", "mol")
    expect_unit_split_is("Emol", "E", "mol")
    expect_unit_split_is("Zmol", "Z", "mol")
    expect_unit_split_is("Ymol", "Y", "mol")
End

Function utest_Unit_split__unkpre()
    // Unit_split -- return empty if there is an unknown prefix
    expect_unit_split_is("oA", "", "")
End

Function utest_Unit_split__unkbase()
    // Unit_split -- return empty if there is an unknown base
    expect_unit_split_is("notarealunit", "", "")
End

Static Function expect_unit_split_is(test_unit, exp_prefix, exp_base)
    String test_unit, exp_prefix, exp_base
    String actual_prefix, actual_base
    Unit_split(test_unit, actual_prefix, actual_base)
    EXPECT_STREQ(exp_prefix, actual_prefix)
    EXPECT_STREQ(exp_base, actual_base)
End

Function utest_Unit__getposprefix()
    // Unit_getNumPrefix -- gets the right positive prefixes
    EXPECT_STREQ("", Unit_getNumPrefix(1e0))
    EXPECT_STREQ("", Unit_getNumPrefix(1e1))
    EXPECT_STREQ("", Unit_getNumPrefix(1e2))
    EXPECT_STREQ("kilo", Unit_getNumPrefix(1e3))
    EXPECT_STREQ("kilo", Unit_getNumPrefix(1e4))
    EXPECT_STREQ("kilo", Unit_getNumPrefix(1e5))
    EXPECT_STREQ("mega", Unit_getNumPrefix(1e6))
    EXPECT_STREQ("zetta", Unit_getNumPrefix(1e23))
    EXPECT_STREQ("yotta", Unit_getNumPrefix(1e24))
    EXPECT_STREQ("yotta", Unit_getNumPrefix(1e30))
End

Function utest_Unit__getnegprefix()
    // Unit_getNumPrefix -- gets the right negative prefixes
    EXPECT_STREQ("", Unit_getNumPrefix(1e-2))
    EXPECT_STREQ("", Unit_getNumPrefix(1.5e-2))
    EXPECT_STREQ("milli", Unit_getNumPrefix(1e-3))
    EXPECT_STREQ("micro", Unit_getNumPrefix(1e-4))
    EXPECT_STREQ("micro", Unit_getNumPrefix(1.5e-4))
    EXPECT_STREQ("micro", Unit_getNumPrefix(1.5e-5))
    EXPECT_STREQ("micro", Unit_getNumPrefix(1e-5))
    EXPECT_STREQ("micro", Unit_getNumPrefix(1.5e-6))
    EXPECT_STREQ("yocto", Unit_getNumPrefix(1e-27))
End

Function utest_Unit_scalefac__negshorts()
    // Unit_getScaleFactor -- supports short units (negative)
    EXPECT_EQ(1e-3, Unit_getScaleFactor("uA", "mA"))
    EXPECT_EQ(1e-6, Unit_getScaleFactor("uA", "A"))
    EXPECT_EQ(1e3, Unit_getScaleFactor("A", "mA"))
End

Function utest_Unit_scalefac__posshorts()
    // Unit_getScaleFactor -- supports short units (positive)
    EXPECT_EQ(1e-3, Unit_getScaleFactor("A", "kA"))
    EXPECT_EQ(1e3, Unit_getScaleFactor("kA", "A"))
    EXPECT_EQ(1e6, Unit_getScaleFactor("GA", "kA"))
End

Function utest_Unit_scalefac__neglongs()
    // Unit_getScaleFactor -- suports long units (negative)
    EXPECT_EQ(1e-3, Unit_getScaleFactor("microamp", "milliamp"))
    EXPECT_EQ(1e-6, Unit_getScaleFactor("microamp", "amp"))
    EXPECT_EQ(1e3, Unit_getScaleFactor("amp", "milliamp"))
End

Function utest_Unit_scalefac__poslongs()
    // Unit_getScaleFactor -- suports long units (positive)
    EXPECT_EQ(1e-3, Unit_getScaleFactor("amp", "kiloamp"))
    EXPECT_EQ(1e3, Unit_getScaleFactor("kiloamp", "amp"))
    EXPECT_EQ(1e6, Unit_getScaleFactor("gigaamp", "kiloamp"))
End

Function utest_Unit_scalefac__diffbase()
    // Unit_getScaleFactor -- different base units are not supported
    EXPECT_EQ(NaN, Unit_getScaleFactor("amp", "s"))
    EXPECT_EQ(NaN, Unit_getScaleFactor("amp", "giga"))
End

Function utest_Unit_scale()
    // Unit_scale -- returns number converted to new scale
    EXPECT_EQ(100e-6, Unit_scale(100, "mA", "kA"), tol=1e-13)
    EXPECT_EQ(0.1, Unit_scale(100, "mA", "A"), tol=1e-13)
End