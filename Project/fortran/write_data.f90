module write_data

    contains

    subroutine writeFile(x, n)
        implicit none
        integer :: n
        real (kind=8), dimension(n), intent(IN) :: x
        real (kind=8), dimension(:,:), allocatable :: A
        real (kind=8), dimension(:), allocatable :: b

        print *, A

        open(unit = 12, file="x.dat",FORM='FORMATTED',ACTION='WRITE')
        write(12,*), x

    end subroutine

end module write_data