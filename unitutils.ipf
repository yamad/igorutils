#ifndef UNITUTILS_INCLUDE
#define UNITUTILS_INCLUDE

#include "waveutils"

Static strconstant SI_PREFIXES = "-24:yocto;-18:atto;-15:femto;-12:pico;-9:nano;-6:micro;-3:milli;-2:centi;-1:deci;0:;1:deka;2:hecto;3:kilo;6:mega;9:giga;12:tera;15:peta;18:exa;21:zetta;24:yotta;"
Static strconstant SI_MAGNITUDES = "yocto:-24;atto:-18;femto:-15;pico:-12;nano:-9;micro:-6;milli:-3;centi:-2;deci:-1;deka:1;hecto:2;kilo:3;mega:6;giga:9;tera:12;peta:15;exa:18;zetta:21;yotta:24;"
Static strconstant SI_1toLPREFIX = "y:yocto;a:atto;f:femto;p:pico;n:nano;u:micro;m:milli;c:centi;d:deci;da:deka;h:hecto;k:kilo;M:mega;G:giga;T:tera;P:peta;E:exa;Z:zetta;Y:yotta;"
Static strconstant SI_Lto1PREFIX = "yocto:y;atto:a;femto:f;pico:p;nano:n;micro:u;milli:m;centi:c;deci:d;deca:da;deka:da;hecto:h;kilo:k;mega:M;giga:G;tera:T;peta:P;exa:E;zetta:Z;yotta:Y;"
Static Strconstant prefix_re = "([MGTPEZYu]|y(octo|otta)?|a(tto)?|f(emto)?|p(ico|eta)?|n(ano)?|m(icro|illi|ega)?|c(enti)?|k(ilo)?|d(a|e(c[ai]|ka))?|h(ecto)?|giga|tera|exa|zetta)"
Static Strconstant UNIT_REGISTRY = "m;meter;g;gram;s;sec;second;A;ampere;amp;K;kelvin;mol;mole;cd;candela;deg;degree;rad;radian;Hz;hertz;Pa;pascal;N;newton;J;joule;W;watt;C;coulomb;V;volt;F;farad;ohm;mho;S;siemens;min;minute;h;hour;d;day;L;liter;litre;dB;decibel;Da;dalton;atm;atmosphere;micron"

Function/S Unit_getNumPrefix(num)
    // Get the appropriate SI unit prefix for the given number
    Variable num
    Variable mag = Num_getUnitMagnitude(num)
    return Dict_getItem(SI_PREFIXES, num2str(mag))
End

Static Strconstant shortpre_re = "^([MGTPEZYuyafpnmckdh]|da)$"
Function Unit_isShortPrefix(prefix_str)
    String prefix_str
    if (GrepString(prefix_str, shortpre_re))
        return TRUE
    endif
    return FALSE
End

Function Unit_getMagFromPrefix(prefix_str)
    String prefix_str
    if (!isStringExists(prefix_str))
        return NaN
    endif

    if (Unit_isShortPrefix(prefix_str))
        prefix_str = StringByKey(prefix_str, SI_1toLPREFIX, ":", ";", 1)
    endif

    Variable mag
    if (isStringExists(prefix_str))
        mag = str2num(Dict_getItem(SI_MAGNITUDES, prefix_str))
    endif
    return mag
End

Function Unit_isKnown(base_str)
    // Returns true if `base_str` is a known base unit
    String base_str
    if (List_hasItem(UNIT_REGISTRY, base_str))
        return TRUE
    endif
    return FALSE
End

Function Unit_split(unit_str, prefix, base_unit)
    String unit_str
    String &prefix, &base_unit

    // already a base unit (with no prefix)?
    if (Unit_isKnown(unit_str))
        prefix = ""
        base_unit = unit_str
        return 0
    endif

    // check for an SI prefix
    SplitString/E=PREFIX_RE unit_str, prefix
    if (isStringExists(prefix))
        base_unit = unit_str[strlen(prefix), strlen(unit_str)-1]
        if (Unit_isKnown(base_unit))
            return 0
        endif
    endif

    // can't parse this unit string
    prefix = ""
    base_unit = ""
    return -1
End

Function Unit_isCompatibleBases(unit_a, unit_b)
    String unit_a, unit_b
    String a_pre, a_base, b_pre, b_base
    Unit_split(unit_a, a_pre, a_base)
    Unit_split(unit_b, b_pre, b_base)
    if (isStringsEqual(a_base, b_base))
        return TRUE
    endif
    return FALSE
End

Function Unit_getScaleFactor(old_unit, new_unit)
    String old_unit, new_unit

    String o_pre, o_base, n_pre, n_base
    Variable o_mag, n_mag

    Unit_split(old_unit, o_pre, o_base)
    Unit_split(new_unit, n_pre, n_base)

    if (!isStringsEqual(o_base, n_base))
        return NaN              // bail if base units are not same
    endif

    o_mag = Unit_getMagFromPrefix(o_pre)
    n_mag = Unit_getMagFromPrefix(n_pre)

    o_mag = !isNaN(o_mag) ? o_mag : 0
    n_mag = !isNaN(n_mag) ? n_mag : 0
    return 10^(o_mag - n_mag)
End

Function Unit_scale(num, old_unit, new_unit)
    // Scale variable `num` from old units to new units
    Variable num
    String old_unit
    String new_unit

    return num * Unit_getScaleFactor(old_unit, new_unit)
End

Function Unit_scaleWave(wave_in, new_units)
    Wave wave_in
    String new_units

    String old_units = Wave_getDataUnits(wave_in)
    if (!Unit_isCompatibleBases(old_units, new_units))
        return -1
    endif

    Variable sf = Unit_getScaleFactor(old_units, new_units)
    Wave_setDataUnits(wave_in, new_units)
    wave_in = wave_in * sf
    return 0
End

Function Unit_scaleWaveRow(wave_in, new_units)
    Wave wave_in
    String new_units

    String old_units = Wave_getRowUnits(wave_in)
    if (!Unit_isCompatibleBases(old_units, new_units))
        return -1
    endif

    Variable sf = Unit_getScaleFactor(old_units, new_units)
    Wave_setRowUnits(wave_in, new_units)
    Wave_setRowOffset(wave_in, Wave_getRowOffset(wave_in) * sf)
    Wave_setRowDelta(wave_in, Wave_getRowDelta(wave_in) * sf)
    return 0
End

#endif