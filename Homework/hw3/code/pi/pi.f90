program pi
    
    use pimod
    implicit none

    ! Max terms to sum together
    integer, parameter :: N_Max = 50


!Threshold values: 1.0d-4, 1.0d-8, 1.0d-12, and 1.0d-16
print *, "running pisolver with thresh = 1.0d-4"
call pisolver(1.0d-4, N_Max)

print *, "running pisolver with thresh = 1.0d-8"
call pisolver(1.0d-8, N_Max)

print *, "running pisolver with thresh = 1.0d-12"
call pisolver(1.0d-12, N_Max)

print *, "running pisolver with thresh = 1.0d-16"
call pisolver(1.0d-16, N_Max)


end program
