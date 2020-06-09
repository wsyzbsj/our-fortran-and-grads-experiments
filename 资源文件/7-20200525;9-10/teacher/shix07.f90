program shixi07

implicit none
integer,parameter :: ns=160,syr=1951,eyr=2010
real              :: p(syr:eyr),t(syr:eyr,ns),st_lat(ns),st_lon(ns)
character*8       :: stid(ns)
real              :: corr(ns),stdp,stdt(ns)


integer           :: i,j,k,nyr=eyr-syr+1
integer           :: nflag,nlev
real              :: tim

open(100,file='C:\fortran_test\sx07\p.dat')
open(101,file='C:\fortran_test\sx07\t1601.txt')
open(102,file='C:\fortran_test\sx07\id160.txt')
open(201,file='C:\fortran_test\sx07\corr.grd',form='unformatted',access='stream')

read(100,*) p
print*,p

do i=syr,eyr
  print*,i
  read(101,'(20f5.0)') t(i,:)
  print'(20f5.0)',t(i,:)
enddo

do i=1,ns
  read(102,*) stid(i),st_lat(i),st_lon(i)
  print*,stid(i),st_lat(i),st_lon(i)
enddo

close(100)
close(101)
close(102)

do i=1,ns
  corr(i)=sum((t(:,i)-sum(t(:,i))/nyr)*(p(:)-sum(p(:))/nyr)) &
          /sqrt(sum((t(:,i)-sum(t(:,i))/nyr)**2))           &
          /sqrt(sum((p(:)-sum(p(:))/nyr)**2)) 
  print*,'corr',i,corr(i)
enddo

print*,"write 160 stations' correlation"
tim=0.0 
nflag=1 
nlev=1 
do i=1,ns 
  write(201) stid(i),st_lat(i),st_lon(i),tim,nlev,nflag,corr(i)
end do 
nlev=0 
write(201)stid(i-1),st_lat(i-1),st_lon(i-1),tim,nlev,nflag   
close(201) 


end program shixi07