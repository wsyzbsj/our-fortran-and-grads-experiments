'open model.ctl'
'set lon -60'
'set lat 0 90'
'set z 1 7'
'set zlog on'
m=1
while(m<=5)
'set t 'm''
'set cmax 10'
'set cmin -20'
'set gxout shaded'
'd tair-273.15'
'cbarn'
'set gxout contour'
'set ccolor 1'
'd v'
'draw title Time='m''
'printim vertical'%m%'.png'
'disable fwrite'
m=m+1
'c'
endwhile
;
