program practice
use dftmod, only: matvecprod
use utility
implicit none
real(dp) dimension(3,3), intent(in) :: A
real(dp) dimension(3) intent(out) :: x, y

A = reshape((/1, 2, 3, 4, 5, 6, 7, 8, 9/), (/3,3/))
call function matvecprod(A,x) result(y)


end program