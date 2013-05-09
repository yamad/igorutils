#ifndef COLORUTILS_INCLUDE
#define COLORUTILS_INCLUDE

// colorutils -- utilities for working with colors and color palettes
//
// Color palettes are provided from various sources:
//  * d3 (http://d3js.org)

// Colors in this module are specified in hexadecimal RGB (0xRRGGBB),
// where each color component is represented by a single byte (0-255,
// or equivalently 0x00-0xFF). Color palettes are specified as a
// semicolon-separated list of colors.
//
// Igor RGB specifies each color component in 16-bit
// (0-65535). Conversion from hex RGB to Igor RGB is provided by the
// hexcolor_* functions (one per color) which take a hex RGB color and
// return an Igor color value (e.g. hexcolor_red(0xFF0102) --> 65280).

// Color palettes from the d3 javascript visualization library -- http://d3js.org
Strconstant COLOR_D3_10 = "0x1f77b4; 0xff7f0e; 0x2ca02c; 0xd62728; 0x9467bd; 0x8c564b; 0xe377c2; 0x7f7f7f; 0xbcbd22; 0x17becf;"
Strconstant COLOR_D3_20 = "0x1f77b4; 0xaec7e8; 0xff7f0e; 0xffbb78; 0x2ca02c; 0x98df8a; 0xd62728; 0xff9896; 0x9467bd; 0xc5b0d5; 0x8c564b; 0xc49c94; 0xe377c2; 0xf7b6d2; 0x7f7f7f; 0xc7c7c7; 0xbcbd22; 0xdbdb8d; 0x17becf; 0x9edae5;"
Strconstant COLOR_D3_20b = "0x393b79; 0x5254a3; 0x6b6ecf; 0x9c9ede; 0x637939; 0x8ca252; 0xb5cf6b; 0xcedb9c; 0x8c6d31; 0xbd9e39; 0xe7ba52; 0xe7cb94; 0x843c39; 0xad494a; 0xd6616b; 0xe7969c; 0x7b4173; 0xa55194; 0xce6dbd; 0xde9ed6;"
Strconstant COLOR_D3_20c = "0x3182bd; 0x6baed6; 0x9ecae1; 0xc6dbef; 0xe6550d; 0xfd8d3c; 0xfdae6b; 0xfdd0a2; 0x31a354; 0x74c476; 0xa1d99b; 0xc7e9c0; 0x756bb1; 0x9e9ac8; 0xbcbddc; 0xdadaeb; 0x636363; 0x969696; 0xbdbdbd; 0xd9d9d9;"

/// Color palettes from ColorBrewer -- http://www.colorbrewer.org, Cynthia A. Brewer
#include "colorbrewer"

Function hexcolor_red(hex)
    Variable hex
    return byte_value(hex, 2) * 2^8
End

Function hexcolor_green(hex)
    Variable hex
    return byte_value(hex, 1) * 2^8
End

Function hexcolor_blue(hex)
    Variable hex
    return byte_value(hex, 0) * 2^8
End

Static Function byte_value(data, byte)
    Variable data
    Variable byte
    return (data & (0xFF * (2^(8*byte)))) / (2^(8*byte))
End

#endif