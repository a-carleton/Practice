module read_data

    contains

    subroutine readFile(A, b, i, n)
        implicit none
        real (kind=8), dimension(:,:), intent(out), allocatable :: A
        real (kind=8), dimension(:), intent(out), allocatable :: b
        integer :: j, l, i, n

        open(unit = 10, file="A.dat", status='old',FORM='FORMATTED',ACTION='READ')
        read(10,*), i, j
        allocate(A(i,j))
        do l=1,i
            read(10, *), A(l,:)
        end do
        close(10)

        open(unit = 11, file="b.dat", status='old',FORM='FORMATTED',ACTION='READ')
        read(11,*), n
        allocate(b(n))
        read(11,*), b
        close(11)

    end subroutine

end module read_data


