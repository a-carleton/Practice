module pimod

    implicit none
    real (kind=8) :: pi_true = acos(-1.d0)

contains

    ! pi approximation
    subroutine pisolver(thresh, N_max)
        implicit none
        real (kind=8) :: diff
        real (kind=8) :: thresh
        integer, intent(in) :: N_Max
        real (kind=8) :: pi_appx
        real (kind=8) :: pisum
        real (kind=8) :: n

        
        pi_appx = 0.d0
        do n=0,N_Max
            pisum = ((1/(16**n))*((4/((8*n)+1)) - (2/((8*n)+4)) - (1/((8*n)+5)) - (1/((8*n)+6))))
            pi_appx = pi_appx + pisum
            diff = abs(pi_appx - pi_true)
                if (diff < thresh) then
                    exit
                end if
            print *, "pi_appx = ", pi_appx
            print *, "n = ", n
        end do

        print *, ""
    
        
    end subroutine

end module pimod
