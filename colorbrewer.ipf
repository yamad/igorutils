// Apache-Style Software License for ColorBrewer software and ColorBrewer Color
// Schemes
//
// Copyright (c) 2002 Cynthia Brewer, Mark Harrower, and The Pennsylvania State
// University.
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License. You may obtain a copy of
// the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations under
// the License.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions as source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
//
// 2. The end-user documentation included with the redistribution, if any, must
// include the following acknowledgment: "This product includes color
// specifications and designs developed by Cynthia Brewer
// (http://colorbrewer.org/)." Alternately, this acknowledgment may appear in the
// software itself, if and wherever such third-party acknowledgments normally
// appear.
//
// 4. The name "ColorBrewer" must not be used to endorse or promote products
// derived from this software without prior written permission. For written
// permission, please contact Cynthia Brewer at cbrewer@psu.edu.
//
// 5. Products derived from this software may not be called "ColorBrewer", nor
// may "ColorBrewer" appear in their name, without prior written permission of
// Cynthia Brewer.

/// ColorBrewer color palettes
/// http://www.colorbrewer.org, Cynthia A. Brewer

#ifndef COLORBREWER_INCLUDE
#define COLORBREWER_INCLUDE

//** Sequential schemes
Strconstant COLOR_BREWER_YlGn_3 = "0xf7fcb9; 0xaddd8e; 0x31a354;"
Strconstant COLOR_BREWER_YlGn_4 = "0xffffcc; 0xc2e699; 0x78c679; 0x238443;"
Strconstant COLOR_BREWER_YlGn_5 = "0xffffcc; 0xc2e699; 0x78c679; 0x31a354; 0x006837;"
Strconstant COLOR_BREWER_YlGn_6 = "0xffffcc; 0xd9f0a3; 0xaddd8e; 0x78c679; 0x31a354; 0x006837;"
Strconstant COLOR_BREWER_YlGn_7 = "0xffffcc; 0xd9f0a3; 0xaddd8e; 0x78c679; 0x41ab5d; 0x238443; 0x005a32;"
Strconstant COLOR_BREWER_YlGn_8 = "0xffffe5; 0xf7fcb9; 0xd9f0a3; 0xaddd8e; 0x78c679; 0x41ab5d; 0x238443; 0x005a32;"
Strconstant COLOR_BREWER_YlGn_9 = "0xffffe5; 0xf7fcb9; 0xd9f0a3; 0xaddd8e; 0x78c679; 0x41ab5d; 0x238443; 0x006837; 0x004529;"

Strconstant COLOR_BREWER_YlGnBu_3 = "0xedf8b1; 0x7fcdbb; 0x2c7fb8;"
Strconstant COLOR_BREWER_YlGnBu_4 = "0xffffcc; 0xa1dab4; 0x41b6c4; 0x225ea8;"
Strconstant COLOR_BREWER_YlGnBu_5 = "0xffffcc; 0xa1dab4; 0x41b6c4; 0x2c7fb8; 0x253494;"
Strconstant COLOR_BREWER_YlGnBu_6 = "0xffffcc; 0xc7e9b4; 0x7fcdbb; 0x41b6c4; 0x2c7fb8; 0x253494;"
Strconstant COLOR_BREWER_YlGnBu_7 = "0xffffcc; 0xc7e9b4; 0x7fcdbb; 0x41b6c4; 0x1d91c0; 0x225ea8; 0x0c2c84;"
Strconstant COLOR_BREWER_YlGnBu_8 = "0xffffd9; 0xedf8b1; 0xc7e9b4; 0x7fcdbb; 0x41b6c4; 0x1d91c0; 0x225ea8; 0x0c2c84;"
Strconstant COLOR_BREWER_YlGnBu_9 = "0xffffd9; 0xedf8b1; 0xc7e9b4; 0x7fcdbb; 0x41b6c4; 0x1d91c0; 0x225ea8; 0x253494; 0x081d58;"

Strconstant COLOR_BREWER_GnBu_3 = "0xe0f3db; 0xa8ddb5; 0x43a2ca;"
Strconstant COLOR_BREWER_GnBu_4 = "0xf0f9e8; 0xbae4bc; 0x7bccc4; 0x2b8cbe;"
Strconstant COLOR_BREWER_GnBu_5 = "0xf0f9e8; 0xbae4bc; 0x7bccc4; 0x43a2ca; 0x0868ac;"
Strconstant COLOR_BREWER_GnBu_6 = "0xf0f9e8; 0xccebc5; 0xa8ddb5; 0x7bccc4; 0x43a2ca; 0x0868ac;"
Strconstant COLOR_BREWER_GnBu_7 = "0xf0f9e8; 0xccebc5; 0xa8ddb5; 0x7bccc4; 0x4eb3d3; 0x2b8cbe; 0x08589e;"
Strconstant COLOR_BREWER_GnBu_8 = "0xf7fcf0; 0xe0f3db; 0xccebc5; 0xa8ddb5; 0x7bccc4; 0x4eb3d3; 0x2b8cbe; 0x08589e;"
Strconstant COLOR_BREWER_GnBu_9 = "0xf7fcf0; 0xe0f3db; 0xccebc5; 0xa8ddb5; 0x7bccc4; 0x4eb3d3; 0x2b8cbe; 0x0868ac; 0x084081;"

// BuGn (blue green)
Strconstant COLOR_BREWER_BuGn_3 = "0xe5f5f9; 0x99d8c9; 0x2ca25f;"
Strconstant COLOR_BREWER_BuGn_4 = "0xedf8fb; 0xb2e2e2; 0x66c2a4; 0x238b45;"
Strconstant COLOR_BREWER_BuGn_5 = "0xedf8fb; 0xb2e2e2; 0x66c2a4; 0x2ca25f; 0x006d2c;"
Strconstant COLOR_BREWER_BuGn_6 = "0xedf8fb; 0xccece6; 0x99d8c9; 0x66c2a4; 0x2ca25f; 0x006d2c;"
Strconstant COLOR_BREWER_BuGn_7 = "0xedf8fb; 0xccece6; 0x99d8c9; 0x66c2a4; 0x41ae76; 0x238b45; 0x005824;"
Strconstant COLOR_BREWER_BuGn_8 = "0xf7fcfd; 0xe5f5f9; 0xccece6; 0x99d8c9; 0x66c2a4; 0x41ae76; 0x238b45; 0x005824;"
Strconstant COLOR_BREWER_BuGn_9 = "0xf7fcfd; 0xe5f5f9; 0xccece6; 0x99d8c9; 0x66c2a4; 0x41ae76; 0x238b45; 0x006d2c; 0x00441b;"


Strconstant COLOR_BREWER_PuBuGn_3 = "0xece2f0; 0xa6bddb; 0x1c9099;"
Strconstant COLOR_BREWER_PuBuGn_4 = "0xf6eff7; 0xbdc9e1; 0x67a9cf; 0x02818a;"
Strconstant COLOR_BREWER_PuBuGn_5 = "0xf6eff7; 0xbdc9e1; 0x67a9cf; 0x1c9099; 0x016c59;"
Strconstant COLOR_BREWER_PuBuGn_6 = "0xf6eff7; 0xd0d1e6; 0xa6bddb; 0x67a9cf; 0x1c9099; 0x016c59;"
Strconstant COLOR_BREWER_PuBuGn_7 = "0xf6eff7; 0xd0d1e6; 0xa6bddb; 0x67a9cf; 0x3690c0; 0x02818a; 0x016450;"
Strconstant COLOR_BREWER_PuBuGn_8 = "0xfff7fb; 0xece2f0; 0xd0d1e6; 0xa6bddb; 0x67a9cf; 0x3690c0; 0x02818a; 0x016450;"
Strconstant COLOR_BREWER_PuBuGn_9 = "0xfff7fb; 0xece2f0; 0xd0d1e6; 0xa6bddb; 0x67a9cf; 0x3690c0; 0x02818a; 0x016c59; 0x014636;"

Strconstant COLOR_BREWER_PuBu_3 = "0xece7f2; 0xa6bddb; 0x2b8cbe;"
Strconstant COLOR_BREWER_PuBu_4 = "0xf1eef6; 0xbdc9e1; 0x74a9cf; 0x0570b0;"
Strconstant COLOR_BREWER_PuBu_5 = "0xf1eef6; 0xbdc9e1; 0x74a9cf; 0x2b8cbe; 0x045a8d;"
Strconstant COLOR_BREWER_PuBu_6 = "0xf1eef6; 0xd0d1e6; 0xa6bddb; 0x74a9cf; 0x2b8cbe; 0x045a8d;"
Strconstant COLOR_BREWER_PuBu_7 = "0xf1eef6; 0xd0d1e6; 0xa6bddb; 0x74a9cf; 0x3690c0; 0x0570b0; 0x034e7b;"
Strconstant COLOR_BREWER_PuBu_8 = "0xfff7fb; 0xece7f2; 0xd0d1e6; 0xa6bddb; 0x74a9cf; 0x3690c0; 0x0570b0; 0x034e7b;"
Strconstant COLOR_BREWER_PuBu_9 = "0xfff7fb; 0xece7f2; 0xd0d1e6; 0xa6bddb; 0x74a9cf; 0x3690c0; 0x0570b0; 0x045a8d; 0x023858;"

Strconstant COLOR_BREWER_BuPu_3 = "0xe0ecf4; 0x9ebcda; 0x8856a7;"
Strconstant COLOR_BREWER_BuPu_4 = "0xedf8fb; 0xb3cde3; 0x8c96c6; 0x88419d;"
Strconstant COLOR_BREWER_BuPu_5 = "0xedf8fb; 0xb3cde3; 0x8c96c6; 0x8856a7; 0x810f7c;"
Strconstant COLOR_BREWER_BuPu_6 = "0xedf8fb; 0xbfd3e6; 0x9ebcda; 0x8c96c6; 0x8856a7; 0x810f7c;"
Strconstant COLOR_BREWER_BuPu_7 = "0xedf8fb; 0xbfd3e6; 0x9ebcda; 0x8c96c6; 0x8c6bb1; 0x88419d; 0x6e016b;"
Strconstant COLOR_BREWER_BuPu_8 = "0xf7fcfd; 0xe0ecf4; 0xbfd3e6; 0x9ebcda; 0x8c96c6; 0x8c6bb1; 0x88419d; 0x6e016b;"
Strconstant COLOR_BREWER_BuPu_9 = "0xf7fcfd; 0xe0ecf4; 0xbfd3e6; 0x9ebcda; 0x8c96c6; 0x8c6bb1; 0x88419d; 0x810f7c; 0x4d004b;"

Strconstant COLOR_BREWER_RdPu_3 = "0xfde0dd; 0xfa9fb5; 0xc51b8a;"
Strconstant COLOR_BREWER_RdPu_4 = "0xfeebe2; 0xfbb4b9; 0xf768a1; 0xae017e;"
Strconstant COLOR_BREWER_RdPu_5 = "0xfeebe2; 0xfbb4b9; 0xf768a1; 0xc51b8a; 0x7a0177;"
Strconstant COLOR_BREWER_RdPu_6 = "0xfeebe2; 0xfcc5c0; 0xfa9fb5; 0xf768a1; 0xc51b8a; 0x7a0177;"
Strconstant COLOR_BREWER_RdPu_7 = "0xfeebe2; 0xfcc5c0; 0xfa9fb5; 0xf768a1; 0xdd3497; 0xae017e; 0x7a0177;"
Strconstant COLOR_BREWER_RdPu_8 = "0xfff7f3; 0xfde0dd; 0xfcc5c0; 0xfa9fb5; 0xf768a1; 0xdd3497; 0xae017e; 0x7a0177;"
Strconstant COLOR_BREWER_RdPu_9 = "0xfff7f3; 0xfde0dd; 0xfcc5c0; 0xfa9fb5; 0xf768a1; 0xdd3497; 0xae017e; 0x7a0177; 0x49006a;"

Strconstant COLOR_BREWER_PuRd_3 = "0xe7e1ef; 0xc994c7; 0xdd1c77;"
Strconstant COLOR_BREWER_PuRd_4 = "0xf1eef6; 0xd7b5d8; 0xdf65b0; 0xce1256;"
Strconstant COLOR_BREWER_PuRd_5 = "0xf1eef6; 0xd7b5d8; 0xdf65b0; 0xdd1c77; 0x980043;"
Strconstant COLOR_BREWER_PuRd_6 = "0xf1eef6; 0xd4b9da; 0xc994c7; 0xdf65b0; 0xdd1c77; 0x980043;"
Strconstant COLOR_BREWER_PuRd_7 = "0xf1eef6; 0xd4b9da; 0xc994c7; 0xdf65b0; 0xe7298a; 0xce1256; 0x91003f;"
Strconstant COLOR_BREWER_PuRd_8 = "0xf7f4f9; 0xe7e1ef; 0xd4b9da; 0xc994c7; 0xdf65b0; 0xe7298a; 0xce1256; 0x91003f;"
Strconstant COLOR_BREWER_PuRd_9 = "0xf7f4f9; 0xe7e1ef; 0xd4b9da; 0xc994c7; 0xdf65b0; 0xe7298a; 0xce1256; 0x980043; 0x67001f;"

Strconstant COLOR_BREWER_OrRd_3 = "0xfee8c8; 0xfdbb84; 0xe34a33;"
Strconstant COLOR_BREWER_OrRd_4 = "0xfef0d9; 0xfdcc8a; 0xfc8d59; 0xd7301f;"
Strconstant COLOR_BREWER_OrRd_5 = "0xfef0d9; 0xfdcc8a; 0xfc8d59; 0xe34a33; 0xb30000;"
Strconstant COLOR_BREWER_OrRd_6 = "0xfef0d9; 0xfdd49e; 0xfdbb84; 0xfc8d59; 0xe34a33; 0xb30000;"
Strconstant COLOR_BREWER_OrRd_7 = "0xfef0d9; 0xfdd49e; 0xfdbb84; 0xfc8d59; 0xef6548; 0xd7301f; 0x990000;"
Strconstant COLOR_BREWER_OrRd_8 = "0xfff7ec; 0xfee8c8; 0xfdd49e; 0xfdbb84; 0xfc8d59; 0xef6548; 0xd7301f; 0x990000;"
Strconstant COLOR_BREWER_OrRd_9 = "0xfff7ec; 0xfee8c8; 0xfdd49e; 0xfdbb84; 0xfc8d59; 0xef6548; 0xd7301f; 0xb30000; 0x7f0000;"

Strconstant COLOR_BREWER_YlOrRd_3 = "0xffeda0; 0xfeb24c; 0xf03b20;"
Strconstant COLOR_BREWER_YlOrRd_4 = "0xffffb2; 0xfecc5c; 0xfd8d3c; 0xe31a1c;"
Strconstant COLOR_BREWER_YlOrRd_5 = "0xffffb2; 0xfecc5c; 0xfd8d3c; 0xf03b20; 0xbd0026;"
Strconstant COLOR_BREWER_YlOrRd_6 = "0xffffb2; 0xfed976; 0xfeb24c; 0xfd8d3c; 0xf03b20; 0xbd0026;"
Strconstant COLOR_BREWER_YlOrRd_7 = "0xffffb2; 0xfed976; 0xfeb24c; 0xfd8d3c; 0xfc4e2a; 0xe31a1c; 0xb10026;"
Strconstant COLOR_BREWER_YlOrRd_8 = "0xffffcc; 0xffeda0; 0xfed976; 0xfeb24c; 0xfd8d3c; 0xfc4e2a; 0xe31a1c; 0xb10026;"
Strconstant COLOR_BREWER_YlOrRd_9 = "0xffffcc; 0xffeda0; 0xfed976; 0xfeb24c; 0xfd8d3c; 0xfc4e2a; 0xe31a1c; 0xbd0026; 0x800026;"

Strconstant COLOR_BREWER_YlOrBr_3 = "0xfff7bc; 0xfec44f; 0xd95f0e;"
Strconstant COLOR_BREWER_YlOrBr_4 = "0xffffd4; 0xfed98e; 0xfe9929; 0xcc4c02;"
Strconstant COLOR_BREWER_YlOrBr_5 = "0xffffd4; 0xfed98e; 0xfe9929; 0xd95f0e; 0x993404;"
Strconstant COLOR_BREWER_YlOrBr_6 = "0xffffd4; 0xfee391; 0xfec44f; 0xfe9929; 0xd95f0e; 0x993404;"
Strconstant COLOR_BREWER_YlOrBr_7 = "0xffffd4; 0xfee391; 0xfec44f; 0xfe9929; 0xec7014; 0xcc4c02; 0x8c2d04;"
Strconstant COLOR_BREWER_YlOrBr_8 = "0xffffe5; 0xfff7bc; 0xfee391; 0xfec44f; 0xfe9929; 0xec7014; 0xcc4c02; 0x8c2d04;"
Strconstant COLOR_BREWER_YlOrBr_9 = "0xffffe5; 0xfff7bc; 0xfee391; 0xfec44f; 0xfe9929; 0xec7014; 0xcc4c02; 0x993404; 0x662506;"

Strconstant COLOR_BREWER_Purples_3 = "0xefedf5; 0xbcbddc; 0x756bb1;"
Strconstant COLOR_BREWER_Purples_4 = "0xf2f0f7; 0xcbc9e2; 0x9e9ac8; 0x6a51a3;"
Strconstant COLOR_BREWER_Purples_5 = "0xf2f0f7; 0xcbc9e2; 0x9e9ac8; 0x756bb1; 0x54278f;"
Strconstant COLOR_BREWER_Purples_6 = "0xf2f0f7; 0xdadaeb; 0xbcbddc; 0x9e9ac8; 0x756bb1; 0x54278f;"
Strconstant COLOR_BREWER_Purples_7 = "0xf2f0f7; 0xdadaeb; 0xbcbddc; 0x9e9ac8; 0x807dba; 0x6a51a3; 0x4a1486;"
Strconstant COLOR_BREWER_Purples_8 = "0xfcfbfd; 0xefedf5; 0xdadaeb; 0xbcbddc; 0x9e9ac8; 0x807dba; 0x6a51a3; 0x4a1486;"
Strconstant COLOR_BREWER_Purples_9 = "0xfcfbfd; 0xefedf5; 0xdadaeb; 0xbcbddc; 0x9e9ac8; 0x807dba; 0x6a51a3; 0x54278f; 0x3f007d;"

Strconstant COLOR_BREWER_Blues_3 = "0xdeebf7; 0x9ecae1; 0x3182bd;"
Strconstant COLOR_BREWER_Blues_4 = "0xeff3ff; 0xbdd7e7; 0x6baed6; 0x2171b5;"
Strconstant COLOR_BREWER_Blues_5 = "0xeff3ff; 0xbdd7e7; 0x6baed6; 0x3182bd; 0x08519c;"
Strconstant COLOR_BREWER_Blues_6 = "0xeff3ff; 0xc6dbef; 0x9ecae1; 0x6baed6; 0x3182bd; 0x08519c;"
Strconstant COLOR_BREWER_Blues_7 = "0xeff3ff; 0xc6dbef; 0x9ecae1; 0x6baed6; 0x4292c6; 0x2171b5; 0x084594;"
Strconstant COLOR_BREWER_Blues_8 = "0xf7fbff; 0xdeebf7; 0xc6dbef; 0x9ecae1; 0x6baed6; 0x4292c6; 0x2171b5; 0x084594;"
Strconstant COLOR_BREWER_Blues_9 = "0xf7fbff; 0xdeebf7; 0xc6dbef; 0x9ecae1; 0x6baed6; 0x4292c6; 0x2171b5; 0x08519c; 0x08306b;"

Strconstant COLOR_BREWER_Greens_3 = "0xe5f5e0; 0xa1d99b; 0x31a354;"
Strconstant COLOR_BREWER_Greens_4 = "0xedf8e9; 0xbae4b3; 0x74c476; 0x238b45;"
Strconstant COLOR_BREWER_Greens_5 = "0xedf8e9; 0xbae4b3; 0x74c476; 0x31a354; 0x006d2c;"
Strconstant COLOR_BREWER_Greens_6 = "0xedf8e9; 0xc7e9c0; 0xa1d99b; 0x74c476; 0x31a354; 0x006d2c;"
Strconstant COLOR_BREWER_Greens_7 = "0xedf8e9; 0xc7e9c0; 0xa1d99b; 0x74c476; 0x41ab5d; 0x238b45; 0x005a32;"
Strconstant COLOR_BREWER_Greens_8 = "0xf7fcf5; 0xe5f5e0; 0xc7e9c0; 0xa1d99b; 0x74c476; 0x41ab5d; 0x238b45; 0x005a32;"
Strconstant COLOR_BREWER_Greens_9 = "0xf7fcf5; 0xe5f5e0; 0xc7e9c0; 0xa1d99b; 0x74c476; 0x41ab5d; 0x238b45; 0x006d2c; 0x00441b;"

Oranges: {
Strconstant COLOR_BREWER_Oranges_3 = "0xfee6ce; 0xfdae6b; 0xe6550d;"
Strconstant COLOR_BREWER_Oranges_4 = "0xfeedde; 0xfdbe85; 0xfd8d3c; 0xd94701;"
Strconstant COLOR_BREWER_Oranges_5 = "0xfeedde; 0xfdbe85; 0xfd8d3c; 0xe6550d; 0xa63603;"
Strconstant COLOR_BREWER_Oranges_6 = "0xfeedde; 0xfdd0a2; 0xfdae6b; 0xfd8d3c; 0xe6550d; 0xa63603;"
Strconstant COLOR_BREWER_Oranges_7 = "0xfeedde; 0xfdd0a2; 0xfdae6b; 0xfd8d3c; 0xf16913; 0xd94801; 0x8c2d04;"
Strconstant COLOR_BREWER_Oranges_8 = "0xfff5eb; 0xfee6ce; 0xfdd0a2; 0xfdae6b; 0xfd8d3c; 0xf16913; 0xd94801; 0x8c2d04;"
Strconstant COLOR_BREWER_Oranges_9 = "0xfff5eb; 0xfee6ce; 0xfdd0a2; 0xfdae6b; 0xfd8d3c; 0xf16913; 0xd94801; 0xa63603; 0x7f2704;"

Strconstant COLOR_BREWER_Reds_3 = "0xfee0d2; 0xfc9272; 0xde2d26;"
Strconstant COLOR_BREWER_Reds_4 = "0xfee5d9; 0xfcae91; 0xfb6a4a; 0xcb181d;"
Strconstant COLOR_BREWER_Reds_5 = "0xfee5d9; 0xfcae91; 0xfb6a4a; 0xde2d26; 0xa50f15;"
Strconstant COLOR_BREWER_Reds_6 = "0xfee5d9; 0xfcbba1; 0xfc9272; 0xfb6a4a; 0xde2d26; 0xa50f15;"
Strconstant COLOR_BREWER_Reds_7 = "0xfee5d9; 0xfcbba1; 0xfc9272; 0xfb6a4a; 0xef3b2c; 0xcb181d; 0x99000d;"
Strconstant COLOR_BREWER_Reds_8 = "0xfff5f0; 0xfee0d2; 0xfcbba1; 0xfc9272; 0xfb6a4a; 0xef3b2c; 0xcb181d; 0x99000d;"
Strconstant COLOR_BREWER_Reds_9 = "0xfff5f0; 0xfee0d2; 0xfcbba1; 0xfc9272; 0xfb6a4a; 0xef3b2c; 0xcb181d; 0xa50f15; 0x67000d;"

Strconstant COLOR_BREWER_Greys_3 = "0xf0f0f0; 0xbdbdbd; 0x636363;"
Strconstant COLOR_BREWER_Greys_4 = "0xf7f7f7; 0xcccccc; 0x969696; 0x525252;"
Strconstant COLOR_BREWER_Greys_5 = "0xf7f7f7; 0xcccccc; 0x969696; 0x636363; 0x252525;"
Strconstant COLOR_BREWER_Greys_6 = "0xf7f7f7; 0xd9d9d9; 0xbdbdbd; 0x969696; 0x636363; 0x252525;"
Strconstant COLOR_BREWER_Greys_7 = "0xf7f7f7; 0xd9d9d9; 0xbdbdbd; 0x969696; 0x737373; 0x525252; 0x252525;"
Strconstant COLOR_BREWER_Greys_8 = "0xffffff; 0xf0f0f0; 0xd9d9d9; 0xbdbdbd; 0x969696; 0x737373; 0x525252; 0x252525;"
Strconstant COLOR_BREWER_Greys_9 = "0xffffff; 0xf0f0f0; 0xd9d9d9; 0xbdbdbd; 0x969696; 0x737373; 0x525252; 0x252525; 0x000000;"


//** Diverging schemes

Strconstant COLOR_BREWER_PuOr_3 = "0xf1a340; 0xf7f7f7; 0x998ec3;"
Strconstant COLOR_BREWER_PuOr_4 = "0xe66101; 0xfdb863; 0xb2abd2; 0x5e3c99;"
Strconstant COLOR_BREWER_PuOr_5 = "0xe66101; 0xfdb863; 0xf7f7f7; 0xb2abd2; 0x5e3c99;"
Strconstant COLOR_BREWER_PuOr_6 = "0xb35806; 0xf1a340; 0xfee0b6; 0xd8daeb; 0x998ec3; 0x542788;"
Strconstant COLOR_BREWER_PuOr_7 = "0xb35806; 0xf1a340; 0xfee0b6; 0xf7f7f7; 0xd8daeb; 0x998ec3; 0x542788;"
Strconstant COLOR_BREWER_PuOr_8 = "0xb35806; 0xe08214; 0xfdb863; 0xfee0b6; 0xd8daeb; 0xb2abd2; 0x8073ac; 0x542788;"
Strconstant COLOR_BREWER_PuOr_9 = "0xb35806; 0xe08214; 0xfdb863; 0xfee0b6; 0xf7f7f7; 0xd8daeb; 0xb2abd2; 0x8073ac; 0x542788;"
Strconstant COLOR_BREWER_PuOr_10 = "0x7f3b08; 0xb35806; 0xe08214; 0xfdb863; 0xfee0b6; 0xd8daeb; 0xb2abd2; 0x8073ac; 0x542788; 0x2d004b;"
Strconstant COLOR_BREWER_PuOr_11 = "0x7f3b08; 0xb35806; 0xe08214; 0xfdb863; 0xfee0b6; 0xf7f7f7; 0xd8daeb; 0xb2abd2; 0x8073ac; 0x542788; 0x2d004b;"

Strconstant COLOR_BREWER_BrBG_3 = "0xd8b365; 0xf5f5f5; 0x5ab4ac;"
Strconstant COLOR_BREWER_BrBG_4 = "0xa6611a; 0xdfc27d; 0x80cdc1; 0x018571;"
Strconstant COLOR_BREWER_BrBG_5 = "0xa6611a; 0xdfc27d; 0xf5f5f5; 0x80cdc1; 0x018571;"
Strconstant COLOR_BREWER_BrBG_6 = "0x8c510a; 0xd8b365; 0xf6e8c3; 0xc7eae5; 0x5ab4ac; 0x01665e;"
Strconstant COLOR_BREWER_BrBG_7 = "0x8c510a; 0xd8b365; 0xf6e8c3; 0xf5f5f5; 0xc7eae5; 0x5ab4ac; 0x01665e;"
Strconstant COLOR_BREWER_BrBG_8 = "0x8c510a; 0xbf812d; 0xdfc27d; 0xf6e8c3; 0xc7eae5; 0x80cdc1; 0x35978f; 0x01665e;"
Strconstant COLOR_BREWER_BrBG_9 = "0x8c510a; 0xbf812d; 0xdfc27d; 0xf6e8c3; 0xf5f5f5; 0xc7eae5; 0x80cdc1; 0x35978f; 0x01665e;"
Strconstant COLOR_BREWER_BrBG_10 = "0x543005; 0x8c510a; 0xbf812d; 0xdfc27d; 0xf6e8c3; 0xc7eae5; 0x80cdc1; 0x35978f; 0x01665e; 0x003c30;"
Strconstant COLOR_BREWER_BrBG_11 = "0x543005; 0x8c510a; 0xbf812d; 0xdfc27d; 0xf6e8c3; 0xf5f5f5; 0xc7eae5; 0x80cdc1; 0x35978f; 0x01665e; 0x003c30;"

Strconstant COLOR_BREWER_PRGn_3 = "0xaf8dc3; 0xf7f7f7; 0x7fbf7b;"
Strconstant COLOR_BREWER_PRGn_4 = "0x7b3294; 0xc2a5cf; 0xa6dba0; 0x008837;"
Strconstant COLOR_BREWER_PRGn_5 = "0x7b3294; 0xc2a5cf; 0xf7f7f7; 0xa6dba0; 0x008837;"
Strconstant COLOR_BREWER_PRGn_6 = "0x762a83; 0xaf8dc3; 0xe7d4e8; 0xd9f0d3; 0x7fbf7b; 0x1b7837;"
Strconstant COLOR_BREWER_PRGn_7 = "0x762a83; 0xaf8dc3; 0xe7d4e8; 0xf7f7f7; 0xd9f0d3; 0x7fbf7b; 0x1b7837;"
Strconstant COLOR_BREWER_PRGn_8 = "0x762a83; 0x9970ab; 0xc2a5cf; 0xe7d4e8; 0xd9f0d3; 0xa6dba0; 0x5aae61; 0x1b7837;"
Strconstant COLOR_BREWER_PRGn_9 = "0x762a83; 0x9970ab; 0xc2a5cf; 0xe7d4e8; 0xf7f7f7; 0xd9f0d3; 0xa6dba0; 0x5aae61; 0x1b7837;"
Strconstant COLOR_BREWER_PRGn_10 = "0x40004b; 0x762a83; 0x9970ab; 0xc2a5cf; 0xe7d4e8; 0xd9f0d3; 0xa6dba0; 0x5aae61; 0x1b7837; 0x00441b;"
Strconstant COLOR_BREWER_PRGn_11 = "0x40004b; 0x762a83; 0x9970ab; 0xc2a5cf; 0xe7d4e8; 0xf7f7f7; 0xd9f0d3; 0xa6dba0; 0x5aae61; 0x1b7837; 0x00441b;"

Strconstant COLOR_BREWER_PiYG_3 = "0xe9a3c9; 0xf7f7f7; 0xa1d76a;"
Strconstant COLOR_BREWER_PiYG_4 = "0xd01c8b; 0xf1b6da; 0xb8e186; 0x4dac26;"
Strconstant COLOR_BREWER_PiYG_5 = "0xd01c8b; 0xf1b6da; 0xf7f7f7; 0xb8e186; 0x4dac26;"
Strconstant COLOR_BREWER_PiYG_6 = "0xc51b7d; 0xe9a3c9; 0xfde0ef; 0xe6f5d0; 0xa1d76a; 0x4d9221;"
Strconstant COLOR_BREWER_PiYG_7 = "0xc51b7d; 0xe9a3c9; 0xfde0ef; 0xf7f7f7; 0xe6f5d0; 0xa1d76a; 0x4d9221;"
Strconstant COLOR_BREWER_PiYG_8 = "0xc51b7d; 0xde77ae; 0xf1b6da; 0xfde0ef; 0xe6f5d0; 0xb8e186; 0x7fbc41; 0x4d9221;"
Strconstant COLOR_BREWER_PiYG_9 = "0xc51b7d; 0xde77ae; 0xf1b6da; 0xfde0ef; 0xf7f7f7; 0xe6f5d0; 0xb8e186; 0x7fbc41; 0x4d9221;"
Strconstant COLOR_BREWER_PiYG_10 = "0x8e0152; 0xc51b7d; 0xde77ae; 0xf1b6da; 0xfde0ef; 0xe6f5d0; 0xb8e186; 0x7fbc41; 0x4d9221; 0x276419;"
Strconstant COLOR_BREWER_PiYG_11 = "0x8e0152; 0xc51b7d; 0xde77ae; 0xf1b6da; 0xfde0ef; 0xf7f7f7; 0xe6f5d0; 0xb8e186; 0x7fbc41; 0x4d9221; 0x276419;"

Strconstant COLOR_BREWER_RdBu_3 = "0xef8a62; 0xf7f7f7; 0x67a9cf;"
Strconstant COLOR_BREWER_RdBu_4 = "0xca0020; 0xf4a582; 0x92c5de; 0x0571b0;"
Strconstant COLOR_BREWER_RdBu_5 = "0xca0020; 0xf4a582; 0xf7f7f7; 0x92c5de; 0x0571b0;"
Strconstant COLOR_BREWER_RdBu_6 = "0xb2182b; 0xef8a62; 0xfddbc7; 0xd1e5f0; 0x67a9cf; 0x2166ac;"
Strconstant COLOR_BREWER_RdBu_7 = "0xb2182b; 0xef8a62; 0xfddbc7; 0xf7f7f7; 0xd1e5f0; 0x67a9cf; 0x2166ac;"
Strconstant COLOR_BREWER_RdBu_8 = "0xb2182b; 0xd6604d; 0xf4a582; 0xfddbc7; 0xd1e5f0; 0x92c5de; 0x4393c3; 0x2166ac;"
Strconstant COLOR_BREWER_RdBu_9 = "0xb2182b; 0xd6604d; 0xf4a582; 0xfddbc7; 0xf7f7f7; 0xd1e5f0; 0x92c5de; 0x4393c3; 0x2166ac;"
Strconstant COLOR_BREWER_RdBu_10 = "0x67001f; 0xb2182b; 0xd6604d; 0xf4a582; 0xfddbc7; 0xd1e5f0; 0x92c5de; 0x4393c3; 0x2166ac; 0x053061;"
Strconstant COLOR_BREWER_RdBu_11 = "0x67001f; 0xb2182b; 0xd6604d; 0xf4a582; 0xfddbc7; 0xf7f7f7; 0xd1e5f0; 0x92c5de; 0x4393c3; 0x2166ac; 0x053061;"

Strconstant COLOR_BREWER_RdGy_3 = "0xef8a62; 0xffffff; 0x999999;"
Strconstant COLOR_BREWER_RdGy_4 = "0xca0020; 0xf4a582; 0xbababa; 0x404040;"
Strconstant COLOR_BREWER_RdGy_5 = "0xca0020; 0xf4a582; 0xffffff; 0xbababa; 0x404040;"
Strconstant COLOR_BREWER_RdGy_6 = "0xb2182b; 0xef8a62; 0xfddbc7; 0xe0e0e0; 0x999999; 0x4d4d4d;"
Strconstant COLOR_BREWER_RdGy_7 = "0xb2182b; 0xef8a62; 0xfddbc7; 0xffffff; 0xe0e0e0; 0x999999; 0x4d4d4d;"
Strconstant COLOR_BREWER_RdGy_8 = "0xb2182b; 0xd6604d; 0xf4a582; 0xfddbc7; 0xe0e0e0; 0xbababa; 0x878787; 0x4d4d4d;"
Strconstant COLOR_BREWER_RdGy_9 = "0xb2182b; 0xd6604d; 0xf4a582; 0xfddbc7; 0xffffff; 0xe0e0e0; 0xbababa; 0x878787; 0x4d4d4d;"
Strconstant COLOR_BREWER_RdGy_10 = "0x67001f; 0xb2182b; 0xd6604d; 0xf4a582; 0xfddbc7; 0xe0e0e0; 0xbababa; 0x878787; 0x4d4d4d; 0x1a1a1a;"
Strconstant COLOR_BREWER_RdGy_11 = "0x67001f; 0xb2182b; 0xd6604d; 0xf4a582; 0xfddbc7; 0xffffff; 0xe0e0e0; 0xbababa; 0x878787; 0x4d4d4d; 0x1a1a1a;"

Strconstant COLOR_BREWER_RdYlBu_3 = "0xfc8d59; 0xffffbf; 0x91bfdb;"
Strconstant COLOR_BREWER_RdYlBu_4 = "0xd7191c; 0xfdae61; 0xabd9e9; 0x2c7bb6;"
Strconstant COLOR_BREWER_RdYlBu_5 = "0xd7191c; 0xfdae61; 0xffffbf; 0xabd9e9; 0x2c7bb6;"
Strconstant COLOR_BREWER_RdYlBu_6 = "0xd73027; 0xfc8d59; 0xfee090; 0xe0f3f8; 0x91bfdb; 0x4575b4;"
Strconstant COLOR_BREWER_RdYlBu_7 = "0xd73027; 0xfc8d59; 0xfee090; 0xffffbf; 0xe0f3f8; 0x91bfdb; 0x4575b4;"
Strconstant COLOR_BREWER_RdYlBu_8 = "0xd73027; 0xf46d43; 0xfdae61; 0xfee090; 0xe0f3f8; 0xabd9e9; 0x74add1; 0x4575b4;"
Strconstant COLOR_BREWER_RdYlBu_9 = "0xd73027; 0xf46d43; 0xfdae61; 0xfee090; 0xffffbf; 0xe0f3f8; 0xabd9e9; 0x74add1; 0x4575b4;"
Strconstant COLOR_BREWER_RdYlBu_10 = "0xa50026; 0xd73027; 0xf46d43; 0xfdae61; 0xfee090; 0xe0f3f8; 0xabd9e9; 0x74add1; 0x4575b4; 0x313695;"
Strconstant COLOR_BREWER_RdYlBu_11 = "0xa50026; 0xd73027; 0xf46d43; 0xfdae61; 0xfee090; 0xffffbf; 0xe0f3f8; 0xabd9e9; 0x74add1; 0x4575b4; 0x313695;"

Strconstant COLOR_BREWER_Spectral_3 = "0xfc8d59; 0xffffbf; 0x99d594;"
Strconstant COLOR_BREWER_Spectral_4 = "0xd7191c; 0xfdae61; 0xabdda4; 0x2b83ba;"
Strconstant COLOR_BREWER_Spectral_5 = "0xd7191c; 0xfdae61; 0xffffbf; 0xabdda4; 0x2b83ba;"
Strconstant COLOR_BREWER_Spectral_6 = "0xd53e4f; 0xfc8d59; 0xfee08b; 0xe6f598; 0x99d594; 0x3288bd;"
Strconstant COLOR_BREWER_Spectral_7 = "0xd53e4f; 0xfc8d59; 0xfee08b; 0xffffbf; 0xe6f598; 0x99d594; 0x3288bd;"
Strconstant COLOR_BREWER_Spectral_8 = "0xd53e4f; 0xf46d43; 0xfdae61; 0xfee08b; 0xe6f598; 0xabdda4; 0x66c2a5; 0x3288bd;"
Strconstant COLOR_BREWER_Spectral_9 = "0xd53e4f; 0xf46d43; 0xfdae61; 0xfee08b; 0xffffbf; 0xe6f598; 0xabdda4; 0x66c2a5; 0x3288bd;"
Strconstant COLOR_BREWER_Spectral_10 = "0x9e0142; 0xd53e4f; 0xf46d43; 0xfdae61; 0xfee08b; 0xe6f598; 0xabdda4; 0x66c2a5; 0x3288bd; 0x5e4fa2;"
Strconstant COLOR_BREWER_Spectral_11 = "0x9e0142; 0xd53e4f; 0xf46d43; 0xfdae61; 0xfee08b; 0xffffbf; 0xe6f598; 0xabdda4; 0x66c2a5; 0x3288bd; 0x5e4fa2;"

Strconstant COLOR_BREWER_RdYlGn_3 = "0xfc8d59; 0xffffbf; 0x91cf60;"
Strconstant COLOR_BREWER_RdYlGn_4 = "0xd7191c; 0xfdae61; 0xa6d96a; 0x1a9641;"
Strconstant COLOR_BREWER_RdYlGn_5 = "0xd7191c; 0xfdae61; 0xffffbf; 0xa6d96a; 0x1a9641;"
Strconstant COLOR_BREWER_RdYlGn_6 = "0xd73027; 0xfc8d59; 0xfee08b; 0xd9ef8b; 0x91cf60; 0x1a9850;"
Strconstant COLOR_BREWER_RdYlGn_7 = "0xd73027; 0xfc8d59; 0xfee08b; 0xffffbf; 0xd9ef8b; 0x91cf60; 0x1a9850;"
Strconstant COLOR_BREWER_RdYlGn_8 = "0xd73027; 0xf46d43; 0xfdae61; 0xfee08b; 0xd9ef8b; 0xa6d96a; 0x66bd63; 0x1a9850;"
Strconstant COLOR_BREWER_RdYlGn_9 = "0xd73027; 0xf46d43; 0xfdae61; 0xfee08b; 0xffffbf; 0xd9ef8b; 0xa6d96a; 0x66bd63; 0x1a9850;"
Strconstant COLOR_BREWER_RdYlGn_10 = "0xa50026; 0xd73027; 0xf46d43; 0xfdae61; 0xfee08b; 0xd9ef8b; 0xa6d96a; 0x66bd63; 0x1a9850; 0x006837;"
Strconstant COLOR_BREWER_RdYlGn_11 = "0xa50026; 0xd73027; 0xf46d43; 0xfdae61; 0xfee08b; 0xffffbf; 0xd9ef8b; 0xa6d96a; 0x66bd63; 0x1a9850; 0x006837;"

//** Qualitative schemes

Strconstant COLOR_BREWER_Accent_3 = "0x7fc97f; 0xbeaed4; 0xfdc086;"
Strconstant COLOR_BREWER_Accent_4 = "0x7fc97f; 0xbeaed4; 0xfdc086; 0xffff99;"
Strconstant COLOR_BREWER_Accent_5 = "0x7fc97f; 0xbeaed4; 0xfdc086; 0xffff99; 0x386cb0;"
Strconstant COLOR_BREWER_Accent_6 = "0x7fc97f; 0xbeaed4; 0xfdc086; 0xffff99; 0x386cb0; 0xf0027f;"
Strconstant COLOR_BREWER_Accent_7 = "0x7fc97f; 0xbeaed4; 0xfdc086; 0xffff99; 0x386cb0; 0xf0027f; 0xbf5b17;"
Strconstant COLOR_BREWER_Accent_8 = "0x7fc97f; 0xbeaed4; 0xfdc086; 0xffff99; 0x386cb0; 0xf0027f; 0xbf5b17; 0x666666;"

Strconstant COLOR_BREWER_Dark2_3 = "0x1b9e77; 0xd95f02; 0x7570b3;"
Strconstant COLOR_BREWER_Dark2_4 = "0x1b9e77; 0xd95f02; 0x7570b3; 0xe7298a;"
Strconstant COLOR_BREWER_Dark2_5 = "0x1b9e77; 0xd95f02; 0x7570b3; 0xe7298a; 0x66a61e;"
Strconstant COLOR_BREWER_Dark2_6 = "0x1b9e77; 0xd95f02; 0x7570b3; 0xe7298a; 0x66a61e; 0xe6ab02;"
Strconstant COLOR_BREWER_Dark2_7 = "0x1b9e77; 0xd95f02; 0x7570b3; 0xe7298a; 0x66a61e; 0xe6ab02; 0xa6761d;"
Strconstant COLOR_BREWER_Dark2_8 = "0x1b9e77; 0xd95f02; 0x7570b3; 0xe7298a; 0x66a61e; 0xe6ab02; 0xa6761d; 0x666666;"

Strconstant COLOR_BREWER_Paired_3 = "0xa6cee3; 0x1f78b4; 0xb2df8a;"
Strconstant COLOR_BREWER_Paired_4 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c;"
Strconstant COLOR_BREWER_Paired_5 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c; 0xfb9a99;"
Strconstant COLOR_BREWER_Paired_6 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c; 0xfb9a99; 0xe31a1c;"
Strconstant COLOR_BREWER_Paired_7 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c; 0xfb9a99; 0xe31a1c; 0xfdbf6f;"
Strconstant COLOR_BREWER_Paired_8 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c; 0xfb9a99; 0xe31a1c; 0xfdbf6f; 0xff7f00;"
Strconstant COLOR_BREWER_Paired_9 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c; 0xfb9a99; 0xe31a1c; 0xfdbf6f; 0xff7f00; 0xcab2d6;"
Strconstant COLOR_BREWER_Paired_10 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c; 0xfb9a99; 0xe31a1c; 0xfdbf6f; 0xff7f00; 0xcab2d6; 0x6a3d9a;"
Strconstant COLOR_BREWER_Paired_11 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c; 0xfb9a99; 0xe31a1c; 0xfdbf6f; 0xff7f00; 0xcab2d6; 0x6a3d9a; 0xffff99;"
Strconstant COLOR_BREWER_Paired_12 = "0xa6cee3; 0x1f78b4; 0xb2df8a; 0x33a02c; 0xfb9a99; 0xe31a1c; 0xfdbf6f; 0xff7f00; 0xcab2d6; 0x6a3d9a; 0xffff99; 0xb15928;"

Strconstant COLOR_BREWER_Pastel1_3 = "0xfbb4ae; 0xb3cde3; 0xccebc5;"
Strconstant COLOR_BREWER_Pastel1_4 = "0xfbb4ae; 0xb3cde3; 0xccebc5; 0xdecbe4;"
Strconstant COLOR_BREWER_Pastel1_5 = "0xfbb4ae; 0xb3cde3; 0xccebc5; 0xdecbe4; 0xfed9a6;"
Strconstant COLOR_BREWER_Pastel1_6 = "0xfbb4ae; 0xb3cde3; 0xccebc5; 0xdecbe4; 0xfed9a6; 0xffffcc;"
Strconstant COLOR_BREWER_Pastel1_7 = "0xfbb4ae; 0xb3cde3; 0xccebc5; 0xdecbe4; 0xfed9a6; 0xffffcc; 0xe5d8bd;"
Strconstant COLOR_BREWER_Pastel1_8 = "0xfbb4ae; 0xb3cde3; 0xccebc5; 0xdecbe4; 0xfed9a6; 0xffffcc; 0xe5d8bd; 0xfddaec;"
Strconstant COLOR_BREWER_Pastel1_9 = "0xfbb4ae; 0xb3cde3; 0xccebc5; 0xdecbe4; 0xfed9a6; 0xffffcc; 0xe5d8bd; 0xfddaec; 0xf2f2f2;"

Strconstant COLOR_BREWER_Pastel2_3 = "0xb3e2cd; 0xfdcdac; 0xcbd5e8;"
Strconstant COLOR_BREWER_Pastel2_4 = "0xb3e2cd; 0xfdcdac; 0xcbd5e8; 0xf4cae4;"
Strconstant COLOR_BREWER_Pastel2_5 = "0xb3e2cd; 0xfdcdac; 0xcbd5e8; 0xf4cae4; 0xe6f5c9;"
Strconstant COLOR_BREWER_Pastel2_6 = "0xb3e2cd; 0xfdcdac; 0xcbd5e8; 0xf4cae4; 0xe6f5c9; 0xfff2ae;"
Strconstant COLOR_BREWER_Pastel2_7 = "0xb3e2cd; 0xfdcdac; 0xcbd5e8; 0xf4cae4; 0xe6f5c9; 0xfff2ae; 0xf1e2cc;"
Strconstant COLOR_BREWER_Pastel2_8 = "0xb3e2cd; 0xfdcdac; 0xcbd5e8; 0xf4cae4; 0xe6f5c9; 0xfff2ae; 0xf1e2cc; 0xcccccc;"

Strconstant COLOR_BREWER_Set1_3 = "0xe41a1c; 0x377eb8; 0x4daf4a;"
Strconstant COLOR_BREWER_Set1_4 = "0xe41a1c; 0x377eb8; 0x4daf4a; 0x984ea3;"
Strconstant COLOR_BREWER_Set1_5 = "0xe41a1c; 0x377eb8; 0x4daf4a; 0x984ea3; 0xff7f00;"
Strconstant COLOR_BREWER_Set1_6 = "0xe41a1c; 0x377eb8; 0x4daf4a; 0x984ea3; 0xff7f00; 0xffff33;"
Strconstant COLOR_BREWER_Set1_7 = "0xe41a1c; 0x377eb8; 0x4daf4a; 0x984ea3; 0xff7f00; 0xffff33; 0xa65628;"
Strconstant COLOR_BREWER_Set1_8 = "0xe41a1c; 0x377eb8; 0x4daf4a; 0x984ea3; 0xff7f00; 0xffff33; 0xa65628; 0xf781bf;"
Strconstant COLOR_BREWER_Set1_9 = "0xe41a1c; 0x377eb8; 0x4daf4a; 0x984ea3; 0xff7f00; 0xffff33; 0xa65628; 0xf781bf; 0x999999;"

Strconstant COLOR_BREWER_Set2_3 = "0x66c2a5; 0xfc8d62; 0x8da0cb;"
Strconstant COLOR_BREWER_Set2_4 = "0x66c2a5; 0xfc8d62; 0x8da0cb; 0xe78ac3;"
Strconstant COLOR_BREWER_Set2_5 = "0x66c2a5; 0xfc8d62; 0x8da0cb; 0xe78ac3; 0xa6d854;"
Strconstant COLOR_BREWER_Set2_6 = "0x66c2a5; 0xfc8d62; 0x8da0cb; 0xe78ac3; 0xa6d854; 0xffd92f;"
Strconstant COLOR_BREWER_Set2_7 = "0x66c2a5; 0xfc8d62; 0x8da0cb; 0xe78ac3; 0xa6d854; 0xffd92f; 0xe5c494;"
Strconstant COLOR_BREWER_Set2_8 = "0x66c2a5; 0xfc8d62; 0x8da0cb; 0xe78ac3; 0xa6d854; 0xffd92f; 0xe5c494; 0xb3b3b3;"

Strconstant COLOR_BREWER_Set3_3 = "0x8dd3c7; 0xffffb3; 0xbebada;"
Strconstant COLOR_BREWER_Set3_4 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072;"
Strconstant COLOR_BREWER_Set3_5 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072; 0x80b1d3;"
Strconstant COLOR_BREWER_Set3_6 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072; 0x80b1d3; 0xfdb462;"
Strconstant COLOR_BREWER_Set3_7 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072; 0x80b1d3; 0xfdb462; 0xb3de69;"
Strconstant COLOR_BREWER_Set3_8 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072; 0x80b1d3; 0xfdb462; 0xb3de69; 0xfccde5;"
Strconstant COLOR_BREWER_Set3_9 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072; 0x80b1d3; 0xfdb462; 0xb3de69; 0xfccde5; 0xd9d9d9;"
Strconstant COLOR_BREWER_Set3_10 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072; 0x80b1d3; 0xfdb462; 0xb3de69; 0xfccde5; 0xd9d9d9; 0xbc80bd;"
Strconstant COLOR_BREWER_Set3_11 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072; 0x80b1d3; 0xfdb462; 0xb3de69; 0xfccde5; 0xd9d9d9; 0xbc80bd; 0xccebc5;"
Strconstant COLOR_BREWER_Set3_12 = "0x8dd3c7; 0xffffb3; 0xbebada; 0xfb8072; 0x80b1d3; 0xfdb462; 0xb3de69; 0xfccde5; 0xd9d9d9; 0xbc80bd; 0xccebc5; 0xffed6f;"

#endif