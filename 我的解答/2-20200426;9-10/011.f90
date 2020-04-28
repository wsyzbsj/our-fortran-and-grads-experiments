program main
      implicit none
      integer :: i,j
	double precision :: zl(3),pj(3),bzc(3),zjz1,zjz2,r
      integer :: yf(5)
	double precision :: sj(3,5)
      open(1,file='data.txt',form='formatted')
      read(1,*) yf(:)
      do i=1,3
            read(1,*) sj(i,:)
      enddo
      close(1)

function pingjun
implicit none
      integer :: i,j
	double precision :: zl(3),pj(3),bzc(3),zjz1,zjz2,r
      integer :: yf(5)
	double precision :: sj(3,5)
      do i=1,3
      zl(i)=sum(sj(i,:))
      pj(i)=zl(i)/5
      print *,"第",i,"个站点的平均为",pj(i)
      enddo
end function pingjun

function biaozhuncha
implicit none
      integer :: i,j
	double precision :: zl(3),pj(3),bzc(3),zjz1,zjz2,r
      integer :: yf(5)
	double precision :: sj(3,5)
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
end function biaozhuncha

function xiangguanxishu
implicit none
	      integer :: i,j
	double precision :: zl(3),pj(3),bzc(3),zjz1,zjz2,r
      integer :: yf(5)
	double precision :: sj(3,5)
      zjz2=0
      do j=1,5
      zjz2=(sj(1,j)-pj(1))*(sj(2,j)-pj(2))+zjz2
      enddo
      r=0.2*zjz2/bzc(1)/bzc(2)
      print *,"1与2的相关系数为",r
      
      zjz2=0
      do j=1,5
            zjz2=(sj(2,j)-pj(2))*(sj(3,j)-pj(3))+zjz2
      enddo
      r=0.2*zjz2/bzc(2)/bzc(3)
      print *,"2与3的相关系数为",r
      
      zjz2=0      
      do j=1,5
            zjz2=(sj(1,j)-pj(1))*(sj(3,j)-pj(3))+zjz2
      enddo
      r=0.2*zjz2/bzc(1)/bzc(3)
      print *,"1与3的相关系数为",r
end function xiangguanxishu
end program main
