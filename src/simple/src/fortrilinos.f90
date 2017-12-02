! This file was automatically generated by SWIG (http://www.swig.org).
! Version 4.0.0
!
! Do not make changes to this file unless you know what you are doing--modify
! the SWIG interface file instead.

! Copyright 2017, UT-Battelle, LLC
!
! SPDX-License-Identifier: BSD-3-Clause
! License-Filename: LICENSE
module fortrilinos
 use, intrinsic :: ISO_C_BINDING
 use forteuchos
 use fortpetra

 use, intrinsic :: iso_c_binding, only : &
   c_bool, &
   c_int, &
   c_long, &
   c_long_long, &
   c_size_t, &
   c_double, &
   scalar_type => c_double, &
   local_ordinal_type => c_int, &
   global_ordinal_type => c_long_long, &
   global_size_type => c_long, &
   size_type => c_size_t, &
   bool_type => c_bool, &
   int_type => c_int, &
   mag_type => c_double, &
   norm_type => c_double

 implicit none
 private

 ! PUBLIC METHODS AND TYPES

public :: scalar_type
public :: local_ordinal_type
public :: global_ordinal_type
public :: global_size_type
public :: size_type
public :: bool_type
public :: int_type
public :: mag_type
public :: norm_type

 public :: TrilinosSolver
 public :: TrilinosEigenSolver

type, bind(C) :: SwigfArrayWrapper
  type(C_PTR), public :: data
  integer(C_SIZE_T), public :: size
end type


 ! TYPES
 type :: TrilinosSolver
  ! These should be treated as PROTECTED data
  type(C_PTR), public :: swigptr = C_NULL_PTR
 contains
  procedure :: create => swigf_new_TrilinosSolver
  procedure, private :: init__SWIG_0 => swigf_TrilinosSolver_init__SWIG_0
  procedure, private :: init__SWIG_1 => swigf_TrilinosSolver_init__SWIG_1
  procedure :: setup_matrix => swigf_TrilinosSolver_setup_matrix
  procedure, private :: setup_operator__SWIG_0 => swigf_TrilinosSolver_setup_operator__SWIG_0
  procedure, private :: setup_operator__SWIG_1 => swigf_TrilinosSolver_setup_operator__SWIG_1
  procedure :: setup_solver => swigf_TrilinosSolver_setup_solver
  procedure :: solve => swigf_TrilinosSolver_solve
  procedure :: finalize => swigf_TrilinosSolver_finalize
  procedure :: release => swigf_delete_TrilinosSolver
  generic :: init => init__SWIG_0, init__SWIG_1
  generic :: setup_operator => setup_operator__SWIG_0, setup_operator__SWIG_1
 end type
 type :: TrilinosEigenSolver
  ! These should be treated as PROTECTED data
  type(C_PTR), public :: swigptr = C_NULL_PTR
 contains
  procedure :: create => swigf_new_TrilinosEigenSolver
  procedure, private :: init__SWIG_0 => swigf_TrilinosEigenSolver_init__SWIG_0
  procedure, private :: init__SWIG_1 => swigf_TrilinosEigenSolver_init__SWIG_1
  procedure :: setup_matrix => swigf_TrilinosEigenSolver_setup_matrix
  procedure :: setup_matrix_rhs => swigf_TrilinosEigenSolver_setup_matrix_rhs
  procedure, private :: setup_operator__SWIG_0 => swigf_TrilinosEigenSolver_setup_operator__SWIG_0
  procedure, private :: setup_operator__SWIG_1 => swigf_TrilinosEigenSolver_setup_operator__SWIG_1
  procedure, private :: setup_operator_rhs__SWIG_0 => swigf_TrilinosEigenSolver_setup_operator_rhs__SWIG_0
  procedure, private :: setup_operator_rhs__SWIG_1 => swigf_TrilinosEigenSolver_setup_operator_rhs__SWIG_1
  procedure :: setup_solver => swigf_TrilinosEigenSolver_setup_solver
  procedure :: solve => swigf_TrilinosEigenSolver_solve
  procedure :: finalize => swigf_TrilinosEigenSolver_finalize
  procedure :: release => swigf_delete_TrilinosEigenSolver
  generic :: init => init__SWIG_0, init__SWIG_1
  generic :: setup_operator => setup_operator__SWIG_0, setup_operator__SWIG_1
  generic :: setup_operator_rhs => setup_operator_rhs__SWIG_0, setup_operator_rhs__SWIG_1
 end type


 ! WRAPPER DECLARATIONS
 interface
function swigc_new_TrilinosSolver() &
bind(C, name="swigc_new_TrilinosSolver") &
result(fresult)
use, intrinsic :: ISO_C_BINDING
type(C_PTR) :: fresult
end function

subroutine swigc_TrilinosSolver_init__SWIG_0(farg1) &
bind(C, name="swigc_TrilinosSolver_init__SWIG_0")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
end subroutine

subroutine swigc_TrilinosSolver_init__SWIG_1(farg1, farg2) &
bind(C, name="swigc_TrilinosSolver_init__SWIG_1")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_PTR), value :: farg2
end subroutine

subroutine swigc_TrilinosSolver_setup_matrix(farg1, farg2) &
bind(C, name="swigc_TrilinosSolver_setup_matrix")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_PTR), value :: farg2
end subroutine

subroutine swigc_TrilinosSolver_setup_operator__SWIG_0(farg1, farg2, farg3, farg4) &
bind(C, name="swigc_TrilinosSolver_setup_operator__SWIG_0")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_FUNPTR), intent(in), value :: farg2
type(C_PTR), value :: farg3
type(C_PTR), value :: farg4
end subroutine

subroutine swigc_TrilinosSolver_setup_operator__SWIG_1(farg1, farg2, farg3) &
bind(C, name="swigc_TrilinosSolver_setup_operator__SWIG_1")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_FUNPTR), intent(in), value :: farg2
type(C_PTR), value :: farg3
end subroutine

subroutine swigc_TrilinosSolver_setup_solver(farg1, farg2) &
bind(C, name="swigc_TrilinosSolver_setup_solver")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_PTR), value :: farg2
end subroutine

subroutine swigc_TrilinosSolver_solve(farg1, farg2, farg3) &
bind(C, name="swigc_TrilinosSolver_solve")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_PTR), value :: farg2
type(C_PTR), value :: farg3
end subroutine

subroutine swigc_TrilinosSolver_finalize(farg1) &
bind(C, name="swigc_TrilinosSolver_finalize")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
end subroutine

subroutine swigc_delete_TrilinosSolver(farg1) &
bind(C, name="swigc_delete_TrilinosSolver")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
end subroutine

function swigc_new_TrilinosEigenSolver() &
bind(C, name="swigc_new_TrilinosEigenSolver") &
result(fresult)
use, intrinsic :: ISO_C_BINDING
type(C_PTR) :: fresult
end function

subroutine swigc_TrilinosEigenSolver_init__SWIG_0(farg1) &
bind(C, name="swigc_TrilinosEigenSolver_init__SWIG_0")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
end subroutine

subroutine swigc_TrilinosEigenSolver_init__SWIG_1(farg1, farg2) &
bind(C, name="swigc_TrilinosEigenSolver_init__SWIG_1")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_PTR), value :: farg2
end subroutine

subroutine swigc_TrilinosEigenSolver_setup_matrix(farg1, farg2) &
bind(C, name="swigc_TrilinosEigenSolver_setup_matrix")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_PTR), value :: farg2
end subroutine

subroutine swigc_TrilinosEigenSolver_setup_matrix_rhs(farg1, farg2) &
bind(C, name="swigc_TrilinosEigenSolver_setup_matrix_rhs")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_PTR), value :: farg2
end subroutine

subroutine swigc_TrilinosEigenSolver_setup_operator__SWIG_0(farg1, farg2, farg3, farg4) &
bind(C, name="swigc_TrilinosEigenSolver_setup_operator__SWIG_0")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_FUNPTR), intent(in), value :: farg2
type(C_PTR), value :: farg3
type(C_PTR), value :: farg4
end subroutine

subroutine swigc_TrilinosEigenSolver_setup_operator__SWIG_1(farg1, farg2, farg3) &
bind(C, name="swigc_TrilinosEigenSolver_setup_operator__SWIG_1")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_FUNPTR), intent(in), value :: farg2
type(C_PTR), value :: farg3
end subroutine

subroutine swigc_TrilinosEigenSolver_setup_operator_rhs__SWIG_0(farg1, farg2, farg3, farg4) &
bind(C, name="swigc_TrilinosEigenSolver_setup_operator_rhs__SWIG_0")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_FUNPTR), intent(in), value :: farg2
type(C_PTR), value :: farg3
type(C_PTR), value :: farg4
end subroutine

subroutine swigc_TrilinosEigenSolver_setup_operator_rhs__SWIG_1(farg1, farg2, farg3) &
bind(C, name="swigc_TrilinosEigenSolver_setup_operator_rhs__SWIG_1")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_FUNPTR), intent(in), value :: farg2
type(C_PTR), value :: farg3
end subroutine

subroutine swigc_TrilinosEigenSolver_setup_solver(farg1, farg2) &
bind(C, name="swigc_TrilinosEigenSolver_setup_solver")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
type(C_PTR), value :: farg2
end subroutine

subroutine swigc_TrilinosEigenSolver_solve(farg1, farg2, farg3) &
bind(C, name="swigc_TrilinosEigenSolver_solve")
use, intrinsic :: ISO_C_BINDING
import :: SwigfArrayWrapper
type(C_PTR), value :: farg1
type(SwigfArrayWrapper) :: farg2
type(C_PTR), value :: farg3
end subroutine

subroutine swigc_TrilinosEigenSolver_finalize(farg1) &
bind(C, name="swigc_TrilinosEigenSolver_finalize")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
end subroutine

subroutine swigc_delete_TrilinosEigenSolver(farg1) &
bind(C, name="swigc_delete_TrilinosEigenSolver")
use, intrinsic :: ISO_C_BINDING
type(C_PTR), value :: farg1
end subroutine

 end interface


contains
 ! FORTRAN PROXY CODE
subroutine swigf_new_TrilinosSolver(self)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(C_PTR) :: fresult 

if (c_associated(self%swigptr)) call self%release()
fresult = swigc_new_TrilinosSolver()
self%swigptr = fresult
end subroutine

subroutine swigf_TrilinosSolver_init__SWIG_0(self)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(C_PTR) :: farg1 

farg1 = self%swigptr
call swigc_TrilinosSolver_init__SWIG_0(farg1)
end subroutine

subroutine swigf_TrilinosSolver_init__SWIG_1(self, comm)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(TeuchosComm) :: comm
type(C_PTR) :: farg1 
type(C_PTR) :: farg2 

farg1 = self%swigptr
farg2 = comm%swigptr
call swigc_TrilinosSolver_init__SWIG_1(farg1, farg2)
end subroutine

subroutine swigf_TrilinosSolver_setup_matrix(self, a)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(TpetraCrsMatrix) :: a
type(C_PTR) :: farg1 
type(C_PTR) :: farg2 

farg1 = self%swigptr
farg2 = a%swigptr
call swigc_TrilinosSolver_setup_matrix(farg1, farg2)
end subroutine

subroutine swigf_TrilinosSolver_setup_operator__SWIG_0(self, callback, domainmap, rangemap)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(C_FUNPTR), intent(in), value :: callback
type(TpetraMap) :: domainmap
type(TpetraMap) :: rangemap
type(C_PTR) :: farg1 
type(C_FUNPTR) :: farg2 
type(C_PTR) :: farg3 
type(C_PTR) :: farg4 

farg1 = self%swigptr
farg2 = callback
farg3 = domainmap%swigptr
farg4 = rangemap%swigptr
call swigc_TrilinosSolver_setup_operator__SWIG_0(farg1, farg2, farg3, farg4)
end subroutine

subroutine swigf_TrilinosSolver_setup_operator__SWIG_1(self, callback, domainmap)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(C_FUNPTR), intent(in), value :: callback
type(TpetraMap) :: domainmap
type(C_PTR) :: farg1 
type(C_FUNPTR) :: farg2 
type(C_PTR) :: farg3 

farg1 = self%swigptr
farg2 = callback
farg3 = domainmap%swigptr
call swigc_TrilinosSolver_setup_operator__SWIG_1(farg1, farg2, farg3)
end subroutine

subroutine swigf_TrilinosSolver_setup_solver(self, paramlist)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(ParameterList) :: paramlist
type(C_PTR) :: farg1 
type(C_PTR) :: farg2 

farg1 = self%swigptr
farg2 = paramlist%swigptr
call swigc_TrilinosSolver_setup_solver(farg1, farg2)
end subroutine

subroutine swigf_TrilinosSolver_solve(self, rhs, lhs)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(TpetraMultiVector) :: rhs
type(TpetraMultiVector) :: lhs
type(C_PTR) :: farg1 
type(C_PTR) :: farg2 
type(C_PTR) :: farg3 

farg1 = self%swigptr
farg2 = rhs%swigptr
farg3 = lhs%swigptr
call swigc_TrilinosSolver_solve(farg1, farg2, farg3)
end subroutine

subroutine swigf_TrilinosSolver_finalize(self)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(C_PTR) :: farg1 

farg1 = self%swigptr
call swigc_TrilinosSolver_finalize(farg1)
end subroutine

subroutine swigf_delete_TrilinosSolver(self)
use, intrinsic :: ISO_C_BINDING
class(TrilinosSolver) :: self
type(C_PTR) :: farg1 

if (.not. c_associated(self%swigptr)) return
farg1 = self%swigptr
call swigc_delete_TrilinosSolver(farg1)
self%swigptr = C_NULL_PTR
end subroutine

subroutine swigf_new_TrilinosEigenSolver(self)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(C_PTR) :: fresult 

if (c_associated(self%swigptr)) call self%release()
fresult = swigc_new_TrilinosEigenSolver()
self%swigptr = fresult
end subroutine

subroutine swigf_TrilinosEigenSolver_init__SWIG_0(self)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(C_PTR) :: farg1 

farg1 = self%swigptr
call swigc_TrilinosEigenSolver_init__SWIG_0(farg1)
end subroutine

subroutine swigf_TrilinosEigenSolver_init__SWIG_1(self, comm)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(TeuchosComm) :: comm
type(C_PTR) :: farg1 
type(C_PTR) :: farg2 

farg1 = self%swigptr
farg2 = comm%swigptr
call swigc_TrilinosEigenSolver_init__SWIG_1(farg1, farg2)
end subroutine

subroutine swigf_TrilinosEigenSolver_setup_matrix(self, a)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(TpetraCrsMatrix) :: a
type(C_PTR) :: farg1 
type(C_PTR) :: farg2 

farg1 = self%swigptr
farg2 = a%swigptr
call swigc_TrilinosEigenSolver_setup_matrix(farg1, farg2)
end subroutine

subroutine swigf_TrilinosEigenSolver_setup_matrix_rhs(self, m)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(TpetraCrsMatrix) :: m
type(C_PTR) :: farg1 
type(C_PTR) :: farg2 

farg1 = self%swigptr
farg2 = m%swigptr
call swigc_TrilinosEigenSolver_setup_matrix_rhs(farg1, farg2)
end subroutine

subroutine swigf_TrilinosEigenSolver_setup_operator__SWIG_0(self, callback, domainmap, rangemap)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(C_FUNPTR), intent(in), value :: callback
type(TpetraMap) :: domainmap
type(TpetraMap) :: rangemap
type(C_PTR) :: farg1 
type(C_FUNPTR) :: farg2 
type(C_PTR) :: farg3 
type(C_PTR) :: farg4 

farg1 = self%swigptr
farg2 = callback
farg3 = domainmap%swigptr
farg4 = rangemap%swigptr
call swigc_TrilinosEigenSolver_setup_operator__SWIG_0(farg1, farg2, farg3, farg4)
end subroutine

subroutine swigf_TrilinosEigenSolver_setup_operator__SWIG_1(self, callback, domainmap)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(C_FUNPTR), intent(in), value :: callback
type(TpetraMap) :: domainmap
type(C_PTR) :: farg1 
type(C_FUNPTR) :: farg2 
type(C_PTR) :: farg3 

farg1 = self%swigptr
farg2 = callback
farg3 = domainmap%swigptr
call swigc_TrilinosEigenSolver_setup_operator__SWIG_1(farg1, farg2, farg3)
end subroutine

subroutine swigf_TrilinosEigenSolver_setup_operator_rhs__SWIG_0(self, callback, domainmap, rangemap)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(C_FUNPTR), intent(in), value :: callback
type(TpetraMap) :: domainmap
type(TpetraMap) :: rangemap
type(C_PTR) :: farg1 
type(C_FUNPTR) :: farg2 
type(C_PTR) :: farg3 
type(C_PTR) :: farg4 

farg1 = self%swigptr
farg2 = callback
farg3 = domainmap%swigptr
farg4 = rangemap%swigptr
call swigc_TrilinosEigenSolver_setup_operator_rhs__SWIG_0(farg1, farg2, farg3, farg4)
end subroutine

subroutine swigf_TrilinosEigenSolver_setup_operator_rhs__SWIG_1(self, callback, domainmap)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(C_FUNPTR), intent(in), value :: callback
type(TpetraMap) :: domainmap
type(C_PTR) :: farg1 
type(C_FUNPTR) :: farg2 
type(C_PTR) :: farg3 

farg1 = self%swigptr
farg2 = callback
farg3 = domainmap%swigptr
call swigc_TrilinosEigenSolver_setup_operator_rhs__SWIG_1(farg1, farg2, farg3)
end subroutine

subroutine swigf_TrilinosEigenSolver_setup_solver(self, paramlist)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(ParameterList) :: paramlist
type(C_PTR) :: farg1 
type(C_PTR) :: farg2 

farg1 = self%swigptr
farg2 = paramlist%swigptr
call swigc_TrilinosEigenSolver_setup_solver(farg1, farg2)
end subroutine

subroutine swigf_TrilinosEigenSolver_solve(self, eigenvalues, lhs)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
real(C_DOUBLE), dimension(:), target, intent(inout) :: eigenvalues
type(TpetraMultiVector) :: lhs
type(C_PTR) :: farg1 
type(SwigfArrayWrapper) :: farg2 
type(C_PTR) :: farg3 

farg1 = self%swigptr
farg2%data = c_loc(eigenvalues(1))
farg2%size = size(eigenvalues)
farg3 = lhs%swigptr
call swigc_TrilinosEigenSolver_solve(farg1, farg2, farg3)
end subroutine

subroutine swigf_TrilinosEigenSolver_finalize(self)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(C_PTR) :: farg1 

farg1 = self%swigptr
call swigc_TrilinosEigenSolver_finalize(farg1)
end subroutine

subroutine swigf_delete_TrilinosEigenSolver(self)
use, intrinsic :: ISO_C_BINDING
class(TrilinosEigenSolver) :: self
type(C_PTR) :: farg1 

if (.not. c_associated(self%swigptr)) return
farg1 = self%swigptr
call swigc_delete_TrilinosEigenSolver(farg1)
self%swigptr = C_NULL_PTR
end subroutine


end module fortrilinos
