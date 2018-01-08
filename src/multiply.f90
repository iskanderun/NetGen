       subroutine multiply(ax,bx,iseed)
       implicit none

       integer ax,bx,cx
       INTEGER :: iseed(12)
       OPEN(UNIT=50,FILE='./input/seed.in',STATUS='OLD')
         READ(50,*) iseed
       CLOSE(50)

       end
