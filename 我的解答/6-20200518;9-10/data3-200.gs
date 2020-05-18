'open DATA.CTL'
'set lev 200'
'set lon 60 150'
'set lat 0 40'
m=1
n=1
o=1
p=1
while(m<=4)
o=12*m-6
p=12*m-3
'd ave(u,t='o',t='p');ave(v,t='o',t='p')'
n=m+1981
'draw title YEAR'%n''
'gxprint '%n%'-200.svg'
'c'
m=m+1
endwhile
;
