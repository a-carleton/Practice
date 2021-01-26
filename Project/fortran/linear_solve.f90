program gauss 
    use gaussmod
    use read_data 
    use write_data
    
    implicit none
        real (kind=8), dimension(:,:), allocatable :: A
        real (kind=8), dimension(:), allocatable :: b
        real (kind=8), dimension(:), allocatable :: x
        integer :: i, j, n, l

        call readFile(A, b, i, n)
        

        call gauss_elim_partial(A,b,x,n)

        print *, "values of x"
        print *, x
        print *, ""
        
        call show_array(A, b, n)


        call writeFile(x, n)



end program gauss
