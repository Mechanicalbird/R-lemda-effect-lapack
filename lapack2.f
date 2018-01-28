	program main


     implicit none

      CHARACTER        JOBVL,JOBVR,BALANC,SENSE
      PARAMETER        (JOBVL = 'V')
      PARAMETER        (JOBVR = 'V')
      PARAMETER        (BALANC= 'B')
      PARAMETER        (SENSE = 'B')

      INTEGER          N,INFO,ILO,IHI,LWORK,mimi
      PARAMETER        ( N = 3 )
      INTEGER          LDA
      PARAMETER        ( LDA = 3 )
      INTEGER          LDVL
      PARAMETER        ( LDVL = 3 )
      INTEGER          LDVR
      PARAMETER        ( LDVR = 3 )
      PARAMETER        ( LWORK = N*(N+6) )
      PARAMETER        ( mimi  = 2*N-2 )

      INTEGER          IWORK(mimi)

      DOUBLE PRECISION A(LDA,N), WR(N), WI(N),VL(LDVL,N),VR(LDVR,N)
      DOUBLE PRECISION WORK(1,LWORK),SCALE(N),ABNRM,RCONDE(N)
      DOUBLE PRECISION RCONDV(N)

      A(1,1) = 0.0
      A(1,2) = 1.0
      A(1,3) = 0.0
      A(2,1) = -0.0
      A(2,2) = 0.0
      A(2,3) = 0.3999999
      A(3,1) = -0.0
      A(3,2) = 283640.00
      A(3,3) = 0.0




      call DGEEVX( BALANC, JOBVL, JOBVR, SENSE, N, A, LDA, WR, WI,
     $                   VL, LDVL, VR, LDVR, ILO, IHI, SCALE, ABNRM,
     $                   RCONDE, RCONDV, WORK, LWORK, IWORK, INFO )

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

