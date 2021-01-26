#define PRINTINFO


program gauss

  use gaussmod

  implicit none
  real (kind=8), dimension(:,:), allocatable :: A
  real (kind=8), dimension(:), allocatable :: b
  integer :: i


  ! initialize matrix A and vector b
  A(:,:) = reshape((/2, 3, -1, 4, 7, 1, 7, 10, -4/), (/3,3/))
  b(:) = (/1, 3, 4/)

#ifdef PRINTINFO
  ! print augmented matrix
  do i = 1, 9           ! i is row
     print *, A(i,:), "|", b(i)
  end do
#endif

#ifdef PRINTINFO  
  print *, ""    ! print a blank line
  print *, "Gaussian elimination........"
#endif

  call gaussian_elimination(A,b)

#ifdef PRINTINFO  
  ! print echelon form
  print *, "***********************"
  do i = 1, 10
     print *, A(i,:), "|", b(i)
  end do

  print *, ""    ! print a blank line
  print *, "back subs......"
#endif

  call backsubstitution(A,b)

#ifdef PRINTINFO  
  ! print the results
  print *, "***********************"
  do i = 1, 10
     print *, A(i,:), "|", b(i)
  end do

  print *, ""
  print *, "The solution vector is;"
  do i = 1, 10
     print *, b(i)
  end do
#endif


end program gauss

