## Copyright 2017-2018, UT-Battelle, LLC
##
## SPDX-License-Identifier: BSD-3-Clause
## License-Filename: LICENSE
TRIBITS_COPY_FILES_TO_BINARY_DIR(Interface_cp
  SOURCE_FILES stratimikos.xml davidson.xml LHS_matrix.mat RHS_matrix.mat nox_params.xml
 )

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})

IF (${PACKAGE_NAME}_ENABLE_Belos AND ${PACKAGE_NAME}_ENABLE_Ifpack2)

  TRIBITS_ADD_EXECUTABLE_AND_TEST(
    test_solver_handle_test_cpp
    SOURCES test_solver_handle.cpp
    COMM serial mpi
  )

  TRIBITS_ADD_EXECUTABLE_AND_TEST(
    test_solver_handle_test_fortran
    SOURCES test_solver_handle.F90
    LINKER_LANGUAGE Fortran
    COMM serial mpi
  )

  TRIBITS_ADD_EXECUTABLE_AND_TEST(
    test_solver_unit
    SOURCES test_solver_unit.F90
    LINKER_LANGUAGE Fortran
    COMM serial mpi
    NUM_MPI_PROCS 4
    )

ENDIF()

IF (${PACKAGE_NAME}_ENABLE_Anasazi)

  TRIBITS_ADD_EXECUTABLE_AND_TEST(
    test_eigen_handle_cpp
    SOURCES test_eigen_handle.cpp
    COMM serial mpi
    NUM_MPI_PROCS 1
    )

  TRIBITS_ADD_EXECUTABLE_AND_TEST(
    test_eigen_handle_preset_cpp
    SOURCES test_eigen_handle_preset.cpp
    COMM serial mpi
    NUM_MPI_PROCS 1
    )

  TRIBITS_ADD_EXECUTABLE_AND_TEST(
    test_eigen_handle_fortran
    SOURCES test_eigen_handle.F90
    LINKER_LANGUAGE Fortran
    COMM serial mpi
    NUM_MPI_PROCS 1
    )

  TRIBITS_ADD_EXECUTABLE_AND_TEST(
    test_eigen_unit
    SOURCES test_eigen_unit.F90
    LINKER_LANGUAGE Fortran
    COMM serial mpi
    NUM_MPI_PROCS 4
    )

  TRIBITS_ADD_EXECUTABLE_AND_TEST(
    test_futility
    SOURCES test_futility_reproducer.F90
    LINKER_LANGUAGE Fortran
    COMM serial mpi
    NUM_MPI_PROCS 1
    )

ENDIF()

TRIBITS_ADD_EXECUTABLE_AND_TEST(
  test_nox_cpp
  SOURCES test_nox.cpp
  COMM serial mpi
  )

TRIBITS_ADD_EXECUTABLE_AND_TEST(
  test_nox_fortran
  SOURCES Tpetra_ModelEvaluator_1DFEM.F90 test_nox.F90
  LINKER_LANGUAGE Fortran
  STANDARD_PASS_OUTPUT
  COMM serial mpi
  )

#TARGET_LINK_LIBRARIES(test_nox_fortran Tpetra_ModelEvaluator_module)
#TARGET_INCLUDE_DIRECTORIES(test_nox_fortran PUBLIC
#  $<TARGET_PROPERTY:Tpetra_ModelEvaluator_module,${CMAKE_BINARY_DIR}>
#)
