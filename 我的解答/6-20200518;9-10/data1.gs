'open DATA.CTL'
;设置经纬度范围最简单的办法
;set x=1
;set y=1
'set lev 200'
'set lon 60'
'set lat 20'
'set t 1 48'
'd tloop(aave(u,lon=60,lon=80,lat=20,lat=30))'
'printim 1.png'
'disable fwrite'
