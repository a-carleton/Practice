module gaussmod

    contains

    subroutine gaussian_elimination(A,b)
        real (kind=8), dimension(:,:) :: A
        real (kind=8), dimension(:) :: b
        real :: factor
        integer :: i,j
    

        ! gaussian elimination
        
        do j = 1, 2           ! j is column
        do i = j+1, 3       ! i is row
            factor = A(i,j)/A(j,j)
            A(i,:) = A(i,:) - factor*A(j,:)
            b(i) = b(i) - factor*b(j)
        end do
        end do
    end subroutine


    subroutine backsubstitution(A,b)
        real (kind=8), allocatable, dimension(:,:) :: A
        real (kind=8), allocatable, dimension(:) :: b
        real :: factor
        integer :: i,j

        ! doing back substitution
        do j = 3, 2, -1            ! j is column
        do i = j-1, 1, -1        ! i is row
            factor = A(i,j)/A(j,j)
            A(i,:) = A(i,:) - factor*A(j,:)
            b(i) = b(i) - factor*b(j)
        end do
        end do

        ! overwrite the solution vector to b
        do i = 1, 10
        b(i) = b(i)/A(i,i)
        end do
    end subroutine

end module