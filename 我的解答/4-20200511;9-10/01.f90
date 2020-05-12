program main
      implicit none
      real :: u(48,17,37),v(48,17,37)
      integer :: i,j,k
      open(1,file='U850.DAT',form='formatted')
      do i=1,48
            read(1,*)
                  do j=1,17
                        read(1,"(37F6.2)")   u(i,j,:)
                  enddo
      enddo
      close(1)
      open(2,file='V850.DAT',form='formatted')
      do i=1,48
            read(2,*)
                  do j=1,17
                        read(2,"(37F6.2)")   v(i,j,:)
                  enddo
      enddo
      close(2)
      open(3,file='data.dat',form='unformatted',access='stream')
      do i=1,48
            write(3)    ((v(i,j,k),k=1,37),j=1,17)
            write(3)    ((u(i,j,k),k=1,37),j=1,17)
      enddo
      close(3)
end program main
