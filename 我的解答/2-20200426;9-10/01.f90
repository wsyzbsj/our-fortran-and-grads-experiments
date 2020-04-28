program main
      implicit none
      integer :: i,j,k,l
	double precision :: zl(3),pj(3),bzc(3),zjz1,zjz2,r
      integer :: yf(5)
	double precision :: sj(3,5)
      open(1,file='data.txt',form='formatted')
      read(1,*) yf(:)
      do i=1,3
            read(1,*) sj(i,:)
      enddo
      close(1)

      do i=1,3
      zl(i)=sum(sj(i,:))
      pj(i)=zl(i)/5
      print *,"第",i,"个站点的平均为",pj(i)
      enddo

      do i=1,3
            zjz1=0
            do j=1,5
                  zjz1=0.2*(sj(i,j)-pj(i))**2+zjz1
            enddo
      bzc(i)=sqrt(zjz1)
      enddo
      do i=1,3
      print *,"第",i,"个站点的标准差为",bzc(i)
      enddo

      do k=1,2
            do l=(k+1),3
      do j=1,5
      zjz2=(sj(k,j)-pj(k))*(sj(l,j)-pj(l))+zjz2
      enddo
      r=0.2*zjz2/bzc(k)/bzc(l)
      enddo
      enddo
      print *,k,"与",l,"的相关系数为",r
end program main
