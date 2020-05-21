'open DATA.CTL'
'set lev 850'
'set lon 60 150'
'set lat 0 40'
m=1
while(m<=4)
o=12*m-6
p=12*m-3
'd ave(u,t='o',t='p');ave(v,t='o',t='p')'
n=m+1981
'draw title YEAR'%n''
'gxprint '%n%'-850.svg'
'c'
m=m+1
endwhile
;
