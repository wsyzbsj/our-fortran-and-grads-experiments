program main
      implicit none
      integer,parameter :: sta=160
      integer :: station,year,nlev,flag
      character(8) :: number(sta)
      double precision :: avers(sta),bzcs(sta),aver,bzc
      real :: hp(60),lat(sta),lon(sta),tim,xgxs(sta),dt(60,sta)
      open(1,file='p.dat')
      open(2,file='t1601.txt',form='formatted')
      open(3,file='id160.txt',form='formatted')
      open(4,file='corr.grd',form='unformatted',access='stream')

      read(1,*) hp(:)
      print *,hp
      aver=sum(hp)/60
            do year=1,60
                  bzc=(hp(year)-aver)**2+bzc
            enddo
      bzc=sqrt(bzc/60)
            do year=1,60
                  read(2,*) dt(year,:)
            enddo
      do station=1,sta
            read(3,*)   number(station),lat(station),lon(station)
      enddo
      call xgxsfunc
      tim=0.0
      nlev=1
      flag=1
      do station=1,160
            write(4)    number(station),lat(station),lon(station),tim,nlev,flag,xgxs(station)
      enddo
      nlev=0
      write(4)    number(station-1),lat(station-1),lon(station-1),tim,nlev,flag

      close(1)
      close(2)
      close(3)
      close(4)
!----------------------------相关系数子程序开始-------------------
      Contains
      subroutine xgxsfunc
            do station=1,sta
                  avers(station)=sum(dt(:,station))/60;
                  bzcs(station)=0
                  do year=1,60
                        bzcs(station)=(dt(year,station)-avers(station))**2/60+bzcs(station)
                  enddo
            enddo
            bzcs=sqrt(bzcs)
            do station=1,sta
                  do year=1,60
                        xgxs(station)=(hp(year)-aver)*(dt(year,station)-avers(station))+xgxs(station)
                  enddo
                  xgxs(station)=xgxs(station)/bzc/bzcs(station)/60
            enddo
      end subroutine xgxsfunc
!------------------------------相关系数子程序结束------------------
end program main
