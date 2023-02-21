# Explicit Ambix formulas for High Order Ambisonics
## Angelo Farina

### A Faust and Csound implementation of Angelo Farina HOA equations up to 7th order ACN SN3D

The goal of this page is to provide an univoque, explicit set of formulas describing the amplitude of the Ambisonics polar patterns as function of the azimuth and elevation angles, and also as a function of the three cartesian coordinates of the unit vector pointing towards the sound source.

Unfortunately in the years many different Ambisonics formulations have been employed, differing in naming, channel order, and gain normalization.

Furthermore, the Cartesian and Spherical coordinate systems have also been messed up, again with wrong naming, polarity inversion, and so on.

So this page also serves for providing the correct information about all these possible causes of errors.

The Cartesian reference must be conforming to ISO standards (for example, ISO2631), as in the following picture:

![isref](http://pcfarina.eng.unipr.it/Aurora/ISOREF+angles.png)

The spherical coordinate system is coherent with this Cartesian reference system: the azimuth angle (a) lies in the XY plane, starting form the X axis and running towards the Y axis, so an azimut of 0 degrees means "Front", 90 degrees means "Left", 180 degrees means "Back" and -90 degrees (which also equates to 270 degrees) means "Right". Elevation angle (e) is measured from the horizontal plane, with positive elevations going up to the sky, so e = 90 degrees means Zenith (or North pole) and e=-90 degrees means Nadir (or South pole).

The usage of other symbols for azimuth and elevation must be discouraged. Many people use θ (theta) and j (phi) for naming azimuth and elevation, but these are often swapped (there is no univoque correspondance establishing if theta is azimuth or elevation), and in some cases the value of elevation is not starting from the horizontal plane, but instead from the North pole and going down, as shown, for example, on the Wikipedia page https://en.wikipedia.org/wiki/Spherical_coordinate_system, where the two possible naming conventions are shown, but elevation is always wrong.

Also the sign of azimuth is sometimes reversed: for example, in FB360 Spatial Workstation the elevation angle is correct, but the azimut is reversed, with positive values going right instead of going left, as it should be. The same problem occurs in Audio Ease and Ambix plugin suites.

Luckily enough, most other software used for creating and manipulating High Order Ambisonics signals are usually perfectly coherent with the ISO 2631 standard adopted here, for example  O3A, Noise Makers, Wigware, Ambdec, York University, Ambisonic Studio, Gerzonic, etc.

I hope that the information above serves for avoiding errors... And perhaps the authors of software employing wrong conventions cited above will decide to fix their crappy angular systems...

And now let's define the spherical harmonics functions, which provide the direction-dependent gain of each of the Ambisonics signals.

These functions are defined in a series, with 2 more functions for each order, providing an increasing spatial resolution. The following figure shows these direction-dependent gain functions up to 7th order:

![7hoa](http://pcfarina.eng.unipr.it/Aurora/Ambisonics-Formulas/Spherical_Harmoncs_7_sm.png)

The meaning of the colors is the following:

RED means positive

BLUE means negative

And finally here we present the explicit formulas giving these gain functions, either in polar and Cartesian coordinates, worked out from the formulas given here, and corresponding to current standard Ambix format (that is, channel ordering is ACN and gain normalization is SN3D - any other convention is nowadays obsolete and should be completely avoided):

:) working on it

The original N3D formulas are here:

[Original Formulas for High order Ambisonics (ACN N3D format up to 7th order)](http://pcfarina.eng.unipr.it/Aurora/HOA_ACN_N3D_formulas.htm)

If you find errors in these formulas, please point them out to the author of this page...

