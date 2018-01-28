	program main


     implicit none

      CHARACTER        JOBVL,JOBVR
      PARAMETER        (JOBVL= 'V')
      PARAMETER        (JOBVR= 'V')

      INTEGER          N
      PARAMETER        ( N = 3 )
      INTEGER          LDA
      PARAMETER        ( LDA = 3 )
      INTEGER          LDVL
      PARAMETER        ( LDVL = 4 )
      INTEGER          LDVR
      PARAMETER        ( LDVR = 4 )
      Integer          LWORK
      INTEGER          INFO

      DOUBLE PRECISION A(LDA,N), WR(N), WI(N),VL(LDVL,N),VR(LDVR,N)
      DOUBLE PRECISION WORK(1,10*N)

      A(1,1) = 0.0
      A(1,2) = 1.0
      A(1,3) = 0.0
      A(2,1) = -0.0
      A(2,2) = 0.0
      A(2,3) = 0.3999999
      A(3,1) = -0.0
      A(3,2) = 283640.00
      A(3,3) = 0.0



      call DGEEV( JOBVL, JOBVR, N, A, LDA, WR, WI, VL, LDVL, VR,
     $                  LDVR, WORK, LWORK, INFO )

      WRITE(*,*)  "*********"

      DO i = 1, N
       DO j = 1, N
          WRITE(*,*)  A( i, j ) 
       END DO
      END DO


      WRITE(*,*)  "****VL*****"
      DO i = 1, N
       DO j = 1, N
          WRITE(*,*)  VL( i, j ) 
       END DO
      END DO

      WRITE(*,*)  "*****VR****"

      DO i = 1, N
       DO j = 1, N
          WRITE(*,*)  VR( i, j ) 
       END DO
      END DO

      WRITE(*,*)  "*****WR(N)****"

       DO i = 1, N
          WRITE(*,*)  WR(N) 
       END DO

      WRITE(*,*)  "*********"

      WRITE(*,*) INFO

      WRITE(*,*)  "*********"
	  stop
	end

