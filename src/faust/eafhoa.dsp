// Explicit Ambix formulas for High Order Ambisonics

// http://pcfarina.eng.unipr.it/Aurora/HOA_explicit_formulas.htm

/*
The goal of this page is to provide an univoque, explicit set of formulas describing the amplitude of the Ambisonics polar patterns as function of the azimuth and elevation angles, and also as a function of the three cartesian coordinates of the unit vector pointing towards the sound source.

Unfortunately in the years many different Ambisonics formulations have been employed, differing in naming, channel order, and gain normalization.

Furthermore, the Cartesian and Spherical coordinate systems have also been messed up, again with wrong naming, polarity inversion, and so on.

So this page also serves for providing the correct information about all these possible causes of errors.

The Cartesian reference must be conforming to ISO standards (for example, ISO2631), as in the following picture:

The spherical coordinate system is coherent with this Cartesian reference system: the azimuth angle (a) lies in the XY plane, starting form the X axis and running towards the Y axis, so an azimut of 0 degrees means "Front", 90 degrees means "Left", 180 degrees means "Back" and -90 degrees (which also equates to 270 degrees) means "Right". Elevation angle (e) is measured from the horizontal plane, with positive elevations going up to the sky, so e = 90 degrees means Zenith (or North pole) and e=-90 degrees means Nadir (or South pole).

The usage of other symbols for azimuth and elevation must be discouraged. Many people use θ (theta) and j (phi) for naming azimuth and elevation, but these are often swapped (there is no univoque correspondance establishing if theta is azimuth or elevation), and in some cases the value of elevation is not starting from the horizontal plane, but instead from the North pole and going down, as shown, for example, on the Wikipedia page https://en.wikipedia.org/wiki/Spherical_coordinate_system, where the two possible naming conventions are shown, but elevation is always wrong.

Also the sign of azimuth is sometimes reversed: for example, in FB360 Spatial Workstation the elevation angle is correct, but the azimut is reversed, with positive values going right instead of going left, as it should be. The same problem occurs in Audio Ease and Ambix plugin suites.

Luckily enough, most other software used for creating and manipulating High Order Ambisonics signals are usually perfectly coherent with the ISO 2631 standard adopted here, for example  O3A, Noise Makers, Wigware, Ambdec, York University, Ambisonic Studio, Gerzonic, etc.

I hope that the information above serves for avoiding errors... And perhaps the authors of software employing wrong conventions cited above will decide to fix their crappy angular systems...

And now let's define the spherical harmonics functions, which provide the direction-dependent gain of each of the Ambisonics signals.

These functions are defined in a series, with 2 more functions for each order, providing an increasing spatial resolution. The following figure shows these direction-dependent gain functions up to 7th order:

The meaning of the colors is the following:

RED means positive

BLUE means negative

And finally here we present the explicit formulas giving these gain functions, either in polar and Cartesian coordinates, worked out from the formulas given here, and corresponding to current standard Ambix format (that is, channel ordering is ACN and gain normalization is SN3D - any other convention is nowadays obsolete and should be completely avoided):

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
w = 1; // 1/sqrt(2);
x(a,e) = cos(a)*cos(e);
y(a,e) = sin(a)*cos(e);
z(e) = sin(e);

m2bfmt(a,e) = _ <: _*w,
                   _*x(a,e),
                   _*y(a,e),
                   _*z(e);

vmic1(a,e,p) = _*w*(1-p) + (p*(_*x(a,e) +
                               _*y(a,e) +
                               _*z(e)));
//process = os.osc(1000) : m2bfmt(0,0) : vmic1(az,el,pp);

// second order
r(e) = (1/2)*(3*(sin(e))^2-1);
s(a,e) = sqrt(3/4)*cos(a)*sin(2*e);
t(a,e) = sqrt(3/4)*sin(a)*sin(2*e);
u(a,e) = sqrt(3/4)*cos(2*a)*(cos(e))^2;
v(a,e) = sqrt(3/4)*sin(2*a)*(cos(e))^2;

process = os.osc(1000) <: _, _*u(az,el);

m2ndo(a,e) = _ <: _*w,
                  _*x(a,e),
                  _*y(a,e),
                  _*z(e),
                  _*r(e),
                  _*s(a,e),
                  _*t(a,e),
                  _*u(a,e),
                  _*v(a,e);

vmic2(a,e,p) = _*w*(1-p) + (p*(_*x(a,e) +
                               _*y(a,e) +
                               _*z(e) +
                               _*r(e) +
                               _*s(a,e) +
                               _*t(a,e) +
                               _*u(a,e) +
                               _*v(a,e)));

//process = os.osc(1000)/sqrt(2) : m2ndo(ma.PI/10,ma.PI/9) : vmic2(az,el,pp);

// third order
k(e) = (1/2)*sin(e)*(5*(sin(e))^2-3);
l(a,e) = sqrt(3/8)*cos(a)*cos(e)*(5*(sin(e))^2-1);
m(a,e) = sqrt(3/8)*sin(a)*cos(e)*(5*(sin(e))^2-1);
n(a,e) = sqrt(15/4)*cos(2*a)*sin(e)*(cos(e))^2;
o(a,e) = sqrt(15/4)*sin(2*a)*sin(e)*(cos(e))^2;
p(a,e) = sqrt(5/8)*cos(3*a)*(cos(e))^3;
q(a,e) = sqrt(5/8)*sin(3*a)*(cos(e))^3;

m2rdo(a,e) = _ <: _*w,
                  _*x(a,e),
                  _*y(a,e),
                  _*z(e),
                  _*r(e),
                  _*s(a,e),
                  _*t(a,e),
                  _*u(a,e),
                  _*v(a,e),
                  _*k(e),
                  _*l(a,e),
                  _*m(a,e),
                  _*n(a,e),
                  _*o(a,e),
                  _*p(a,e),
                  _*q(a,e);

vmic3(a,e,pp) = _*w*(1-pp) + (pp*(_*x(a,e) +
                                  _*y(a,e) +
                                  _*z(e) +
                                  _*r(e) + 
                                  _*s(a,e) +
                                  _*t(a,e) +
                                  _*u(a,e) +
                                  _*v(a,e) +
                                  _*k(e) +
                                  _*l(a,e) +
                                  _*m(a,e) +
                                  _*n(a,e) +
                                  _*o(a,e) +
                                  _*p(a,e) +
                                  _*q(a,e)));

//process = os.osc(1000)/sqrt(2) : m2rdo(ma.PI/10,ma.PI/9) : vmic3(az,el,pp);

//process = os.osc(700)/sqrt(2) : m2rdo(ma.PI/10,ma.PI/9) <: par(i, 4, vmic3(ma.PI-(ma.PI/(i+1)),0,0.5));

//ACN
a0 = w;
a1(a,e) = y(a,e);
a2(e) = z(e);
a3(a,e) = x(a,e);
a04(a,e) = v(a,e);
a05(a,e) = t(a,e);
ao6(e) = r(e);
a07(a,e) = s(a,e);
a08(a,e) = u(a,e);
a09(a,e) = q(a,e);
a10(a,e) = o(a,e);
a11(a,e) = m(a,e);
a12(e) = k(e);
a13(a,e) = l(a,e);
a14(a,e) = n(a,e);
a15(a,e) = p(a,e);

vmic1a(a,e,p) = _*a0*(1-p) + (p*(_*a3(a,e)+_*a1(a,e)+_*a2(e)));
//process = os.osc(1000) : m2bfmt(0,0) : vmic1a(az,el,pp);