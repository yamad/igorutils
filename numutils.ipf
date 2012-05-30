#ifndef NUMUTILS_INCLUDE
#define NUMUTILS_INCLUDE


Static strconstant METRIC_PREFIXES = "-24:yocto(y);-18:atto(a);-15:femto(f);-12:pico(p);-9:nano(n);-6:micro(u);-3:milli(m);3:kilo(k);6:mega(M);9:giga(G);12:tera(T);15:peta(P);18:exa(E);21:zetta(Z);24:yotta(Y);"

Function isNaN(var)
    Variable var
    if (numtype(var) == 2)
        return 1
    endif
    return 0
End

Function/S Num_complexToString(cmplx_num)
    Variable/C cmplx_num

    String num_out
    sprintf num_out, "%.16g + %.16gi", real(cmplx_num), imag(cmplx_num)
    return num_out
End

Function SplitUnitPrefixString(unit_str, long_str, short_str)
    String unit_str, &long_str, &short_str
    SplitString/E="^([^(]+)\(([^)]+)\)" unit_str, long_str, short_str
End

Function/S Num_getUnitPrefix(num)
    Variable num
    Variable n = Num_getUnitMagnitude(num)
    return StringByKey(num2str(n), METRIC_PREFIXES)
End

Function Num_getUnitMagnitude(num)
    Variable num

    Variable exponent = floor(log(num))
    if (exponent > 24)
        exponent = 24
    endif
    if (exponent < -24)
        exponent = -24
    endif
    Variable diff = mod(exponent, -3)
    Variable map_key = exponent - diff
    // for negative integers, push to next prefix
    if (exponent < -3 && diff != 0)
        map_key -= 3
    endif
    return map_key
End

#endif