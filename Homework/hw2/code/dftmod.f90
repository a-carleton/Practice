module dftmod

  use utility, only : dp, pi
  implicit none
  
contains

  !!! ==== Add your matvecprod function here ==== !!!
  function matvecprod(A,x) result(y)
    implicit none
    real(dp) :: A(:,:), x(:)
    real(dp), dimension(size(A,1)) :: y
    integer :: N
    integer :: i,j

    N = size(y)
    
  ! matProd A*x
    do i=1,N 
      y(i) = 0
      do j=1,N 
        y(i) = y(i) + A(i,j)*x(j)
      end do
    end do

  end function
  


  
  ! subroutine: dft_TransMat
  ! purpose: Fill transformation matrix for a discrete Fourier transform
  !          on a given domain
  subroutine dft_TransMat(x,k,T)
    implicit none
    real (dp), intent(in)     :: x(:)
    real (dp), intent(out)    :: k(:)
    real (dp), intent(in out) :: T(:,:)

    ! Local variables
    integer :: M, N, i
    real (dp) :: om, dx

    ! Set sizes and base wavenumber
    M=size(T,1)
    N=size(T,2)
    dx = x(2)-x(1)
    om = 2*pi/(N*dx)

    ! Set wavenumbers
    k(1) = 0.0_dp
    do i=2,M,2
      k(i) = i*om/2
      if (i+1<=M) then
        k(i+1) = k(i)
      end if
    end do

    !!! ==== Add your code to fill T here ==== !!!
    T(1,:) = 1/N
    do i=2,N
      if (mod(i,2)==0) then
        T(i,:) = 2*cos(k(i)*x)/N
      else 
        T(i,:) = 2*sin(k(i)*x)/N
      end if
    end do
    
  end subroutine dft_TransMat

  
  !!! ==== Add your dft_InvTransMat subroutine here ==== !!!
  subroutine dft_InvTransMat(x,k,Tinv)
    implicit none
    real (dp), intent(in)     :: x(:)
    real (dp), intent(out)    :: k(:)
    real (dp), intent(in out) :: Tinv(:,:)
  
  ! Local variables
    integer :: M, N, i
    real (dp) :: om, dx

  ! Populate Tinv
    Tinv(:,1) = 1
    do i=2,M
      if (mod(i,2)==0) then
        Tinv(:,i) = cos(k(i)*x)
      else 
        Tinv(:,i) = sin(k(i)*x)
      end if
    end do

  end subroutine dft_InvTransMat

      


end module dftmod
