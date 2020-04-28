program main
      implicit none
      double precision :: avers(160),bzcs(160),aver,bzc=0,xgxs(160),max,xgxsmax,rmse=0
      real :: hp(60),dt(60,160),answer(160)
      integer :: year,station,num
      open(1,file='h-p.dat',form='unformatted',access='stream')
      read(1) hp(:)
      close(1)
      aver=sum(hp)/60
      do year=1,60
            bzc=(hp(year)-aver)**2+bzc
      enddo
      bzc=sqrt(bzc/60)
      !-----160站统计-----
      open(2,file='t1601.dat',form='unformatted',access='stream')
      do year=1,60
            read(2) dt(year,:)
      enddo
      dt=dt/10
      call xgxsfunc
      open(3,file='cor_ans.grd',form='unformatted',access='stream')
      read(3) answer(:)
      close(3)
      do year=1,60
            rmse=rmse+(xgxs(year)-answer(year))**2
      enddo
      rmse=sqrt(rmse/(159))
      print *,"RMSE:",rmse

            do station=1,160
            if(abs(xgxs(station))==maxval(abs(xgxs)))     then
                  num=station
                  xgxsmax=xgxs(station)
            endif
      enddo
      print *,"站点数为:",num,"相关系数为:",xgxs(num)
      open(4,file='answer.txt',form='formatted')
      do year=1,60
            write(4,*),1950+year,"年蒙古高压指数:",hp(year),"站点温度:",dt(year,num)
            print *,1950+year,"年蒙古高压指数:",hp(year),"站点温度:",dt(year,num)
      enddo
      close(4)

      Contains
      subroutine xgxsfunc
      do station=1,160
            avers(station)=sum(dt(:,station))/60;
            bzcs(station)=0
            do year=1,60
                  bzcs(station)=(dt(year,station)-avers(station))**2/60+bzcs(station)
            enddo
      enddo
      bzcs=sqrt(bzcs)
      do station=1,160
            do year=1,60
                  xgxs(station)=(hp(year)-aver)*(dt(year,station)-avers(station))+xgxs(station)
            enddo
            xgxs(station)=xgxs(station)/bzc/bzcs(station)/60
      enddo
      end subroutine xgxsfunc

end program main