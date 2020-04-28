program shixi03
implicit none

integer,parameter :: ny=60,ns=160
integer           :: syr=1951
real              :: h(ny)
real              :: st(ny,ns)
real              :: cor(ns),cor_ans(ns)
integer           :: i,j
integer           :: imax
real              :: cor_max

open(1,file='C:\fortran_test\shixi03\h-p.dat',form='unformatted',access='stream')
open(2,file='C:\fortran_test\shixi03\t1601.dat',form='unformatted',access='stream')
open(3,file='C:\fortran_test\shixi03\cor_ans.grd',form='unformatted',access='stream')
open(4,file='C:\fortran_test\shixi03\temp_h.dat',form='formatted')

read(1) h
close(1)

do i=1,ny
  read(2) st(i,:)
enddo
st=st/10.0
close(1)

read(3) cor_ans
close(3)

imax=0
cor_max=-99999.0
do i=1,ns
  call cal_cor(h,st(:,i),ny,cor(i))
  if(abs(cor(i))>cor_max) then
    cor_max=abs(cor(i))
    imax=i
  endif
enddo
call cal_rmse(cor,cor_ans,ns)

print*,"maximum absolute cor:",cor(imax),'station',imax
do i=1,ny
  print*,"year:",syr+i-1,h(i),st(i,imax)
  write(4,*) "year:",syr+i-1,h(i),st(i,imax)
enddo
close(4)

end program shixi03


subroutine cal_cor(x,y,n,cor)
implicit none
integer :: n
real :: x(n),y(n)
real :: cor
integer :: i,j
real :: stdx,stdy,avex,avey,cov

avex=sum(x)/n
avey=sum(y)/n
stdx=(sum((x-avex)**2)/n)**0.5
stdy=(sum((y-avey)**2)/n)**0.5
cov=sum((x-avex)*(y-avey))/n
cor=cov/(stdx*stdy)

end subroutine cal_cor 


subroutine cal_rmse(x,y,n)
implicit none
integer :: n
real :: x(n),y(n)
integer :: i,j
real :: rmse,avex,avey

avex=sum(x)/n
avey=sum(y)/n
rmse=(sum((x-y)**2)/(n-1))**0.5

print*,"RMSE:",rmse

end subroutine cal_rmse