* draw south China sea at the right 
* corner of of a picture had displayed
* on screen ,by Gwl in 2000.10
* use after all display had completed
*
'q dim'
rec22=sublin(result,2)
rec33=sublin(result,3)
lon1=subwrd(rec22,6);lon2=subwrd(rec22,8)
lat1=subwrd(rec33,6);lat2=subwrd(rec33,8)

'q gxinfo'
rec1=sublin(result,1)
screen=subwrd(rec1,4)
if(screen='Clear')
say 'Can''t draw south China sea'
return
endif

rec3=sublin(result,3)
rec4=sublin(result,4)
xright=subwrd(rec3,6)
ybottom=subwrd(rec4,4)
xleft=xright-1.2
ytop=ybottom+2

yytop=ytop+0.035
xxleft=xleft-0.035
x2=xleft+0.05
y2=ytop-0.05
x3=xxleft+0.07
y3=yytop-0.07
'set line 1 1 1'
*'set vpage 0 11 0 8.5'
'draw line 'x2' 'ytop' 'xright' 'ytop''
'draw line 'x3' 'yytop' 'xright' 'yytop''
'draw line 'xleft' 'ybottom' 'xleft' 'y2''
'draw line 'xxleft' 'ybottom' 'xxleft' 'y3''
'draw line 'xleft' 'y2' 'x2' 'ytop''
'draw line 'xxleft' 'y3' 'x3' 'yytop''

zx11=xright-0.8938;zx12=zx11+0.06;
zy11=ybottom+1.29;zy12=zy11-0.08;
'set line 1 1 6'
'draw line 'zx11' 'zy11' 'zx12' 'zy12''
zx21=zx11+0.07;zx22=zx21-0.03;
zy21=zy11-0.31;zy22=zy21-0.1;
'draw line 'zx21' 'zy21' 'zx22' 'zy22''
zx31=zx21-0.19;zx32=zx31+0.02;
zy31=zy21-0.41;zy32=zy31-0.11;
'draw line 'zx31' 'zy31' 'zx32' 'zy32''
zx41=zx31+0.35;zx42=zx41-0.08;
zy41=zy31-0.24;zy42=zy41-0.05;
'draw line 'zx41' 'zy41' 'zx42' 'zy42''
zx51=zx41+0.23;zx52=zx51-0.05;
zy51=zy41+0.30;zy52=zy51-0.09;
'draw line 'zx51' 'zy51' 'zx52' 'zy52''
zx61=zx51+0.21;zx62=zx61-0.04;
zy61=zy51+0.42;zy62=zy61-0.10;
'draw line 'zx61' 'zy61' 'zx62' 'zy62''
zx71=zx61+0.01;zx72=zx71;
zy71=zy61+0.28;zy72=zy71-0.10;
'draw line 'zx71' 'zy71' 'zx72' 'zy72''
zx81=zx71+0.08;zx82=zx81-0.07;
zy81=zy71+0.22;zy82=zy81-0.08;
'draw line 'zx81' 'zy81' 'zx82' 'zy82''
zx91=zx81+0.12;zx92=zx91-0.08;
zy91=zy81+0.12;zy92=zy91-0.05;
'draw line 'zx91' 'zy91' 'zx92' 'zy92''

'set lon 105 122'
'set lat 0.0 25'
'set parea 'xleft' 'xright' 'ybottom' 'ytop''
'set mpdset mres'
'draw map'
'set mpdset mres'
'set parea off'
'set vpage off'
'set lon 'lon1' 'lon2''
'set lat 'lat1' 'lat2''
'set cthick 1'
return
