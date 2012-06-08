#ifndef UNITUTILS_INCLUDE
#define UNITUTILS_INCLUDE

#include "booleanutils"
#include "dictutils"
#include "numutils"

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
    return Dict_getItem(num2str(mag), SI_PREFIXES)
End

Function Unit_getMagFromShortStr(unit_str)
    String unit_str
    if (!isStringExists(unit_str))
        return NaN
    endif

    String long_prefix = StringByKey(unit_str[0], SI_1toLPREFIX, ":", ";", 1)
    if (isStringExists(long_prefix))
        Variable mag = str2num(Dict_getItem(SI_MAGNITUDES, long_prefix))
    endif
    return mag
End

Function Unit_getMagFromLongStr(unit_str)
    String unit_str
    if (!isStringExists(unit_str))
        return NaN
    endif

    String long_prefix = StringByKey(unit_str[0], SI_1toLPREFIX, ":", ";", 1)
    if (isStringExists(long_prefix))
        Variable mag = str2num(Dict_getItem(SI_MAGNITUDES, long_prefix))
    endif
    return mag
End

Function Unit_isKnown(unit_str)
    String unit_str
    if (List_hasItem(UNIT_REGISTRY, unit_str))
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

#endif