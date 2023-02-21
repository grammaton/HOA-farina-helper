// Explicit Ambix formulas for High Order Ambisonics

// http://pcfarina.eng.unipr.it/Aurora/HOA_explicit_formulas.htm

/*
The goal of this page is to provide an univoque, explicit set of formulas
describing the amplitude of the Ambisonics polar patterns as function of
the azimuth and elevation angles, and also as a function of the three
cartesian coordinates of the unit vector pointing towards the sound source.

Unfortunately in the years many different Ambisonics formulations have been
employed, differing in naming, channel order, and gain normalization.

Furthermore, the Cartesian and Spherical coordinate systems have also been
messed up, again with wrong naming, polarity inversion, and so on.

So this page also serves for providing the correct information about all
these possible causes of errors.

The Cartesian reference must be conforming to ISO standards (for example,
ISO2631), as in the following picture:

The spherical coordinate system is coherent with this Cartesian reference
system: the azimuth angle (a) lies in the XY plane, starting form the X
axis and running towards the Y axis, so an azimut of 0 degrees means "Front",
90 degrees means "Left", 180 degrees means "Back" and -90 degrees (which
also equates to 270 degrees) means "Right". Elevation angle (e) is measured
from the horizontal plane, with positive elevations going up to the sky,
so e = 90 degrees means Zenith (or North pole) and e=-90 degrees means
Nadir (or South pole).

The usage of other symbols for azimuth and elevation must be discouraged.
Many people use θ (theta) and j (phi) for naming azimuth and elevation,
but these are often swapped (there is no univoque correspondance
establishing if theta is azimuth or elevation), and in some cases the
value of elevation is not starting from the horizontal plane, but instead
from the North pole and going down, as shown, for example, on the
Wikipedia page https://en.wikipedia.org/wiki/Spherical_coordinate_system,
where the two possible naming conventions are shown, but elevation is
always wrong.

Also the sign of azimuth is sometimes reversed: for example, in FB360
Spatial Workstation the elevation angle is correct, but the azimut is
reversed, with positive values going right instead of going left, as
it should be. The same problem occurs in Audio Ease and Ambix plugin
suites.

Luckily enough, most other software used for creating and manipulating
High Order Ambisonics signals are usually perfectly coherent with the
ISO 2631 standard adopted here, for example  O3A, Noise Makers, Wigware,
Ambdec, York University, Ambisonic Studio, Gerzonic, etc.

I hope that the information above serves for avoiding errors... And perhaps
the authors of software employing wrong conventions cited above will decide
to fix their crappy angular systems...

And now let's define the spherical harmonics functions, which provide the
direction-dependent gain of each of the Ambisonics signals.

These functions are defined in a series, with 2 more functions for each order,
providing an increasing spatial resolution. The following figure shows these
direction-dependent gain functions up to 7th order:

The meaning of the colors is the following:

RED means positive

BLUE means negative

And finally here we present the explicit formulas giving these gain functions,
either in polar and Cartesian coordinates, worked out from the formulas given
here, and corresponding to current standard Ambix format (that is, channel
ordering is ACN and gain normalization is SN3D - any other convention is nowadays
obsolete and should be completely avoided):

The original N3D formulas are here:

Original Formulas for High order Ambisonics (ACN N3D format up to 7th order)
http://pcfarina.eng.unipr.it/Aurora/HOA_ACN_N3D_formulas.htm

If you find errors in these formulas, please point them out to the author of this page...

*/

import ("seam.lib");

pp = hslider("polar", 0.5, 0, 1, 0.01);
az = 0-hslider("azimut", 0, -180, 180, 0.1) : sma.d2r;
el = hslider("elevation", 0, -180, 180, 0.1) : sma.d2r;

// BFORMAT
// first order 
a0 = 1; // 1/sqrt(2);
a1(a,e) = sin(a)*cos(e);
a2(e) = sin(e);
a3(a,e) = cos(a)*cos(e);
// second order
a4(a,e) = sqrt(3/4)*sin(2*a)*(cos(e))^2;
a5(a,e) = sqrt(3/4)*sin(a)*sin(2*e);
a6(e) = (1/2)*(3*(sin(e))^2-1);
a7(a,e) = sqrt(3/4)*cos(a)*sin(2*e);
a8(a,e) = sqrt(3/4)*cos(2*a)*(cos(e))^2;
// third order
a9(a,e) = sqrt(5/8)*sin(3*a)*(cos(e))^3;
a10(a,e) = sqrt(15/4)*sin(2*a)*sin(e)*(cos(e))^2;
a11(a,e) = sqrt(3/8)*sin(a)*cos(e)*(5*(sin(e))^2-1);
a12(e) = (1/2)*sin(e)*(5*(sin(e))^2-3);
a13(a,e) = sqrt(3/8)*cos(a)*cos(e)*(5*(sin(e))^2-1);
a14(a,e) = sqrt(15/4)*cos(2*a)*sin(e)*(cos(e))^2;
a15(a,e) = sqrt(5/8)*cos(3*a)*(cos(e))^3;
// fourth order
a16(a,e) = sqrt(35/64)*sin(4*a)*(cos(e))^4;
a17(a,e) = sqrt(35/8)*sin(3*a)*sin(e)*(cos(e))^3;
a18(a,e) = sqrt(5/16)*sin(2*a)*(cos(e))^2*(7*(sin(e))^2-1);
a19(a,e) = sqrt(5/32)*sin(a)*sin(2*e)*(7*(sin(e))^2-3);
a20(e) = 1/8*(35*sin(e)^4-30*sin(e)^2+3);
a21(a,e) = sqrt(5/32)*cos(a)*sin(2*e)*(7*(sin(e))^2-3);
a22(a,e) = sqrt(5/16)*cos(2*a)*(cos(e))^2*(7*(sin(e))^2-1);
a23(a,e) = sqrt(35/8)*cos(3*a)*sin(e)*(cos(e))^3;
a24(a,e) = sqrt(35/64)*cos(4*a)*(cos(e))^4;
// fifth order
a25(a,e) = sqrt(63/128)*sin(5*a)*(cos(e))^5;
a26(a,e) = sqrt(315/64)*sin(4*a)*sin(e)*(cos(e))^4;
a27(a,e) = sqrt(35/128)*sin(3*a)*(cos(e))^3*(9*(sin(e))^2-1);
a28(a,e) = sqrt(105/16)*sin(2*a)*sin(e)*(cos(e))^2*(3*(sin(e))^2-1);
a29(a,e) = sqrt(15/64)*sin(a)*cos(e)*(21*(sin(e))^4-14*(sin(e))^2+1);
a30(e) = 1/8*(63*(sin(e))^5-70*sin(e)^3+15*sin(e));
a31(a,e) = sqrt(15/64)*cos(a)*cos(e)*(21*(sin(e))^4-14*(sin(e))^2+1);
a32(a,e) = sqrt(105/16)*cos(2*a)*sin(e)*(cos(e))^2*(3*(sin(e))^2-1);
a33(a,e) = sqrt(35/128)*cos(3*a)*(cos(e))^3*(9*(sin(e))^2-1);
a34(a,e) = sqrt(315/64)*cos(4*a)*sin(e)*(cos(e))^4;
a35(a,e) = sqrt(63/128)*cos(5*a)*(cos(e))^5;
// sixth order
a36(a,e) = 1/16*sqrt(231/2)*sin(6*a)*(cos(e))^6;
a37(a,e) = 3/8*sqrt(77/2)*sin(5*a)*sin(e)*(cos(e))^5;
a38(a,e) = 3/16*sqrt(7)*sin(4*a)*(cos(e))^4*(11*(sin(e))^2-1);
a39(a,e) = 1/8*sqrt(105/2)*sin(3*a)*sin(e)*(cos(e))^3*(11*(sin(e))^2-3);
//a40(a,e) = 1/16*sqrt(105/2)*sin(2*a)*(cos(e))^2*(33*(sin(e))^4-18(sin(e))^2+1);
// ----------------------------------------------------------------^ manca un per
a40(a,e) = 1/16*sqrt(105/2)*sin(2*a)*(cos(e))^2*(33*(sin(e))^4-18*(sin(e))^2+1);
a41(a,e) = 1/16*sqrt(21)*sin(a)*sin(2*e)*(33*(sin(e))^4-30*(sin(e))^2+5);
a42(e) = 1/16*(231*(sin(e))^6-315*(sin(e))^4+105*(sin(e))^2-5);
a43(a,e) = 1/16*sqrt(21)*cos(a)*sin(2*e)*(33*(sin(e))^4-30*(sin(e))^2+5);
a44(a,e) = 1/16*sqrt(105/2)*cos(2*a)*(cos(e))^2*(33*(sin(e))^4-18*(sin(e))^2+1);
//a44(a,e) = 1/16*sqrt(105/2)*cos(2*a)*(cos(e))^2*(33*(sin(e))^4-18(sin(e))^2+1);
// --------------------------------------------------------------^ manca un per
a45(a,e) = 1/8*sqrt(105/2)*cos(3*a)*sin(e)*(cos(e))^3*(11*(sin(e))^2-3);
a46(a,e) = 3/16*sqrt(7)*cos(4*a)*(cos(e))^4*(11*(sin(e))^2-1);
a47(a,e) = 3/8*sqrt(77/2)*cos(5*a)*sin(e)*(cos(e))^5;
a48(a,e) = 1/16*sqrt(231/2)*cos(6*a)*(cos(e))^6;
// seventh order
a49(a,e) = 1/32*sqrt(429)*sin(7*a)*(cos(e))^7;
a50(a,e) = 1/16*sqrt(3003/2)*sin(6*a)*sin(e)*(cos(e))^6;
a51(a,e) = 1/32*sqrt(231)*sin(5*a)*(13*(sin(e))^2-1)*(cos(e))^5;
a52(a,e) = 1/16*sqrt(231)*sin(4*a)*(13*(sin(e))^3-3*sin(e))*(cos(e))^4;
a53(a,e) = 1/32*sqrt(21)*sin(3*a)*(143*(sin(e))^4-66*(sin(e))^2+3)*(cos(e))^3;
a54(a,e) = 1/16*sqrt(21/2)*sin(2*a)*(143*(sin(e))^5-110*(sin(e))^3+15*sin(e))*(cos(e))^2;
a55(a,e) = 1/32*sqrt(7)*sin(a)*(429*(sin(e))^6-495*(sin(e))^4+135*(sin(e))^2-5)*cos(e);
a56(e) = 1/16*(429*(sin(e))^7-693*(sin(e))^5+315*(sin(e))^3-35*sin(e));
a57(a,e) = 1/32*sqrt(7)*cos(a)*(429*(sin(e))^6-495*(sin(e))^4+135*(sin(e))^2-5)*cos(e);
a58(a,e) = 1/16*sqrt(21/2)*cos(2*a)*(143*(sin(e))^5-110*(sin(e))^3+15*sin(e))*(cos(e))^2;
a59(a,e) = 1/32*sqrt(21)*cos(3*a)*(143*(sin(e))^4-66*(sin(e))^2+3)*(cos(e))^3;
a60(a,e) = 1/16*sqrt(231)*cos(4*a)*(13*(sin(e))^3-3*sin(e))*(cos(e))^4;
a61(a,e) = 1/32*sqrt(231)*cos(5*a)*(13*(sin(e))^2-1)*(cos(e))^5;
a62(a,e) = 1/16*sqrt(3003/2)*cos(6*a)*sin(e)*(cos(e))^6;
a63(a,e) = 1/32*sqrt(429)*cos(7*a)*(cos(e))^7;

// ENCODERS
// mono to first order
mto1o(a,e) = _ <: _*a0,
                  _*a1(a,e),
                  _*a2(e),
                  _*a3(a,e);

// mono to second order
mto2o(a,e) = _ <: _*a0,
                  _*a1(a,e),
                  _*a2(e),
                  _*a3(a,e),
                  _*a4(a,e),
                  _*a5(a,e),
                  _*a6(e),
                  _*a7(a,e),
                  _*a8(a,e);

// mono to third order
mto3o(a,e) = _ <: _*a0,
                  _*a1(a,e),
                  _*a2(e),
                  _*a3(a,e),
                  _*a4(a,e),
                  _*a5(a,e),
                  _*a6(e),
                  _*a7(a,e),
                  _*a8(a,e),
                  _*a9(a,e),
                  _*a10(a,e),
                  _*a11(a,e),
                  _*a12(e),
                  _*a13(a,e),
                  _*a14(a,e),
                  _*a15(a,e);

// mono to fourth order
mto4o(a,e) = _ <: _*a0,
                  _*a1(a,e),
                  _*a2(e),
                  _*a3(a,e),
                  _*a4(a,e),
                  _*a5(a,e),
                  _*a6(e),
                  _*a7(a,e),
                  _*a8(a,e),
                  _*a9(a,e),
                  _*a10(a,e),
                  _*a11(a,e),
                  _*a12(e),
                  _*a13(a,e),
                  _*a14(a,e),
                  _*a15(a,e),
                  _*a16(a,e),
                  _*a17(a,e),
                  _*a18(a,e),
                  _*a19(a,e),
                  _*a20(e),
                  _*a21(a,e),
                  _*a22(a,e),
                  _*a23(a,e),
                  _*a24(a,e); 

// mono to fifth order
mto5o(a,e) = _ <: _*a0,
                  _*a1(a,e),
                  _*a2(e),
                  _*a3(a,e),
                  _*a4(a,e),
                  _*a5(a,e),
                  _*a6(e),
                  _*a7(a,e),
                  _*a8(a,e),
                  _*a9(a,e),
                  _*a10(a,e),
                  _*a11(a,e),
                  _*a12(e),
                  _*a13(a,e),
                  _*a14(a,e),
                  _*a15(a,e),
                  _*a16(a,e),
                  _*a17(a,e),
                  _*a18(a,e),
                  _*a19(a,e),
                  _*a20(e),
                  _*a21(a,e),
                  _*a22(a,e),
                  _*a23(a,e),
                  _*a24(a,e),
                  _*a25(a,e),
                  _*a26(a,e),
                  _*a27(a,e),
                  _*a28(a,e),
                  _*a29(a,e),
                  _*a30(e),
                  _*a31(a,e),
                  _*a32(a,e),
                  _*a33(a,e),
                  _*a34(a,e),
                  _*a35(a,e);

// mono to sixth order
mto6o(a,e) = _ <: _*a0,
                  _*a1(a,e),
                  _*a2(e),
                  _*a3(a,e),
                  _*a4(a,e),
                  _*a5(a,e),
                  _*a6(e),
                  _*a7(a,e),
                  _*a8(a,e),
                  _*a9(a,e),
                  _*a10(a,e),
                  _*a11(a,e),
                  _*a12(e),
                  _*a13(a,e),
                  _*a14(a,e),
                  _*a15(a,e),
                  _*a16(a,e),
                  _*a17(a,e),
                  _*a18(a,e),
                  _*a19(a,e),
                  _*a20(e),
                  _*a21(a,e),
                  _*a22(a,e),
                  _*a23(a,e),
                  _*a24(a,e),
                  _*a25(a,e),
                  _*a26(a,e),
                  _*a27(a,e),
                  _*a28(a,e),
                  _*a29(a,e),
                  _*a30(e),
                  _*a31(a,e),
                  _*a32(a,e),
                  _*a33(a,e),
                  _*a34(a,e),
                  _*a35(a,e),
                  _*a36(a,e),
                  _*a37(a,e),
                  _*a38(a,e),
                  _*a39(a,e),
                  _*a40(a,e),
                  _*a41(a,e),
                  _*a42(e),
                  _*a43(a,e),
                  _*a44(a,e),
                  _*a45(a,e),
                  _*a46(a,e),
                  _*a47(a,e),
                  _*a48(a,e);

// mono to seventh order
mto7o(a,e) = _ <: _*a0,
                  _*a1(a,e),
                  _*a2(e),
                  _*a3(a,e),
                  _*a4(a,e),
                  _*a5(a,e),
                  _*a6(e),
                  _*a7(a,e),
                  _*a8(a,e),
                  _*a9(a,e),
                  _*a10(a,e),
                  _*a11(a,e),
                  _*a12(e),
                  _*a13(a,e),
                  _*a14(a,e),
                  _*a15(a,e),
                  _*a16(a,e),
                  _*a17(a,e),
                  _*a18(a,e),
                  _*a19(a,e),
                  _*a20(e),
                  _*a21(a,e),
                  _*a22(a,e),
                  _*a23(a,e),
                  _*a24(a,e),
                  _*a25(a,e),
                  _*a26(a,e),
                  _*a27(a,e),
                  _*a28(a,e),
                  _*a29(a,e),
                  _*a30(e),
                  _*a31(a,e),
                  _*a32(a,e),
                  _*a33(a,e),
                  _*a34(a,e),
                  _*a35(a,e),
                  _*a36(a,e),
                  _*a37(a,e),
                  _*a38(a,e),
                  _*a39(a,e),
                  _*a40(a,e),
                  _*a41(a,e),
                  _*a42(e),
                  _*a43(a,e),
                  _*a44(a,e),
                  _*a45(a,e),
                  _*a46(a,e),
                  _*a47(a,e),
                  _*a48(a,e),
                  _*a49(a,e),
                  _*a50(a,e),
                  _*a51(a,e),
                  _*a52(a,e),
                  _*a53(a,e),
                  _*a54(a,e),
                  _*a55(a,e),
                  _*a56(e),
                  _*a57(a,e),
                  _*a58(a,e),
                  _*a59(a,e),
                  _*a60(a,e),
                  _*a61(a,e),
                  _*a62(a,e),
                  _*a63(a,e);

// VMIC DECODERS
vmic1(a,e,pp) = _*a0*(1-pp) + (pp*(_*a1(a,e) +
                                   _*a2(e))) +
                                   _*a3(a,e);

vmic2(a,e,pp) = _*a0*(1-pp) + (pp*(_*a1(a,e) +
                                   _*a2(e) +
                                   _*a3(a,e) +
                                   _*a4(a,e) +
                                   _*a5(a,e) +
                                   _*a6(e) +
                                   _*a7(a,e) +
                                   _*a8(a,e)));

vmic3(a,e,pp) = _*a0*(1-pp) + (pp*(_*a1(a,e) +
                                   _*a2(e) +
                                   _*a3(a,e) +
                                   _*a4(a,e) + 
                                   _*a5(a,e) +
                                   _*a6(e) +
                                   _*a7(a,e) +
                                   _*a8(a,e) +
                                   _*a9(a,e) +
                                   _*a10(a,e) +
                                   _*a11(a,e) +
                                   _*a12(e) +
                                   _*a13(a,e) +
                                   _*a14(a,e) +
                                   _*a15(a,e)));                               

vmic4(a,e,pp) = _*a0*(1-pp) + (pp*(_*a1(a,e) +
                                   _*a2(e) +
                                   _*a3(a,e) +
                                   _*a4(a,e) + 
                                   _*a5(a,e) +
                                   _*a6(e) +
                                   _*a7(a,e) +
                                   _*a8(a,e) +
                                   _*a9(a,e) +
                                   _*a10(a,e) +
                                   _*a11(a,e) +
                                   _*a12(e) +
                                   _*a13(a,e) +
                                   _*a14(a,e) +
                                   _*a15(a,e) +
                                   _*a16(a,e) +
                                   _*a17(a,e) +
                                   _*a18(a,e) +
                                   _*a19(a,e) +
                                   _*a20(e) +
                                   _*a21(a,e) +
                                   _*a22(a,e) +
                                   _*a23(a,e) +
                                   _*a24(a,e)));

vmic5(a,e,pp) = _*a0*(1-pp) + (pp*(_*a1(a,e) +
                                   _*a2(e) +
                                   _*a3(a,e) +
                                   _*a4(a,e) + 
                                   _*a5(a,e) +
                                   _*a6(e) +
                                   _*a7(a,e) +
                                   _*a8(a,e) +
                                   _*a9(a,e) +
                                   _*a10(a,e) +
                                   _*a11(a,e) +
                                   _*a12(e) +
                                   _*a13(a,e) +
                                   _*a14(a,e) +
                                   _*a15(a,e) +
                                   _*a16(a,e) +
                                   _*a17(a,e) +
                                   _*a18(a,e) +
                                   _*a19(a,e) +
                                   _*a20(e) +
                                   _*a21(a,e) +
                                   _*a22(a,e) +
                                   _*a23(a,e) +
                                   _*a24(a,e) +
                                   _*a25(a,e) +
                                   _*a26(a,e) +
                                   _*a27(a,e) +
                                   _*a28(a,e) +
                                   _*a29(a,e) +
                                   _*a30(e) +
                                   _*a31(a,e) +
                                   _*a32(a,e) +
                                   _*a33(a,e) +
                                   _*a34(a,e) +
                                   _*a35(a,e)));

vmic6(a,e,pp) = _*a0*(1-pp) + (pp*(_*a1(a,e) +
                                   _*a2(e) +
                                   _*a3(a,e) +
                                   _*a4(a,e) + 
                                   _*a5(a,e) +
                                   _*a6(e) +
                                   _*a7(a,e) +
                                   _*a8(a,e) +
                                   _*a9(a,e) +
                                   _*a10(a,e) +
                                   _*a11(a,e) +
                                   _*a12(e) +
                                   _*a13(a,e) +
                                   _*a14(a,e) +
                                   _*a15(a,e) +
                                   _*a16(a,e) +
                                   _*a17(a,e) +
                                   _*a18(a,e) +
                                   _*a19(a,e) +
                                   _*a20(e) +
                                   _*a21(a,e) +
                                   _*a22(a,e) +
                                   _*a23(a,e) +
                                   _*a24(a,e) +
                                   _*a25(a,e) +
                                   _*a26(a,e) +
                                   _*a27(a,e) +
                                   _*a28(a,e) +
                                   _*a29(a,e) +
                                   _*a30(e) +
                                   _*a31(a,e) +
                                   _*a32(a,e) +
                                   _*a33(a,e) +
                                   _*a34(a,e) +
                                   _*a35(a,e) +
                                   _*a36(a,e) +
                                   _*a37(a,e) +
                                   _*a38(a,e) +
                                   _*a39(a,e) +
                                   _*a40(a,e) +
                                   _*a41(a,e) +
                                   _*a42(e) +
                                   _*a43(a,e) +
                                   _*a44(a,e) +
                                   _*a45(a,e) +
                                   _*a46(a,e) +
                                   _*a47(a,e) +
                                   _*a48(a,e)));

vmic7(a,e,pp) = _*a0*(1-pp) + (pp*(_*a1(a,e) +
                                   _*a2(e) +
                                   _*a3(a,e) +
                                   _*a4(a,e) + 
                                   _*a5(a,e) +
                                   _*a6(e) +
                                   _*a7(a,e) +
                                   _*a8(a,e) +
                                   _*a9(a,e) +
                                   _*a10(a,e) +
                                   _*a11(a,e) +
                                   _*a12(e) +
                                   _*a13(a,e) +
                                   _*a14(a,e) +
                                   _*a15(a,e) +
                                   _*a16(a,e) +
                                   _*a17(a,e) +
                                   _*a18(a,e) +
                                   _*a19(a,e) +
                                   _*a20(e) +
                                   _*a21(a,e) +
                                   _*a22(a,e) +
                                   _*a23(a,e) +
                                   _*a24(a,e) +
                                   _*a25(a,e) +
                                   _*a26(a,e) +
                                   _*a27(a,e) +
                                   _*a28(a,e) +
                                   _*a29(a,e) +
                                   _*a30(e) +
                                   _*a31(a,e) +
                                   _*a32(a,e) +
                                   _*a33(a,e) +
                                   _*a34(a,e) +
                                   _*a35(a,e) +
                                   _*a36(a,e) +
                                   _*a37(a,e) +
                                   _*a38(a,e) +
                                   _*a39(a,e) +
                                   _*a40(a,e) +
                                   _*a41(a,e) +
                                   _*a42(e) +
                                   _*a43(a,e) +
                                   _*a44(a,e) +
                                   _*a45(a,e) +
                                   _*a46(a,e) +
                                   _*a47(a,e) +
                                   _*a48(a,e) +
                                   _*a49(a,e) +
                                   _*a50(a,e) +
                                   _*a51(a,e) +
                                   _*a52(a,e) +
                                   _*a53(a,e) +
                                   _*a54(a,e) +
                                   _*a55(a,e) +
                                   _*a56(e) +
                                   _*a57(a,e) +
                                   _*a58(a,e) +
                                   _*a59(a,e) +
                                   _*a60(a,e) + 
                                   _*a61(a,e) +
                                   _*a62(a,e) +
                                   _*a63(a,e)));

// process = os.osc(1000) : mto1o(0,0) : vmic1(az,el,pp);
// process = os.osc(1000) <: _, _*u(az,el);
// process = os.osc(1000)/sqrt(2) : mto2o(ma.PI/10,ma.PI/9) : vmic2(az,el,pp);
// process = os.osc(1000)/sqrt(2) : mto3o(ma.PI/10,ma.PI/9) : vmic3(az,el,pp);
// process = os.osc(700)/sqrt(2) : mto3o(ma.PI/10,ma.PI/9) <: par(i, 4, vmic3(ma.PI-(ma.PI/(i+1)),0,0.5));
// process = os.osc(700)/sqrt(2) : mto4o(ma.PI/10,ma.PI/9) : vmic4(az,el,pp);
// process = os.osc(700)/sqrt(2) : mto5o(ma.PI/10,ma.PI/9) : vmic5(az,el,pp);
// process = os.osc(700)/sqrt(2) : mto6o(ma.PI/10,ma.PI/9) : vmic6(az,el,pp);
process = os.osc(700)/sqrt(2) : mto7o(ma.PI/10,ma.PI/9) : vmic7(az,el,pp);

//ACN
w = a0;
x(a,e) = a3(a,e);
y(a,e) = a1(a,e);
z(e) = a2(e);
v(a,e) = a4(a,e);
t(a,e) = a5(a,e);
r(e) = a6(e);
s(a,e) = a7(a,e);
u(a,e) = a8(a,e);
q(a,e) = a9(a,e);
o(a,e) = a10(a,e);
m(a,e) = a11(a,e);
k(e) = a12(e);
l(a,e) = a13(a,e);
n(a,e) = a14(a,e);
p(a,e) = a15(a,e);