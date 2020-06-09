'reinit'
'open C:\fortran_test\model.ctl'
'set lon -80 -20'
'set lat 15 60'
'set lev 850'
'set cint 50'
'set ccolor 4'
'set grid off'
'set grads off'
'd hgt(t=1)'
'd minloc(min(hgt(t=1),lat=35,lat=55),lon=-55,lon=-30)'
j=0
i=1
while(j=0)
  str1=sublin(result,i)
  str2=subwrd(str1,1)
  if(str2='Result')
    xpos=subwrd(str1,4)
    say 'xpos:'xpos
    j=1
  endif
  i=i+1
endwhile
'd minloc(min(hgt(t=1),lon=-55,lon=-30),lat=35,lat=55)'
j=0
i=1
while(j=0)
  str1=sublin(result,i)
  str2=subwrd(str1,1)
  if(str2='Result')
    ypos=subwrd(str1,4)
    say 'ypos:'ypos
    j=1
  endif
  i=i+1
endwhile
'q gr2xy 'xpos' 'ypos''
x1=subwrd(result,3)
y1=subwrd(result,6)
'set font 1'
'set strsiz 0.2'
'draw string 'x1' 'y1' D'


'c'
'set cint 50'
'set ccolor 4'
'set map 15'
'd hgt(t=2)'
'd minloc(min(hgt(t=2),lat=35,lat=55),lon=-55,lon=-30)'
j=0
i=1
while(j=0)
  str1=sublin(result,i)
  str2=subwrd(str1,1)
  if(str2='Result')
    xpos=subwrd(str1,4)
    say 'xpos:'xpos
    j=1
  endif
  i=i+1
endwhile
'd minloc(min(hgt(t=2),lon=-55,lon=-30),lat=35,lat=55)'
j=0
i=1
while(j=0)
  str1=sublin(result,i)
  str2=subwrd(str1,1)
  if(str2='Result')
    ypos=subwrd(str1,4)
    say 'ypos:'ypos
    j=1
  endif
  i=i+1
endwhile
'q gr2xy 'xpos' 'ypos''
x2=subwrd(result,3)
y2=subwrd(result,6)
'set font 1'
'set strsiz 0.2'
'set string 1 c'
'draw string 'x2' 'y2' D'
'set string 1 c'
'draw string 'x1' 'y1' D'
'draw line 'x1' 'y1' 'x2' 'y2''

'set strsiz 0.4'
'draw string 6 4.25 This is a sample'

'enable print C:\fortran_test\shixi_draw.gmf'
'print'
'disable'

