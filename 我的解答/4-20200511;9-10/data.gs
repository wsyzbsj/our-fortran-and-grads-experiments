'open data.ctl'
'set lon 60 150'
'set lat 0 40'
'set gxout vector'
t=1
while(t<=48)
'draw title wind-field-'t'*month'
'set t 't''
'd u;v'
'printim vector'%t%'.png'
t=t+1
'c'
endwhile
;
'disable fwrite'
