module gaussmod

    contains

    subroutine gauss_elim(A,b)
        implicit none
        integer :: n
        real (kind=8), allocatable, dimension(:,:), intent(INOUT) :: A
        real (kind=8), allocatable, dimension(:), intent (INOUT) :: b
        real (kind=8), allocatable, dimension(:) :: s
        real (kind=8), allocatable, dimension(:) :: x
        integer :: i, j, k, l, f

        !forward elimination
        do k=1, n-1
            do i = k, n
                s(i) = 0.0
                do j = k, n
                    s(i) = max(s(i),abs(A(i,j)))
                end do
            end do

        !elimination
            do i = k+1, n 
                f = a(i,k)/a(k,k)
                a(i,k) = 0.0
                b(i) = b(i) - f*b(k)
                do j = k+1, n
                    a(i,j) = a(i,j) - f*a(k,j)
                end do
            end do
        end do

    
    !back substitution
    x(n) = b(n)/A(n,n)
    do i = n-1, 1, -1
        f = 0.0
        do j = i+1, n
            f = f + A(i,j)*x(j)
        end do
        x(i) = (b(i) - f)/A(i,i)
    end do

    end subroutine gauss_elim


    subroutine gauss_elim_partial(A,b,x,n)
        implicit none
        integer :: n
        real (kind=8), allocatable, dimension(:,:), intent(INOUT) :: A
        real (kind=8), allocatable, dimension(:), intent (INOUT) :: b
        real (kind=8), allocatable :: pivot, f, keep
        real (kind=8), dimension(n) :: s
        real (kind=8), allocatable, intent(INOUT), dimension(:) :: x
        integer :: i, j, k, l

        allocate(x(n))

        !forward elimination
        do k=1, n-1
            do i = k, n
                s(i) = 0.0
                do j = k, n
                    s(i) = max(s(i),abs(A(i,j)))
                end do
            end do
        

        !find largest pivot for a given row
            pivot = abs(A(k,k)/s(k))
            l = k
            do j = k+1, n
                if (abs(A(j,k)/s(j)) > pivot) then
                    pivot = abs(A(j,k)/s(j))
                    l = j
                end if
            end do

        !swap rows 
        if (1 /= k) then
            do j = k,n
                keep = A(k,j)
                A(k,j) = A(l,j)
                A(l,j) = keep
            end do
            keep = b(k)
            b(k) = b(l)
            b(l) = keep
        end if

        !elimination
            do i = k+1, n 
                f = a(i,k)/a(k,k)
                a(i,k) = 0.0
                b(i) = b(i) - f*b(k)
                do j = k+1, n
                    a(i,j) = a(i,j) - f*a(k,j)
                end do
            end do
        end do

    
        !back substitution
        x(n) = b(n)/A(n,n)
        do i = n-1, 1, -1
            f = 0.0
            do j = i+1, n
                f = f + A(i,j)*x(j)
            end do
            x(i) = (b(i) - f)/A(i,i)
        end do

    end subroutine gauss_elim_partial

    subroutine show_array(A, b, n)
        implicit none
        real (kind=8), allocatable, dimension(:,:) :: A
        real (kind=8), allocatable, dimension(:) :: b
        integer :: n, j
        
        print *, "reduced matrix A"
        do j=1,n
            print *, A(j,:)
        end do

        print *, ""
        print *, "reduced array b"
        print *, b
    
    
    end subroutine show_array



end module gaussmod
