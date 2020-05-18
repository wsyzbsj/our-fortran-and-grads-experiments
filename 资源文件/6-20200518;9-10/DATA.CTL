dset ^DATA.GRD
undef -9.99E+33
title NCEP/NCAR REANALYSIS PROJECT
xdef   37 linear   60.000  2.500
ydef   17 linear   0.000  2.500
zdef    2 levels   850  200
tdef 48 linear   JAN1982      1mo
vars   4
U  2 99 u wind (m/s)
V  2 99 v wind (m/s)
H  1 99 H500
TSFC 0 99 TSFC DATA
endvars
;
