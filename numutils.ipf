#ifndef NUMUTILS_INCLUDE
#define NUMUTILS_INCLUDE

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

Function Num_getUnitMagnitude(num)
    // Return the order of magnitude for the given number
    //
    // Only returns multiples of 3 (as commonly used in SI units
    // prefixes), and returns a max (min) magnitude of 24 (-24).
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