program main
	implicit none
	integer :: i,j
	real :: zl,pj
	integer,allocatable :: yf(:)
	real,allocatable :: sj(:)
	open(1,file='data.txt',form='formatted')
	allocate(yf(5))
	allocate(sj(5))
	read(1) yf(:)
	do i=1,3
		read(1,*) sj(:)
		zl=sum(sj)
		pj=zl/5
		print *,"第",i,"个站点的总雨量为",zl,"平均雨量为",pj
		do j=1,5
			if(sj(j)>pj)	print*,yf(j),"月雨量超过平均雨量,为",sj(j)
		enddo
	enddo
	close(1)
	deallocate(yf,sj)
end program main
