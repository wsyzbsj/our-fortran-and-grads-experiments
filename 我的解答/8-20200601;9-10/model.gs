'reinit'
'open model.ctl'
'set lev 850'
'set lon -80 -20'
'set lat 15 60'
h=1
while(h<=2)
o=m
p=n
j=0
'set t 'h''
'd hgt'
i=1
'd minloc(min(hgt,lat=35,lat=55),lon=-55,lon=-30)'
while(j=0)
    mid1=sublin(result,i)
    mid2=subwrd(mid1,1)
    if(mid2='Result')
        x=subwrd(mid1,4)
        j=1
    endif
    i=i+1
endwhile
i=1
j=0
'd minloc(min(hgt,lon=-55,lon=-30),lat=35,lat=55)'
while(j=0)
    mid3=sublin(result,i)
    mid4=subwrd(mid3,1)
    if(mid4='Result')
        y=subwrd(mid3,4)
        j=1
    endif
i=i+1
endwhile
'q gr2xy 'x' 'y''
m=subwrd(result,3)
n=subwrd(result,6)
if(h=1)
    'c'
endif
h=h+1
endwhile
'set font 1'
'set strsiz 0.2'
'draw string 'm' 'n' D'
'draw string 'o' 'p' D'
'draw line 'm' 'n' 'o' 'p''
'printim result.png'
;
