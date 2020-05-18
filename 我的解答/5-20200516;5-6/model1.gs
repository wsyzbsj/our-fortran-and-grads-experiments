'open model.ctl'
'set z 4'
'set lon -90 30'
'set lat 0 90'
m=1
while(m<=5)
'set t 'm''
'set cmax 260'
'set cmin 250'
'set gxout shaded'
'd tair'
'cbarn'
'set gxout contour'
'd hgt'
'set gxout vector'
'set ccolor 4'
'd u;v'
'draw title Time='m''
'printim horizontal'%m%'.png'
'disable fwrite'
m=m+1
'c'
endwhile
;
