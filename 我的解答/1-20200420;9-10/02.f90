program main
	implicit none
	integer :: qxzgs,yfzs,i,j
	real :: jszl,pj
	integer,allocatable :: yf(:)
	real,allocatable :: sj(:)
	open(1,file='data_shixi01_adv.txt',form='formatted')
	read(1,*) qxzgs,yfzs
	allocate(yf(yfzs))
	allocate(sj(yfzs))
	read(1,*) yf(:)
	do i=1,qxzgs
		read(1,*) sj(:)
		jszl=sum(sj)
		pj=jszl/yfzs
		print *,"第",i,"个站点的总雨量为",jszl,"平均雨量为",pj
		do j=1,yfzs
			if(sj(j)>pj)	print*,yf(j),"月雨量超过平均雨量,为",sj(j)
		enddo
	enddo
	close(1)
	deallocate(yf,sj)
end program main
