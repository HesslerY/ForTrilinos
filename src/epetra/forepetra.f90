module forepetra  ! Companion to CEpetra_*.h
  use ,intrinsic     :: iso_c_binding ,only : c_int,c_double,c_char,c_bool,c_ptr,c_long,c_float ! Kind parameters
  use ,non_intrinsic :: ForTrilinos_enums
  implicit none   ! Prevent implicit typing

  ! This file provides Fortran interface blocks that bind the argument types,
  ! return value types, and procedure names to those in the C function prototypes
  ! in each of the CTrilinos/src/epetra/CEpetra_*.h header files.  The Fortran
  ! 2003 standard guarantees that the types and names used in these bindings
  ! interoperate with a standard-conforming, companion C compiler.

  ! Since this file contains only interface bodies, this interface block ends at
  ! the bottom of the file.

  interface

  ! _________________ Epetra_Distributor interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Distributor_ID_t Epetra_Distributor_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Distributor_ID_t) function Epetra_Distributor_Cast ( id ) &
        bind(C,name='Epetra_Distributor_Cast')
    import :: FT_Epetra_Distributor_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t)   ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Distributor_Abstract ( CT_Epetra_Distributor_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Distributor_Abstract ( id ) &
        bind(C,name='Epetra_Distributor_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Distributor_ID_t
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! virtual Epetra_Distributor * Clone() = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Distributor_ID_t Epetra_Distributor_Clone ( CT_Epetra_Distributor_ID_t selfID );

  type(FT_Epetra_Distributor_ID_t) function Epetra_Distributor_Clone ( selfID ) &
        bind(C,name='Epetra_Distributor_Clone')
    import :: FT_Epetra_Distributor_ID_t
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Distributor();
  ! CTrilinos prototype:
  ! void Epetra_Distributor_Destroy ( CT_Epetra_Distributor_ID_t * selfID );

  subroutine Epetra_Distributor_Destroy ( selfID ) &
        bind(C,name='Epetra_Distributor_Destroy')
    import :: FT_Epetra_Distributor_ID_t
    implicit none
    type(FT_Epetra_Distributor_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual int CreateFromSends( const int & NumExportIDs, const int * ExportPIDs, bool Deterministic, int & NumRemoteIDs ) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_CreateFromSends ( CT_Epetra_Distributor_ID_t selfID, int NumExportIDs, const int * ExportPIDs, boolean Deterministic, int * NumRemoteIDs );

  integer(c_int) function Epetra_Distributor_CreateFromSends ( selfID, NumExportIDs, &
        ExportPIDs, Deterministic, NumRemoteIDs ) &
        bind(C,name='Epetra_Distributor_CreateFromSends')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_bool
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: NumExportIDs
    integer(c_int)                  ,intent(in)         ,dimension(*) :: ExportPIDs
    logical(c_bool)                 ,intent(in)   ,value              :: Deterministic
    integer(c_int)                  ,intent(inout)                    :: NumRemoteIDs
  end function


  ! Original C++ prototype:
  ! virtual int CreateFromRecvs( const int & NumRemoteIDs, const int * RemoteGIDs, const int * RemotePIDs, bool Deterministic, int & NumExportIDs, int *& ExportGIDs, int *& ExportPIDs) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_CreateFromRecvs ( CT_Epetra_Distributor_ID_t selfID, int NumRemoteIDs, const int * RemoteGIDs, const int * RemotePIDs, boolean Deterministic, int * NumExportIDs, int ** ExportGIDs, int ** ExportPIDs );

  integer(c_int) function Epetra_Distributor_CreateFromRecvs ( selfID, NumRemoteIDs, &
        RemoteGIDs, RemotePIDs, Deterministic, NumExportIDs, ExportGIDs, ExportPIDs ) &
        bind(C,name='Epetra_Distributor_CreateFromRecvs')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_bool
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: NumRemoteIDs
    integer(c_int)                  ,intent(in)         ,dimension(*) :: RemoteGIDs
    integer(c_int)                  ,intent(in)         ,dimension(*) :: RemotePIDs
    logical(c_bool)                 ,intent(in)   ,value              :: Deterministic
    integer(c_int)                  ,intent(inout)                    :: NumExportIDs
    integer(c_int)                  ,intent(inout)      ,dimension(*) :: ExportGIDs
    integer(c_int)                  ,intent(inout)      ,dimension(*) :: ExportPIDs
  end function


  ! Original C++ prototype:
  ! virtual int Do( char * export_objs, int obj_size, int & len_import_objs, char *& import_objs) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_Do ( CT_Epetra_Distributor_ID_t selfID, char * export_objs, int obj_size, int * len_import_objs, char ** import_objs );

  integer(c_int) function Epetra_Distributor_Do ( selfID, export_objs, obj_size, &
        len_import_objs, import_objs ) bind(C,name='Epetra_Distributor_Do')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_char
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                              ,dimension(*) :: export_objs
    integer(c_int)                  ,intent(in)   ,value              :: obj_size
    integer(c_int)                  ,intent(inout)                    :: len_import_objs
    character(kind=c_char)          ,intent(inout)      ,dimension(*) :: import_objs
  end function


  ! Original C++ prototype:
  ! virtual int DoReverse( char * export_objs, int obj_size, int & len_import_objs, char *& import_objs ) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_DoReverse ( CT_Epetra_Distributor_ID_t selfID, char * export_objs, int obj_size, int * len_import_objs, char ** import_objs );

  integer(c_int) function Epetra_Distributor_DoReverse ( selfID, export_objs, obj_size, &
        len_import_objs, import_objs ) bind(C,name='Epetra_Distributor_DoReverse')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_char
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                              ,dimension(*) :: export_objs
    integer(c_int)                  ,intent(in)   ,value              :: obj_size
    integer(c_int)                  ,intent(inout)                    :: len_import_objs
    character(kind=c_char)          ,intent(inout)      ,dimension(*) :: import_objs
  end function


  ! Original C++ prototype:
  ! virtual int DoPosts( char * export_objs, int obj_size, int & len_import_objs, char *& import_objs ) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_DoPosts ( CT_Epetra_Distributor_ID_t selfID, char * export_objs, int obj_size, int * len_import_objs, char ** import_objs );

  integer(c_int) function Epetra_Distributor_DoPosts ( selfID, export_objs, obj_size, &
        len_import_objs, import_objs ) bind(C,name='Epetra_Distributor_DoPosts')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_char
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                              ,dimension(*) :: export_objs
    integer(c_int)                  ,intent(in)   ,value              :: obj_size
    integer(c_int)                  ,intent(inout)                    :: len_import_objs
    character(kind=c_char)          ,intent(inout)      ,dimension(*) :: import_objs
  end function


  ! Original C++ prototype:
  ! virtual int DoWaits() = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_DoWaits ( CT_Epetra_Distributor_ID_t selfID );

  integer(c_int) function Epetra_Distributor_DoWaits ( selfID ) &
        bind(C,name='Epetra_Distributor_DoWaits')
    import :: c_int ,FT_Epetra_Distributor_ID_t
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int DoReversePosts( char * export_objs, int obj_size, int & len_import_objs, char *& import_objs) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_DoReversePosts ( CT_Epetra_Distributor_ID_t selfID, char * export_objs, int obj_size, int * len_import_objs, char ** import_objs );

  integer(c_int) function Epetra_Distributor_DoReversePosts ( selfID, export_objs, obj_size, &
        len_import_objs, import_objs ) bind(C,name='Epetra_Distributor_DoReversePosts')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_char
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                              ,dimension(*) :: export_objs
    integer(c_int)                  ,intent(in)   ,value              :: obj_size
    integer(c_int)                  ,intent(inout)                    :: len_import_objs
    character(kind=c_char)          ,intent(inout)      ,dimension(*) :: import_objs
  end function


  ! Original C++ prototype:
  ! virtual int DoReverseWaits() = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_DoReverseWaits ( CT_Epetra_Distributor_ID_t selfID );

  integer(c_int) function Epetra_Distributor_DoReverseWaits ( selfID ) &
        bind(C,name='Epetra_Distributor_DoReverseWaits')
    import :: c_int ,FT_Epetra_Distributor_ID_t
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int Do( char * export_objs, int obj_size, int *& sizes, int & len_import_objs, char *& import_objs) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_Do_VarLen ( CT_Epetra_Distributor_ID_t selfID, char * export_objs, int obj_size, int ** sizes, int * len_import_objs, char ** import_objs );

  integer(c_int) function Epetra_Distributor_Do_VarLen ( selfID, export_objs, obj_size, &
        sizes, len_import_objs, import_objs ) bind(C,name='Epetra_Distributor_Do_VarLen')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_char
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                              ,dimension(*) :: export_objs
    integer(c_int)                  ,intent(in)   ,value              :: obj_size
    integer(c_int)                  ,intent(inout)      ,dimension(*) :: sizes
    integer(c_int)                  ,intent(inout)                    :: len_import_objs
    character(kind=c_char)          ,intent(inout)      ,dimension(*) :: import_objs
  end function


  ! Original C++ prototype:
  ! virtual int DoReverse( char * export_objs, int obj_size, int *& sizes, int & len_import_objs, char *& import_objs) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_DoReverse_VarLen ( CT_Epetra_Distributor_ID_t selfID, char * export_objs, int obj_size, int ** sizes, int * len_import_objs, char ** import_objs );

  integer(c_int) function Epetra_Distributor_DoReverse_VarLen ( selfID, export_objs, &
        obj_size, sizes, len_import_objs, import_objs ) &
        bind(C,name='Epetra_Distributor_DoReverse_VarLen')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_char
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                              ,dimension(*) :: export_objs
    integer(c_int)                  ,intent(in)   ,value              :: obj_size
    integer(c_int)                  ,intent(inout)      ,dimension(*) :: sizes
    integer(c_int)                  ,intent(inout)                    :: len_import_objs
    character(kind=c_char)          ,intent(inout)      ,dimension(*) :: import_objs
  end function


  ! Original C++ prototype:
  ! virtual int DoPosts( char * export_objs, int obj_size, int *& sizes, int & len_import_objs, char *& import_objs) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_DoPosts_VarLen ( CT_Epetra_Distributor_ID_t selfID, char * export_objs, int obj_size, int ** sizes, int * len_import_objs, char ** import_objs );

  integer(c_int) function Epetra_Distributor_DoPosts_VarLen ( selfID, export_objs, obj_size, &
        sizes, len_import_objs, import_objs ) &
        bind(C,name='Epetra_Distributor_DoPosts_VarLen')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_char
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                              ,dimension(*) :: export_objs
    integer(c_int)                  ,intent(in)   ,value              :: obj_size
    integer(c_int)                  ,intent(inout)      ,dimension(*) :: sizes
    integer(c_int)                  ,intent(inout)                    :: len_import_objs
    character(kind=c_char)          ,intent(inout)      ,dimension(*) :: import_objs
  end function


  ! Original C++ prototype:
  ! virtual int DoReversePosts( char * export_objs, int obj_size, int *& sizes, int & len_import_objs, char *& import_objs) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Distributor_DoReversePosts_VarLen ( CT_Epetra_Distributor_ID_t selfID, char * export_objs, int obj_size, int ** sizes, int * len_import_objs, char ** import_objs );

  integer(c_int) function Epetra_Distributor_DoReversePosts_VarLen ( selfID, export_objs, &
        obj_size, sizes, len_import_objs, import_objs ) &
        bind(C,name='Epetra_Distributor_DoReversePosts_VarLen')
    import :: c_int ,FT_Epetra_Distributor_ID_t ,c_char
    implicit none
    type(FT_Epetra_Distributor_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                              ,dimension(*) :: export_objs
    integer(c_int)                  ,intent(in)   ,value              :: obj_size
    integer(c_int)                  ,intent(inout)      ,dimension(*) :: sizes
    integer(c_int)                  ,intent(inout)                    :: len_import_objs
    character(kind=c_char)          ,intent(inout)      ,dimension(*) :: import_objs
  end function


  ! _________________ Epetra_SerialComm interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_SerialComm_ID_t Epetra_SerialComm_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_SerialComm_ID_t) function Epetra_SerialComm_Cast ( id ) &
        bind(C,name='Epetra_SerialComm_Cast')
    import :: FT_Epetra_SerialComm_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t)  ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_SerialComm_Abstract ( CT_Epetra_SerialComm_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_SerialComm_Abstract ( id ) &
        bind(C,name='Epetra_SerialComm_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_SerialComm();
  ! CTrilinos prototype:
  ! CT_Epetra_SerialComm_ID_t Epetra_SerialComm_Create (  );

  type(FT_Epetra_SerialComm_ID_t) function Epetra_SerialComm_Create (  ) &
        bind(C,name='Epetra_SerialComm_Create')
    import :: FT_Epetra_SerialComm_ID_t
    implicit none
  end function


  ! Original C++ prototype:
  ! Epetra_SerialComm(const Epetra_SerialComm& Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_SerialComm_ID_t Epetra_SerialComm_Duplicate ( CT_Epetra_SerialComm_ID_t CommID );

  type(FT_Epetra_SerialComm_ID_t) function Epetra_SerialComm_Duplicate ( CommID ) &
        bind(C,name='Epetra_SerialComm_Duplicate')
    import :: FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_Comm * Clone() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_SerialComm_Clone ( CT_Epetra_SerialComm_ID_t selfID );

  type(FT_Epetra_Comm_ID_t) function Epetra_SerialComm_Clone ( selfID ) &
        bind(C,name='Epetra_SerialComm_Clone')
    import :: FT_Epetra_Comm_ID_t ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_SerialComm();
  ! CTrilinos prototype:
  ! void Epetra_SerialComm_Destroy ( CT_Epetra_SerialComm_ID_t * selfID );

  subroutine Epetra_SerialComm_Destroy ( selfID ) bind(C,name='Epetra_SerialComm_Destroy')
    import :: FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! void Barrier() const;
  ! CTrilinos prototype:
  ! void Epetra_SerialComm_Barrier ( CT_Epetra_SerialComm_ID_t selfID );

  subroutine Epetra_SerialComm_Barrier ( selfID ) bind(C,name='Epetra_SerialComm_Barrier')
    import :: FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int Broadcast(double * MyVals, int Count, int Root) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_Broadcast_Double ( CT_Epetra_SerialComm_ID_t selfID, double * MyVals, int Count, int Root );

  integer(c_int) function Epetra_SerialComm_Broadcast_Double ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_SerialComm_Broadcast_Double')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                     ,dimension(*) :: MyVals
    integer(c_int)                 ,intent(in)   ,value              :: Count
    integer(c_int)                 ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! int Broadcast(int * MyVals, int Count, int Root) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_Broadcast_Int ( CT_Epetra_SerialComm_ID_t selfID, int * MyVals, int Count, int Root );

  integer(c_int) function Epetra_SerialComm_Broadcast_Int ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_SerialComm_Broadcast_Int')
    import :: c_int ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                     ,dimension(*) :: MyVals
    integer(c_int)                 ,intent(in)   ,value              :: Count
    integer(c_int)                 ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! int Broadcast(long * MyVals, int Count, int Root) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_Broadcast_Long ( CT_Epetra_SerialComm_ID_t selfID, long * MyVals, int Count, int Root );

  integer(c_int) function Epetra_SerialComm_Broadcast_Long ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_SerialComm_Broadcast_Long')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                    ,dimension(*) :: MyVals
    integer(c_int)                 ,intent(in)   ,value              :: Count
    integer(c_int)                 ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! int Broadcast(char * MyVals, int Count, int Root) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_Broadcast_Char ( CT_Epetra_SerialComm_ID_t selfID, char * MyVals, int Count, int Root );

  integer(c_int) function Epetra_SerialComm_Broadcast_Char ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_SerialComm_Broadcast_Char')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_char
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                             ,dimension(*) :: MyVals
    integer(c_int)                 ,intent(in)   ,value              :: Count
    integer(c_int)                 ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! int GatherAll(double * MyVals, double * AllVals, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_GatherAll_Double ( CT_Epetra_SerialComm_ID_t selfID, double * MyVals, double * AllVals, int Count );

  integer(c_int) function Epetra_SerialComm_GatherAll_Double ( selfID, MyVals, AllVals, &
        Count ) bind(C,name='Epetra_SerialComm_GatherAll_Double')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                     ,dimension(*) :: MyVals
    real(c_double)                                     ,dimension(*) :: AllVals
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int GatherAll(int * MyVals, int * AllVals, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_GatherAll_Int ( CT_Epetra_SerialComm_ID_t selfID, int * MyVals, int * AllVals, int Count );

  integer(c_int) function Epetra_SerialComm_GatherAll_Int ( selfID, MyVals, AllVals, Count ) &
        bind(C,name='Epetra_SerialComm_GatherAll_Int')
    import :: c_int ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                     ,dimension(*) :: MyVals
    integer(c_int)                                     ,dimension(*) :: AllVals
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int GatherAll(long * MyVals, long * AllVals, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_GatherAll_Long ( CT_Epetra_SerialComm_ID_t selfID, long * MyVals, long * AllVals, int Count );

  integer(c_int) function Epetra_SerialComm_GatherAll_Long ( selfID, MyVals, AllVals, Count ) &
        bind(C,name='Epetra_SerialComm_GatherAll_Long')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                    ,dimension(*) :: MyVals
    integer(c_long)                                    ,dimension(*) :: AllVals
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int SumAll(double * PartialSums, double * GlobalSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_SumAll_Double ( CT_Epetra_SerialComm_ID_t selfID, double * PartialSums, double * GlobalSums, int Count );

  integer(c_int) function Epetra_SerialComm_SumAll_Double ( selfID, PartialSums, GlobalSums, &
        Count ) bind(C,name='Epetra_SerialComm_SumAll_Double')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                     ,dimension(*) :: PartialSums
    real(c_double)                                     ,dimension(*) :: GlobalSums
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int SumAll(int * PartialSums, int * GlobalSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_SumAll_Int ( CT_Epetra_SerialComm_ID_t selfID, int * PartialSums, int * GlobalSums, int Count );

  integer(c_int) function Epetra_SerialComm_SumAll_Int ( selfID, PartialSums, GlobalSums, &
        Count ) bind(C,name='Epetra_SerialComm_SumAll_Int')
    import :: c_int ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                     ,dimension(*) :: PartialSums
    integer(c_int)                                     ,dimension(*) :: GlobalSums
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int SumAll(long * PartialSums, long * GlobalSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_SumAll_Long ( CT_Epetra_SerialComm_ID_t selfID, long * PartialSums, long * GlobalSums, int Count );

  integer(c_int) function Epetra_SerialComm_SumAll_Long ( selfID, PartialSums, GlobalSums, &
        Count ) bind(C,name='Epetra_SerialComm_SumAll_Long')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                    ,dimension(*) :: PartialSums
    integer(c_long)                                    ,dimension(*) :: GlobalSums
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MaxAll(double * PartialMaxs, double * GlobalMaxs, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_MaxAll_Double ( CT_Epetra_SerialComm_ID_t selfID, double * PartialMaxs, double * GlobalMaxs, int Count );

  integer(c_int) function Epetra_SerialComm_MaxAll_Double ( selfID, PartialMaxs, GlobalMaxs, &
        Count ) bind(C,name='Epetra_SerialComm_MaxAll_Double')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                     ,dimension(*) :: PartialMaxs
    real(c_double)                                     ,dimension(*) :: GlobalMaxs
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MaxAll(int * PartialMaxs, int * GlobalMaxs, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_MaxAll_Int ( CT_Epetra_SerialComm_ID_t selfID, int * PartialMaxs, int * GlobalMaxs, int Count );

  integer(c_int) function Epetra_SerialComm_MaxAll_Int ( selfID, PartialMaxs, GlobalMaxs, &
        Count ) bind(C,name='Epetra_SerialComm_MaxAll_Int')
    import :: c_int ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                     ,dimension(*) :: PartialMaxs
    integer(c_int)                                     ,dimension(*) :: GlobalMaxs
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MaxAll(long * PartialMaxs, long * GlobalMaxs, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_MaxAll_Long ( CT_Epetra_SerialComm_ID_t selfID, long * PartialMaxs, long * GlobalMaxs, int Count );

  integer(c_int) function Epetra_SerialComm_MaxAll_Long ( selfID, PartialMaxs, GlobalMaxs, &
        Count ) bind(C,name='Epetra_SerialComm_MaxAll_Long')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                    ,dimension(*) :: PartialMaxs
    integer(c_long)                                    ,dimension(*) :: GlobalMaxs
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MinAll(double * PartialMins, double * GlobalMins, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_MinAll_Double ( CT_Epetra_SerialComm_ID_t selfID, double * PartialMins, double * GlobalMins, int Count );

  integer(c_int) function Epetra_SerialComm_MinAll_Double ( selfID, PartialMins, GlobalMins, &
        Count ) bind(C,name='Epetra_SerialComm_MinAll_Double')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                     ,dimension(*) :: PartialMins
    real(c_double)                                     ,dimension(*) :: GlobalMins
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MinAll(int * PartialMins, int * GlobalMins, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_MinAll_Int ( CT_Epetra_SerialComm_ID_t selfID, int * PartialMins, int * GlobalMins, int Count );

  integer(c_int) function Epetra_SerialComm_MinAll_Int ( selfID, PartialMins, GlobalMins, &
        Count ) bind(C,name='Epetra_SerialComm_MinAll_Int')
    import :: c_int ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                     ,dimension(*) :: PartialMins
    integer(c_int)                                     ,dimension(*) :: GlobalMins
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MinAll(long * PartialMins, long * GlobalMins, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_MinAll_Long ( CT_Epetra_SerialComm_ID_t selfID, long * PartialMins, long * GlobalMins, int Count );

  integer(c_int) function Epetra_SerialComm_MinAll_Long ( selfID, PartialMins, GlobalMins, &
        Count ) bind(C,name='Epetra_SerialComm_MinAll_Long')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                    ,dimension(*) :: PartialMins
    integer(c_long)                                    ,dimension(*) :: GlobalMins
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int ScanSum(double * MyVals, double * ScanSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_ScanSum_Double ( CT_Epetra_SerialComm_ID_t selfID, double * MyVals, double * ScanSums, int Count );

  integer(c_int) function Epetra_SerialComm_ScanSum_Double ( selfID, MyVals, ScanSums, &
        Count ) bind(C,name='Epetra_SerialComm_ScanSum_Double')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                     ,dimension(*) :: MyVals
    real(c_double)                                     ,dimension(*) :: ScanSums
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int ScanSum(int * MyVals, int * ScanSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_ScanSum_Int ( CT_Epetra_SerialComm_ID_t selfID, int * MyVals, int * ScanSums, int Count );

  integer(c_int) function Epetra_SerialComm_ScanSum_Int ( selfID, MyVals, ScanSums, Count ) &
        bind(C,name='Epetra_SerialComm_ScanSum_Int')
    import :: c_int ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                     ,dimension(*) :: MyVals
    integer(c_int)                                     ,dimension(*) :: ScanSums
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int ScanSum(long * MyVals, long * ScanSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_ScanSum_Long ( CT_Epetra_SerialComm_ID_t selfID, long * MyVals, long * ScanSums, int Count );

  integer(c_int) function Epetra_SerialComm_ScanSum_Long ( selfID, MyVals, ScanSums, Count ) &
        bind(C,name='Epetra_SerialComm_ScanSum_Long')
    import :: c_int ,FT_Epetra_SerialComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                    ,dimension(*) :: MyVals
    integer(c_long)                                    ,dimension(*) :: ScanSums
    integer(c_int)                 ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MyPID() const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_MyPID ( CT_Epetra_SerialComm_ID_t selfID );

  integer(c_int) function Epetra_SerialComm_MyPID ( selfID ) &
        bind(C,name='Epetra_SerialComm_MyPID')
    import :: c_int ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumProc() const;
  ! CTrilinos prototype:
  ! int Epetra_SerialComm_NumProc ( CT_Epetra_SerialComm_ID_t selfID );

  integer(c_int) function Epetra_SerialComm_NumProc ( selfID ) &
        bind(C,name='Epetra_SerialComm_NumProc')
    import :: c_int ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_Distributor * CreateDistributor() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Distributor_ID_t Epetra_SerialComm_CreateDistributor ( CT_Epetra_SerialComm_ID_t selfID );

  type(FT_Epetra_Distributor_ID_t) function Epetra_SerialComm_CreateDistributor ( selfID ) &
        bind(C,name='Epetra_SerialComm_CreateDistributor')
    import :: FT_Epetra_Distributor_ID_t ,FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_Directory * CreateDirectory(const Epetra_BlockMap & Map) const;
  ! CTrilinos prototype:
  ! CT_Epetra_Directory_ID_t Epetra_SerialComm_CreateDirectory ( CT_Epetra_SerialComm_ID_t selfID, CT_Epetra_BlockMap_ID_t MapID );

  type(FT_Epetra_Directory_ID_t) function Epetra_SerialComm_CreateDirectory ( selfID, MapID ) &
        bind(C,name='Epetra_SerialComm_CreateDirectory')
    import :: FT_Epetra_Directory_ID_t ,FT_Epetra_SerialComm_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t)  ,intent(in)   ,value              :: MapID
  end function


  ! Original C++ prototype:
  ! Epetra_SerialComm & operator=(const Epetra_SerialComm & Comm);
  ! CTrilinos prototype:
  ! void Epetra_SerialComm_Assign ( CT_Epetra_SerialComm_ID_t selfID, CT_Epetra_SerialComm_ID_t CommID );

  subroutine Epetra_SerialComm_Assign ( selfID, CommID ) &
        bind(C,name='Epetra_SerialComm_Assign')
    import :: FT_Epetra_SerialComm_ID_t
    implicit none
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_SerialComm_ID_t),intent(in)   ,value              :: CommID
  end subroutine


  ! _________________ Epetra_BLAS interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_BLAS_ID_t Epetra_BLAS_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_BLAS_ID_t) function Epetra_BLAS_Cast ( id ) &
        bind(C,name='Epetra_BLAS_Cast')
    import :: FT_Epetra_BLAS_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_BLAS_Abstract ( CT_Epetra_BLAS_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_BLAS_Abstract ( id ) &
        bind(C,name='Epetra_BLAS_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_BLAS_ID_t
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_BLAS(void);
  ! CTrilinos prototype:
  ! CT_Epetra_BLAS_ID_t Epetra_BLAS_Create (  );

  type(FT_Epetra_BLAS_ID_t) function Epetra_BLAS_Create (  ) &
        bind(C,name='Epetra_BLAS_Create')
    import :: FT_Epetra_BLAS_ID_t
    implicit none
  end function


  ! Original C++ prototype:
  ! Epetra_BLAS(const Epetra_BLAS& BLAS);
  ! CTrilinos prototype:
  ! CT_Epetra_BLAS_ID_t Epetra_BLAS_Duplicate ( CT_Epetra_BLAS_ID_t BLASID );

  type(FT_Epetra_BLAS_ID_t) function Epetra_BLAS_Duplicate ( BLASID ) &
        bind(C,name='Epetra_BLAS_Duplicate')
    import :: FT_Epetra_BLAS_ID_t
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: BLASID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_BLAS(void);
  ! CTrilinos prototype:
  ! void Epetra_BLAS_Destroy ( CT_Epetra_BLAS_ID_t * selfID );

  subroutine Epetra_BLAS_Destroy ( selfID ) bind(C,name='Epetra_BLAS_Destroy')
    import :: FT_Epetra_BLAS_ID_t
    implicit none
    type(FT_Epetra_BLAS_ID_t)                                     :: selfID
  end subroutine


  ! Original C++ prototype:
  ! float ASUM(const int N, const float * X, const int INCX = 1) const;
  ! CTrilinos prototype:
  ! float Epetra_BLAS_ASUM_Float ( CT_Epetra_BLAS_ID_t selfID, const int N, const float * X, const int INCX );

  real(c_float) function Epetra_BLAS_ASUM_Float ( selfID, N, X, INCX ) &
        bind(C,name='Epetra_BLAS_ASUM_Float')
    import :: c_float ,FT_Epetra_BLAS_ID_t ,c_int
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)         ,dimension(*) :: X
    integer(c_int)              ,intent(in)   ,value              :: INCX
  end function


  ! Original C++ prototype:
  ! double ASUM(const int N, const double * X, const int INCX = 1) const;
  ! CTrilinos prototype:
  ! double Epetra_BLAS_ASUM_Double ( CT_Epetra_BLAS_ID_t selfID, const int N, const double * X, const int INCX );

  real(c_double) function Epetra_BLAS_ASUM_Double ( selfID, N, X, INCX ) &
        bind(C,name='Epetra_BLAS_ASUM_Double')
    import :: c_double ,FT_Epetra_BLAS_ID_t ,c_int
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)         ,dimension(*) :: X
    integer(c_int)              ,intent(in)   ,value              :: INCX
  end function


  ! Original C++ prototype:
  ! float DOT(const int N, const float * X, const float * Y, const int INCX = 1, const int INCY = 1) const;
  ! CTrilinos prototype:
  ! float Epetra_BLAS_DOT_Float ( CT_Epetra_BLAS_ID_t selfID, const int N, const float * X, const float * Y, const int INCX, const int INCY );

  real(c_float) function Epetra_BLAS_DOT_Float ( selfID, N, X, Y, INCX, INCY ) &
        bind(C,name='Epetra_BLAS_DOT_Float')
    import :: c_float ,FT_Epetra_BLAS_ID_t ,c_int
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)         ,dimension(*) :: X
    real(c_float)               ,intent(in)         ,dimension(*) :: Y
    integer(c_int)              ,intent(in)   ,value              :: INCX
    integer(c_int)              ,intent(in)   ,value              :: INCY
  end function


  ! Original C++ prototype:
  ! double DOT(const int N, const double * X, const double * Y, const int INCX = 1, const int INCY = 1) const;
  ! CTrilinos prototype:
  ! double Epetra_BLAS_DOT_Double ( CT_Epetra_BLAS_ID_t selfID, const int N, const double * X, const double * Y, const int INCX, const int INCY );

  real(c_double) function Epetra_BLAS_DOT_Double ( selfID, N, X, Y, INCX, INCY ) &
        bind(C,name='Epetra_BLAS_DOT_Double')
    import :: c_double ,FT_Epetra_BLAS_ID_t ,c_int
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)         ,dimension(*) :: X
    real(c_double)              ,intent(in)         ,dimension(*) :: Y
    integer(c_int)              ,intent(in)   ,value              :: INCX
    integer(c_int)              ,intent(in)   ,value              :: INCY
  end function


  ! Original C++ prototype:
  ! float NRM2(const int N, const float * X, const int INCX = 1) const;
  ! CTrilinos prototype:
  ! float Epetra_BLAS_NRM2_Float ( CT_Epetra_BLAS_ID_t selfID, const int N, const float * X, const int INCX );

  real(c_float) function Epetra_BLAS_NRM2_Float ( selfID, N, X, INCX ) &
        bind(C,name='Epetra_BLAS_NRM2_Float')
    import :: c_float ,FT_Epetra_BLAS_ID_t ,c_int
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)         ,dimension(*) :: X
    integer(c_int)              ,intent(in)   ,value              :: INCX
  end function


  ! Original C++ prototype:
  ! double NRM2(const int N, const double * X, const int INCX = 1) const;
  ! CTrilinos prototype:
  ! double Epetra_BLAS_NRM2_Double ( CT_Epetra_BLAS_ID_t selfID, const int N, const double * X, const int INCX );

  real(c_double) function Epetra_BLAS_NRM2_Double ( selfID, N, X, INCX ) &
        bind(C,name='Epetra_BLAS_NRM2_Double')
    import :: c_double ,FT_Epetra_BLAS_ID_t ,c_int
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)         ,dimension(*) :: X
    integer(c_int)              ,intent(in)   ,value              :: INCX
  end function


  ! Original C++ prototype:
  ! void SCAL( const int N, const float ALPHA, float * X, const int INCX = 1) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_SCAL_Float ( CT_Epetra_BLAS_ID_t selfID, const int N, const float ALPHA, float * X, const int INCX );

  subroutine Epetra_BLAS_SCAL_Float ( selfID, N, ALPHA, X, INCX ) &
        bind(C,name='Epetra_BLAS_SCAL_Float')
    import :: FT_Epetra_BLAS_ID_t ,c_int ,c_float
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)   ,value              :: ALPHA
    real(c_float)                                   ,dimension(*) :: X
    integer(c_int)              ,intent(in)   ,value              :: INCX
  end subroutine


  ! Original C++ prototype:
  ! void SCAL( const int N, const double ALPHA, double * X, const int INCX = 1) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_SCAL_Double ( CT_Epetra_BLAS_ID_t selfID, const int N, const double ALPHA, double * X, const int INCX );

  subroutine Epetra_BLAS_SCAL_Double ( selfID, N, ALPHA, X, INCX ) &
        bind(C,name='Epetra_BLAS_SCAL_Double')
    import :: FT_Epetra_BLAS_ID_t ,c_int ,c_double
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)   ,value              :: ALPHA
    real(c_double)                                  ,dimension(*) :: X
    integer(c_int)              ,intent(in)   ,value              :: INCX
  end subroutine


  ! Original C++ prototype:
  ! void COPY( const int N, const float * X, float * Y, const int INCX = 1, const int INCY = 1) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_COPY_Float ( CT_Epetra_BLAS_ID_t selfID, const int N, const float * X, float * Y, const int INCX, const int INCY );

  subroutine Epetra_BLAS_COPY_Float ( selfID, N, X, Y, INCX, INCY ) &
        bind(C,name='Epetra_BLAS_COPY_Float')
    import :: FT_Epetra_BLAS_ID_t ,c_int ,c_float
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)         ,dimension(*) :: X
    real(c_float)                                   ,dimension(*) :: Y
    integer(c_int)              ,intent(in)   ,value              :: INCX
    integer(c_int)              ,intent(in)   ,value              :: INCY
  end subroutine


  ! Original C++ prototype:
  ! void COPY( const int N, const double * X, double * Y, const int INCX = 1, const int INCY = 1) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_COPY_Double ( CT_Epetra_BLAS_ID_t selfID, const int N, const double * X, double * Y, const int INCX, const int INCY );

  subroutine Epetra_BLAS_COPY_Double ( selfID, N, X, Y, INCX, INCY ) &
        bind(C,name='Epetra_BLAS_COPY_Double')
    import :: FT_Epetra_BLAS_ID_t ,c_int ,c_double
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)         ,dimension(*) :: X
    real(c_double)                                  ,dimension(*) :: Y
    integer(c_int)              ,intent(in)   ,value              :: INCX
    integer(c_int)              ,intent(in)   ,value              :: INCY
  end subroutine


  ! Original C++ prototype:
  ! int IAMAX( const int N, const float * X, const int INCX = 1) const;
  ! CTrilinos prototype:
  ! int Epetra_BLAS_IAMAX_Float ( CT_Epetra_BLAS_ID_t selfID, const int N, const float * X, const int INCX );

  integer(c_int) function Epetra_BLAS_IAMAX_Float ( selfID, N, X, INCX ) &
        bind(C,name='Epetra_BLAS_IAMAX_Float')
    import :: c_int ,FT_Epetra_BLAS_ID_t ,c_float
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)         ,dimension(*) :: X
    integer(c_int)              ,intent(in)   ,value              :: INCX
  end function


  ! Original C++ prototype:
  ! int IAMAX( const int N, const double * X, const int INCX = 1) const;
  ! CTrilinos prototype:
  ! int Epetra_BLAS_IAMAX_Double ( CT_Epetra_BLAS_ID_t selfID, const int N, const double * X, const int INCX );

  integer(c_int) function Epetra_BLAS_IAMAX_Double ( selfID, N, X, INCX ) &
        bind(C,name='Epetra_BLAS_IAMAX_Double')
    import :: c_int ,FT_Epetra_BLAS_ID_t ,c_double
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)         ,dimension(*) :: X
    integer(c_int)              ,intent(in)   ,value              :: INCX
  end function


  ! Original C++ prototype:
  ! void AXPY( const int N, const float ALPHA, const float * X, float * Y, const int INCX = 1, const int INCY = 1) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_AXPY_Float ( CT_Epetra_BLAS_ID_t selfID, const int N, const float ALPHA, const float * X, float * Y, const int INCX, const int INCY );

  subroutine Epetra_BLAS_AXPY_Float ( selfID, N, ALPHA, X, Y, INCX, INCY ) &
        bind(C,name='Epetra_BLAS_AXPY_Float')
    import :: FT_Epetra_BLAS_ID_t ,c_int ,c_float
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)   ,value              :: ALPHA
    real(c_float)               ,intent(in)         ,dimension(*) :: X
    real(c_float)                                   ,dimension(*) :: Y
    integer(c_int)              ,intent(in)   ,value              :: INCX
    integer(c_int)              ,intent(in)   ,value              :: INCY
  end subroutine


  ! Original C++ prototype:
  ! void AXPY( const int N, const double ALPHA, const double * X, double * Y, const int INCX = 1, const int INCY = 1) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_AXPY_Double ( CT_Epetra_BLAS_ID_t selfID, const int N, const double ALPHA, const double * X, double * Y, const int INCX, const int INCY );

  subroutine Epetra_BLAS_AXPY_Double ( selfID, N, ALPHA, X, Y, INCX, INCY ) &
        bind(C,name='Epetra_BLAS_AXPY_Double')
    import :: FT_Epetra_BLAS_ID_t ,c_int ,c_double
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)   ,value              :: ALPHA
    real(c_double)              ,intent(in)         ,dimension(*) :: X
    real(c_double)                                  ,dimension(*) :: Y
    integer(c_int)              ,intent(in)   ,value              :: INCX
    integer(c_int)              ,intent(in)   ,value              :: INCY
  end subroutine


  ! Original C++ prototype:
  ! void GEMV(const char TRANS, const int M, const int N, const float ALPHA, const float * A, const int LDA, const float * X, const float BETA, float * Y, const int INCX = 1, const int INCY = 1) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_GEMV_Float ( CT_Epetra_BLAS_ID_t selfID, const char TRANS, const int M, const int N, const float ALPHA, const float * A, const int LDA, const float * X, const float BETA, float * Y, const int INCX, const int INCY );

  subroutine Epetra_BLAS_GEMV_Float ( selfID, TRANS, M, N, ALPHA, A, LDA, X, BETA, Y, INCX, &
        INCY ) bind(C,name='Epetra_BLAS_GEMV_Float')
    import :: FT_Epetra_BLAS_ID_t ,c_char ,c_int ,c_float
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)   ,value              :: TRANS
    integer(c_int)              ,intent(in)   ,value              :: M
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)   ,value              :: ALPHA
    real(c_float)               ,intent(in)         ,dimension(*) :: A
    integer(c_int)              ,intent(in)   ,value              :: LDA
    real(c_float)               ,intent(in)         ,dimension(*) :: X
    real(c_float)               ,intent(in)   ,value              :: BETA
    real(c_float)                                   ,dimension(*) :: Y
    integer(c_int)              ,intent(in)   ,value              :: INCX
    integer(c_int)              ,intent(in)   ,value              :: INCY
  end subroutine


  ! Original C++ prototype:
  ! void GEMV(const char TRANS, const int M, const int N, const double ALPHA, const double * A, const int LDA, const double * X, const double BETA, double * Y, const int INCX = 1, const int INCY = 1) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_GEMV_Double ( CT_Epetra_BLAS_ID_t selfID, const char TRANS, const int M, const int N, const double ALPHA, const double * A, const int LDA, const double * X, const double BETA, double * Y, const int INCX, const int INCY );

  subroutine Epetra_BLAS_GEMV_Double ( selfID, TRANS, M, N, ALPHA, A, LDA, X, BETA, Y, INCX, &
        INCY ) bind(C,name='Epetra_BLAS_GEMV_Double')
    import :: FT_Epetra_BLAS_ID_t ,c_char ,c_int ,c_double
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)   ,value              :: TRANS
    integer(c_int)              ,intent(in)   ,value              :: M
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)   ,value              :: ALPHA
    real(c_double)              ,intent(in)         ,dimension(*) :: A
    integer(c_int)              ,intent(in)   ,value              :: LDA
    real(c_double)              ,intent(in)         ,dimension(*) :: X
    real(c_double)              ,intent(in)   ,value              :: BETA
    real(c_double)                                  ,dimension(*) :: Y
    integer(c_int)              ,intent(in)   ,value              :: INCX
    integer(c_int)              ,intent(in)   ,value              :: INCY
  end subroutine


  ! Original C++ prototype:
  ! void GEMM(const char TRANSA, const char TRANSB, const int M, const int N, const int K, const float ALPHA, const float * A, const int LDA, const float * B, const int LDB, const float BETA, float * C, const int LDC) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_GEMM_Float ( CT_Epetra_BLAS_ID_t selfID, const char TRANSA, const char TRANSB, const int M, const int N, const int K, const float ALPHA, const float * A, const int LDA, const float * B, const int LDB, const float BETA, float * C, const int LDC );

  subroutine Epetra_BLAS_GEMM_Float ( selfID, TRANSA, TRANSB, M, N, K, ALPHA, A, LDA, B, &
        LDB, BETA, C, LDC ) bind(C,name='Epetra_BLAS_GEMM_Float')
    import :: FT_Epetra_BLAS_ID_t ,c_char ,c_int ,c_float
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)   ,value              :: TRANSA
    character(kind=c_char)      ,intent(in)   ,value              :: TRANSB
    integer(c_int)              ,intent(in)   ,value              :: M
    integer(c_int)              ,intent(in)   ,value              :: N
    integer(c_int)              ,intent(in)   ,value              :: K
    real(c_float)               ,intent(in)   ,value              :: ALPHA
    real(c_float)               ,intent(in)         ,dimension(*) :: A
    integer(c_int)              ,intent(in)   ,value              :: LDA
    real(c_float)               ,intent(in)         ,dimension(*) :: B
    integer(c_int)              ,intent(in)   ,value              :: LDB
    real(c_float)               ,intent(in)   ,value              :: BETA
    real(c_float)                                   ,dimension(*) :: C
    integer(c_int)              ,intent(in)   ,value              :: LDC
  end subroutine


  ! Original C++ prototype:
  ! void GEMM(const char TRANSA, const char TRANSB, const int M, const int N, const int K, const double ALPHA, const double * A, const int LDA, const double * B, const int LDB, const double BETA, double * C, const int LDC) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_GEMM_Double ( CT_Epetra_BLAS_ID_t selfID, const char TRANSA, const char TRANSB, const int M, const int N, const int K, const double ALPHA, const double * A, const int LDA, const double * B, const int LDB, const double BETA, double * C, const int LDC );

  subroutine Epetra_BLAS_GEMM_Double ( selfID, TRANSA, TRANSB, M, N, K, ALPHA, A, LDA, B, &
        LDB, BETA, C, LDC ) bind(C,name='Epetra_BLAS_GEMM_Double')
    import :: FT_Epetra_BLAS_ID_t ,c_char ,c_int ,c_double
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)   ,value              :: TRANSA
    character(kind=c_char)      ,intent(in)   ,value              :: TRANSB
    integer(c_int)              ,intent(in)   ,value              :: M
    integer(c_int)              ,intent(in)   ,value              :: N
    integer(c_int)              ,intent(in)   ,value              :: K
    real(c_double)              ,intent(in)   ,value              :: ALPHA
    real(c_double)              ,intent(in)         ,dimension(*) :: A
    integer(c_int)              ,intent(in)   ,value              :: LDA
    real(c_double)              ,intent(in)         ,dimension(*) :: B
    integer(c_int)              ,intent(in)   ,value              :: LDB
    real(c_double)              ,intent(in)   ,value              :: BETA
    real(c_double)                                  ,dimension(*) :: C
    integer(c_int)              ,intent(in)   ,value              :: LDC
  end subroutine


  ! Original C++ prototype:
  ! void SYMM(const char SIDE, const char UPLO, const int M, const int N, const float ALPHA, const float * A, const int LDA, const float * B, const int LDB, const float BETA, float * C, const int LDC) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_SYMM_Float ( CT_Epetra_BLAS_ID_t selfID, const char SIDE, const char UPLO, const int M, const int N, const float ALPHA, const float * A, const int LDA, const float * B, const int LDB, const float BETA, float * C, const int LDC );

  subroutine Epetra_BLAS_SYMM_Float ( selfID, SIDE, UPLO, M, N, ALPHA, A, LDA, B, LDB, BETA, &
        C, LDC ) bind(C,name='Epetra_BLAS_SYMM_Float')
    import :: FT_Epetra_BLAS_ID_t ,c_char ,c_int ,c_float
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)   ,value              :: SIDE
    character(kind=c_char)      ,intent(in)   ,value              :: UPLO
    integer(c_int)              ,intent(in)   ,value              :: M
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)   ,value              :: ALPHA
    real(c_float)               ,intent(in)         ,dimension(*) :: A
    integer(c_int)              ,intent(in)   ,value              :: LDA
    real(c_float)               ,intent(in)         ,dimension(*) :: B
    integer(c_int)              ,intent(in)   ,value              :: LDB
    real(c_float)               ,intent(in)   ,value              :: BETA
    real(c_float)                                   ,dimension(*) :: C
    integer(c_int)              ,intent(in)   ,value              :: LDC
  end subroutine


  ! Original C++ prototype:
  ! void SYMM(const char SIDE, const char UPLO, const int M, const int N, const double ALPHA, const double * A, const int LDA, const double * B, const int LDB, const double BETA, double * C, const int LDC) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_SYMM_Double ( CT_Epetra_BLAS_ID_t selfID, const char SIDE, const char UPLO, const int M, const int N, const double ALPHA, const double * A, const int LDA, const double * B, const int LDB, const double BETA, double * C, const int LDC );

  subroutine Epetra_BLAS_SYMM_Double ( selfID, SIDE, UPLO, M, N, ALPHA, A, LDA, B, LDB, &
        BETA, C, LDC ) bind(C,name='Epetra_BLAS_SYMM_Double')
    import :: FT_Epetra_BLAS_ID_t ,c_char ,c_int ,c_double
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)   ,value              :: SIDE
    character(kind=c_char)      ,intent(in)   ,value              :: UPLO
    integer(c_int)              ,intent(in)   ,value              :: M
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)   ,value              :: ALPHA
    real(c_double)              ,intent(in)         ,dimension(*) :: A
    integer(c_int)              ,intent(in)   ,value              :: LDA
    real(c_double)              ,intent(in)         ,dimension(*) :: B
    integer(c_int)              ,intent(in)   ,value              :: LDB
    real(c_double)              ,intent(in)   ,value              :: BETA
    real(c_double)                                  ,dimension(*) :: C
    integer(c_int)              ,intent(in)   ,value              :: LDC
  end subroutine


  ! Original C++ prototype:
  ! void TRMM(const char SIDE, const char UPLO, const char TRANSA, const char DIAG, const int M, const int N, const float ALPHA, const float * A, const int LDA, float * B, const int LDB) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_TRMM_Float ( CT_Epetra_BLAS_ID_t selfID, const char SIDE, const char UPLO, const char TRANSA, const char DIAG, const int M, const int N, const float ALPHA, const float * A, const int LDA, float * B, const int LDB );

  subroutine Epetra_BLAS_TRMM_Float ( selfID, SIDE, UPLO, TRANSA, DIAG, M, N, ALPHA, A, LDA, &
        B, LDB ) bind(C,name='Epetra_BLAS_TRMM_Float')
    import :: FT_Epetra_BLAS_ID_t ,c_char ,c_int ,c_float
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)   ,value              :: SIDE
    character(kind=c_char)      ,intent(in)   ,value              :: UPLO
    character(kind=c_char)      ,intent(in)   ,value              :: TRANSA
    character(kind=c_char)      ,intent(in)   ,value              :: DIAG
    integer(c_int)              ,intent(in)   ,value              :: M
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_float)               ,intent(in)   ,value              :: ALPHA
    real(c_float)               ,intent(in)         ,dimension(*) :: A
    integer(c_int)              ,intent(in)   ,value              :: LDA
    real(c_float)                                   ,dimension(*) :: B
    integer(c_int)              ,intent(in)   ,value              :: LDB
  end subroutine


  ! Original C++ prototype:
  ! void TRMM(const char SIDE, const char UPLO, const char TRANSA, const char DIAG, const int M, const int N, const double ALPHA, const double * A, const int LDA, double * B, const int LDB) const;
  ! CTrilinos prototype:
  ! void Epetra_BLAS_TRMM_Double ( CT_Epetra_BLAS_ID_t selfID, const char SIDE, const char UPLO, const char TRANSA, const char DIAG, const int M, const int N, const double ALPHA, const double * A, const int LDA, double * B, const int LDB );

  subroutine Epetra_BLAS_TRMM_Double ( selfID, SIDE, UPLO, TRANSA, DIAG, M, N, ALPHA, A, &
        LDA, B, LDB ) bind(C,name='Epetra_BLAS_TRMM_Double')
    import :: FT_Epetra_BLAS_ID_t ,c_char ,c_int ,c_double
    implicit none
    type(FT_Epetra_BLAS_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)   ,value              :: SIDE
    character(kind=c_char)      ,intent(in)   ,value              :: UPLO
    character(kind=c_char)      ,intent(in)   ,value              :: TRANSA
    character(kind=c_char)      ,intent(in)   ,value              :: DIAG
    integer(c_int)              ,intent(in)   ,value              :: M
    integer(c_int)              ,intent(in)   ,value              :: N
    real(c_double)              ,intent(in)   ,value              :: ALPHA
    real(c_double)              ,intent(in)         ,dimension(*) :: A
    integer(c_int)              ,intent(in)   ,value              :: LDA
    real(c_double)                                  ,dimension(*) :: B
    integer(c_int)              ,intent(in)   ,value              :: LDB
  end subroutine


  ! _________________ Epetra_Comm interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_Comm_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Comm_ID_t) function Epetra_Comm_Cast ( id ) &
        bind(C,name='Epetra_Comm_Cast')
    import :: FT_Epetra_Comm_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Comm_Abstract ( CT_Epetra_Comm_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Comm_Abstract ( id ) &
        bind(C,name='Epetra_Comm_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! virtual Epetra_Comm * Clone() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_Comm_Clone ( CT_Epetra_Comm_ID_t selfID );

  type(FT_Epetra_Comm_ID_t) function Epetra_Comm_Clone ( selfID ) &
        bind(C,name='Epetra_Comm_Clone')
    import :: FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Comm();
  ! CTrilinos prototype:
  ! void Epetra_Comm_Destroy ( CT_Epetra_Comm_ID_t * selfID );

  subroutine Epetra_Comm_Destroy ( selfID ) bind(C,name='Epetra_Comm_Destroy')
    import :: FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)                                     :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual void Barrier() const = 0;
  ! CTrilinos prototype:
  ! void Epetra_Comm_Barrier ( CT_Epetra_Comm_ID_t selfID );

  subroutine Epetra_Comm_Barrier ( selfID ) bind(C,name='Epetra_Comm_Barrier')
    import :: FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual int Broadcast(double * MyVals, int Count, int Root) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_Broadcast_Double ( CT_Epetra_Comm_ID_t selfID, double * MyVals, int Count, int Root );

  integer(c_int) function Epetra_Comm_Broadcast_Double ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_Comm_Broadcast_Double')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_double
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: MyVals
    integer(c_int)              ,intent(in)   ,value              :: Count
    integer(c_int)              ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! virtual int Broadcast(int * MyVals, int Count, int Root) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_Broadcast_Int ( CT_Epetra_Comm_ID_t selfID, int * MyVals, int Count, int Root );

  integer(c_int) function Epetra_Comm_Broadcast_Int ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_Comm_Broadcast_Int')
    import :: c_int ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: MyVals
    integer(c_int)              ,intent(in)   ,value              :: Count
    integer(c_int)              ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! virtual int Broadcast(long * MyVals, int Count, int Root) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_Broadcast_Long ( CT_Epetra_Comm_ID_t selfID, long * MyVals, int Count, int Root );

  integer(c_int) function Epetra_Comm_Broadcast_Long ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_Comm_Broadcast_Long')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_long
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: MyVals
    integer(c_int)              ,intent(in)   ,value              :: Count
    integer(c_int)              ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! virtual int Broadcast(char * MyVals, int Count, int Root) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_Broadcast_Char ( CT_Epetra_Comm_ID_t selfID, char * MyVals, int Count, int Root );

  integer(c_int) function Epetra_Comm_Broadcast_Char ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_Comm_Broadcast_Char')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_char
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    character(kind=c_char)                          ,dimension(*) :: MyVals
    integer(c_int)              ,intent(in)   ,value              :: Count
    integer(c_int)              ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! virtual int GatherAll(double * MyVals, double * AllVals, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_GatherAll_Double ( CT_Epetra_Comm_ID_t selfID, double * MyVals, double * AllVals, int Count );

  integer(c_int) function Epetra_Comm_GatherAll_Double ( selfID, MyVals, AllVals, Count ) &
        bind(C,name='Epetra_Comm_GatherAll_Double')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_double
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: MyVals
    real(c_double)                                  ,dimension(*) :: AllVals
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int GatherAll(int * MyVals, int * AllVals, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_GatherAll_Int ( CT_Epetra_Comm_ID_t selfID, int * MyVals, int * AllVals, int Count );

  integer(c_int) function Epetra_Comm_GatherAll_Int ( selfID, MyVals, AllVals, Count ) &
        bind(C,name='Epetra_Comm_GatherAll_Int')
    import :: c_int ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: MyVals
    integer(c_int)                                  ,dimension(*) :: AllVals
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int GatherAll(long * MyVals, long * AllVals, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_GatherAll_Long ( CT_Epetra_Comm_ID_t selfID, long * MyVals, long * AllVals, int Count );

  integer(c_int) function Epetra_Comm_GatherAll_Long ( selfID, MyVals, AllVals, Count ) &
        bind(C,name='Epetra_Comm_GatherAll_Long')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_long
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: MyVals
    integer(c_long)                                 ,dimension(*) :: AllVals
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int SumAll(double * PartialSums, double * GlobalSums, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_SumAll_Double ( CT_Epetra_Comm_ID_t selfID, double * PartialSums, double * GlobalSums, int Count );

  integer(c_int) function Epetra_Comm_SumAll_Double ( selfID, PartialSums, GlobalSums, &
        Count ) bind(C,name='Epetra_Comm_SumAll_Double')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_double
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: PartialSums
    real(c_double)                                  ,dimension(*) :: GlobalSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int SumAll(int * PartialSums, int * GlobalSums, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_SumAll_Int ( CT_Epetra_Comm_ID_t selfID, int * PartialSums, int * GlobalSums, int Count );

  integer(c_int) function Epetra_Comm_SumAll_Int ( selfID, PartialSums, GlobalSums, Count ) &
        bind(C,name='Epetra_Comm_SumAll_Int')
    import :: c_int ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: PartialSums
    integer(c_int)                                  ,dimension(*) :: GlobalSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int SumAll(long * PartialSums, long * GlobalSums, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_SumAll_Long ( CT_Epetra_Comm_ID_t selfID, long * PartialSums, long * GlobalSums, int Count );

  integer(c_int) function Epetra_Comm_SumAll_Long ( selfID, PartialSums, GlobalSums, Count ) &
        bind(C,name='Epetra_Comm_SumAll_Long')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_long
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: PartialSums
    integer(c_long)                                 ,dimension(*) :: GlobalSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int MaxAll(double * PartialMaxs, double * GlobalMaxs, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_MaxAll_Double ( CT_Epetra_Comm_ID_t selfID, double * PartialMaxs, double * GlobalMaxs, int Count );

  integer(c_int) function Epetra_Comm_MaxAll_Double ( selfID, PartialMaxs, GlobalMaxs, &
        Count ) bind(C,name='Epetra_Comm_MaxAll_Double')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_double
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: PartialMaxs
    real(c_double)                                  ,dimension(*) :: GlobalMaxs
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int MaxAll(int * PartialMaxs, int * GlobalMaxs, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_MaxAll_Int ( CT_Epetra_Comm_ID_t selfID, int * PartialMaxs, int * GlobalMaxs, int Count );

  integer(c_int) function Epetra_Comm_MaxAll_Int ( selfID, PartialMaxs, GlobalMaxs, Count ) &
        bind(C,name='Epetra_Comm_MaxAll_Int')
    import :: c_int ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: PartialMaxs
    integer(c_int)                                  ,dimension(*) :: GlobalMaxs
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int MaxAll(long * PartialMaxs, long * GlobalMaxs, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_MaxAll_Long ( CT_Epetra_Comm_ID_t selfID, long * PartialMaxs, long * GlobalMaxs, int Count );

  integer(c_int) function Epetra_Comm_MaxAll_Long ( selfID, PartialMaxs, GlobalMaxs, Count ) &
        bind(C,name='Epetra_Comm_MaxAll_Long')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_long
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: PartialMaxs
    integer(c_long)                                 ,dimension(*) :: GlobalMaxs
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int MinAll(double * PartialMins, double * GlobalMins, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_MinAll_Double ( CT_Epetra_Comm_ID_t selfID, double * PartialMins, double * GlobalMins, int Count );

  integer(c_int) function Epetra_Comm_MinAll_Double ( selfID, PartialMins, GlobalMins, &
        Count ) bind(C,name='Epetra_Comm_MinAll_Double')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_double
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: PartialMins
    real(c_double)                                  ,dimension(*) :: GlobalMins
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int MinAll(int * PartialMins, int * GlobalMins, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_MinAll_Int ( CT_Epetra_Comm_ID_t selfID, int * PartialMins, int * GlobalMins, int Count );

  integer(c_int) function Epetra_Comm_MinAll_Int ( selfID, PartialMins, GlobalMins, Count ) &
        bind(C,name='Epetra_Comm_MinAll_Int')
    import :: c_int ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: PartialMins
    integer(c_int)                                  ,dimension(*) :: GlobalMins
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int MinAll(long * PartialMins, long * GlobalMins, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_MinAll_Long ( CT_Epetra_Comm_ID_t selfID, long * PartialMins, long * GlobalMins, int Count );

  integer(c_int) function Epetra_Comm_MinAll_Long ( selfID, PartialMins, GlobalMins, Count ) &
        bind(C,name='Epetra_Comm_MinAll_Long')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_long
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: PartialMins
    integer(c_long)                                 ,dimension(*) :: GlobalMins
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int ScanSum(double * MyVals, double * ScanSums, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_ScanSum_Double ( CT_Epetra_Comm_ID_t selfID, double * MyVals, double * ScanSums, int Count );

  integer(c_int) function Epetra_Comm_ScanSum_Double ( selfID, MyVals, ScanSums, Count ) &
        bind(C,name='Epetra_Comm_ScanSum_Double')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_double
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: MyVals
    real(c_double)                                  ,dimension(*) :: ScanSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int ScanSum(int * MyVals, int * ScanSums, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_ScanSum_Int ( CT_Epetra_Comm_ID_t selfID, int * MyVals, int * ScanSums, int Count );

  integer(c_int) function Epetra_Comm_ScanSum_Int ( selfID, MyVals, ScanSums, Count ) &
        bind(C,name='Epetra_Comm_ScanSum_Int')
    import :: c_int ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: MyVals
    integer(c_int)                                  ,dimension(*) :: ScanSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int ScanSum(long * MyVals, long * ScanSums, int Count) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_ScanSum_Long ( CT_Epetra_Comm_ID_t selfID, long * MyVals, long * ScanSums, int Count );

  integer(c_int) function Epetra_Comm_ScanSum_Long ( selfID, MyVals, ScanSums, Count ) &
        bind(C,name='Epetra_Comm_ScanSum_Long')
    import :: c_int ,FT_Epetra_Comm_ID_t ,c_long
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: MyVals
    integer(c_long)                                 ,dimension(*) :: ScanSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! virtual int MyPID() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_MyPID ( CT_Epetra_Comm_ID_t selfID );

  integer(c_int) function Epetra_Comm_MyPID ( selfID ) bind(C,name='Epetra_Comm_MyPID')
    import :: c_int ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumProc() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Comm_NumProc ( CT_Epetra_Comm_ID_t selfID );

  integer(c_int) function Epetra_Comm_NumProc ( selfID ) bind(C,name='Epetra_Comm_NumProc')
    import :: c_int ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual Epetra_Distributor * CreateDistributor() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Distributor_ID_t Epetra_Comm_CreateDistributor ( CT_Epetra_Comm_ID_t selfID );

  type(FT_Epetra_Distributor_ID_t) function Epetra_Comm_CreateDistributor ( selfID ) &
        bind(C,name='Epetra_Comm_CreateDistributor')
    import :: FT_Epetra_Distributor_ID_t ,FT_Epetra_Comm_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual Epetra_Directory * CreateDirectory(const Epetra_BlockMap & Map) const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Directory_ID_t Epetra_Comm_CreateDirectory ( CT_Epetra_Comm_ID_t selfID, CT_Epetra_BlockMap_ID_t MapID );

  type(FT_Epetra_Directory_ID_t) function Epetra_Comm_CreateDirectory ( selfID, MapID ) &
        bind(C,name='Epetra_Comm_CreateDirectory')
    import :: FT_Epetra_Directory_ID_t ,FT_Epetra_Comm_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: MapID
  end function


  ! _________________ Epetra_Operator interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Operator_ID_t Epetra_Operator_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Operator_ID_t) function Epetra_Operator_Cast ( id ) &
        bind(C,name='Epetra_Operator_Cast')
    import :: FT_Epetra_Operator_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Operator_Abstract ( CT_Epetra_Operator_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Operator_Abstract ( id ) &
        bind(C,name='Epetra_Operator_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Operator();
  ! CTrilinos prototype:
  ! void Epetra_Operator_Destroy ( CT_Epetra_Operator_ID_t * selfID );

  subroutine Epetra_Operator_Destroy ( selfID ) bind(C,name='Epetra_Operator_Destroy')
    import :: FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual int SetUseTranspose(bool UseTranspose) = 0;
  ! CTrilinos prototype:
  ! int Epetra_Operator_SetUseTranspose ( CT_Epetra_Operator_ID_t selfID, boolean UseTranspose );

  integer(c_int) function Epetra_Operator_SetUseTranspose ( selfID, UseTranspose ) &
        bind(C,name='Epetra_Operator_SetUseTranspose')
    import :: c_int ,FT_Epetra_Operator_ID_t ,c_bool
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)              ,intent(in)   ,value              :: UseTranspose
  end function


  ! Original C++ prototype:
  ! virtual int Apply(const Epetra_MultiVector& X, Epetra_MultiVector& Y) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Operator_Apply ( CT_Epetra_Operator_ID_t selfID, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_Operator_Apply ( selfID, XID, YID ) &
        bind(C,name='Epetra_Operator_Apply')
    import :: c_int ,FT_Epetra_Operator_ID_t ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! virtual int ApplyInverse(const Epetra_MultiVector& X, Epetra_MultiVector& Y) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Operator_ApplyInverse ( CT_Epetra_Operator_ID_t selfID, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_Operator_ApplyInverse ( selfID, XID, YID ) &
        bind(C,name='Epetra_Operator_ApplyInverse')
    import :: c_int ,FT_Epetra_Operator_ID_t ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! virtual double NormInf() const = 0;
  ! CTrilinos prototype:
  ! double Epetra_Operator_NormInf ( CT_Epetra_Operator_ID_t selfID );

  real(c_double) function Epetra_Operator_NormInf ( selfID ) &
        bind(C,name='Epetra_Operator_NormInf')
    import :: c_double ,FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual const char * Label() const = 0;
  ! CTrilinos prototype:
  ! const char * Epetra_Operator_Label ( CT_Epetra_Operator_ID_t selfID );

  type(c_ptr) function Epetra_Operator_Label ( selfID ) &
        bind(C,name='Epetra_Operator_Label')
    import :: c_ptr ,FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual bool UseTranspose() const = 0;
  ! CTrilinos prototype:
  ! boolean Epetra_Operator_UseTranspose ( CT_Epetra_Operator_ID_t selfID );

  logical(c_bool) function Epetra_Operator_UseTranspose ( selfID ) &
        bind(C,name='Epetra_Operator_UseTranspose')
    import :: c_bool ,FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual bool HasNormInf() const = 0;
  ! CTrilinos prototype:
  ! boolean Epetra_Operator_HasNormInf ( CT_Epetra_Operator_ID_t selfID );

  logical(c_bool) function Epetra_Operator_HasNormInf ( selfID ) &
        bind(C,name='Epetra_Operator_HasNormInf')
    import :: c_bool ,FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual const Epetra_Comm & Comm() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_Operator_Comm ( CT_Epetra_Operator_ID_t selfID );

  type(FT_Epetra_Comm_ID_t) function Epetra_Operator_Comm ( selfID ) &
        bind(C,name='Epetra_Operator_Comm')
    import :: FT_Epetra_Comm_ID_t ,FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual const Epetra_Map & OperatorDomainMap() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_Operator_OperatorDomainMap ( CT_Epetra_Operator_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_Operator_OperatorDomainMap ( selfID ) &
        bind(C,name='Epetra_Operator_OperatorDomainMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual const Epetra_Map & OperatorRangeMap() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_Operator_OperatorRangeMap ( CT_Epetra_Operator_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_Operator_OperatorRangeMap ( selfID ) &
        bind(C,name='Epetra_Operator_OperatorRangeMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_Operator_ID_t
    implicit none
    type(FT_Epetra_Operator_ID_t),intent(in)   ,value              :: selfID
  end function


  ! _________________ Epetra_MultiVector interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_MultiVector_ID_t Epetra_MultiVector_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_MultiVector_ID_t) function Epetra_MultiVector_Cast ( id ) &
        bind(C,name='Epetra_MultiVector_Cast')
    import :: FT_Epetra_MultiVector_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t)   ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_MultiVector_Abstract ( CT_Epetra_MultiVector_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_MultiVector_Abstract ( id ) &
        bind(C,name='Epetra_MultiVector_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_MultiVector(const Epetra_BlockMap& Map, int NumVectors, bool zeroOut = true);
  ! CTrilinos prototype:
  ! CT_Epetra_MultiVector_ID_t Epetra_MultiVector_Create ( CT_Epetra_BlockMap_ID_t MapID, int NumVectors, boolean zeroOut );

  type(FT_Epetra_MultiVector_ID_t) function Epetra_MultiVector_Create ( MapID, NumVectors, &
        zeroOut ) bind(C,name='Epetra_MultiVector_Create')
    import :: FT_Epetra_MultiVector_ID_t ,FT_Epetra_BlockMap_ID_t ,c_int ,c_bool
    implicit none
    type(FT_Epetra_BlockMap_ID_t)   ,intent(in)   ,value              :: MapID
    integer(c_int)                  ,intent(in)   ,value              :: NumVectors
    logical(c_bool)                 ,intent(in)   ,value              :: zeroOut
  end function


  ! Original C++ prototype:
  ! Epetra_MultiVector(const Epetra_MultiVector& Source);
  ! CTrilinos prototype:
  ! CT_Epetra_MultiVector_ID_t Epetra_MultiVector_Duplicate ( CT_Epetra_MultiVector_ID_t SourceID );

  type(FT_Epetra_MultiVector_ID_t) function Epetra_MultiVector_Duplicate ( SourceID ) &
        bind(C,name='Epetra_MultiVector_Duplicate')
    import :: FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: SourceID
  end function


  ! Original C++ prototype:
  ! Epetra_MultiVector(Epetra_DataAccess CV, const Epetra_BlockMap& Map, double *A, int MyLDA, int NumVectors);
  ! CTrilinos prototype:
  ! CT_Epetra_MultiVector_ID_t Epetra_MultiVector_Create_From2DA ( Epetra_DataAccess CV, CT_Epetra_BlockMap_ID_t MapID, double * A, int MyLDA, int NumVectors );

  type(FT_Epetra_MultiVector_ID_t) function Epetra_MultiVector_Create_From2DA ( CV, MapID, &
        A, MyLDA, NumVectors ) bind(C,name='Epetra_MultiVector_Create_From2DA')
    import :: FT_Epetra_MultiVector_ID_t ,FT_Epetra_DataAccess_E_t , &
          FT_Epetra_BlockMap_ID_t ,c_double ,c_int
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_BlockMap_ID_t)   ,intent(in)   ,value              :: MapID
    real(c_double)                                      ,dimension(*) :: A
    integer(c_int)                  ,intent(in)   ,value              :: MyLDA
    integer(c_int)                  ,intent(in)   ,value              :: NumVectors
  end function


  ! Original C++ prototype:
  ! Epetra_MultiVector(Epetra_DataAccess CV, const Epetra_BlockMap& Map, double **ArrayOfPointers, int NumVectors);
  ! CTrilinos prototype:
  ! CT_Epetra_MultiVector_ID_t Epetra_MultiVector_Create_FromAOP ( Epetra_DataAccess CV, CT_Epetra_BlockMap_ID_t MapID, double ** ArrayOfPointers, int NumVectors );

  type(FT_Epetra_MultiVector_ID_t) function Epetra_MultiVector_Create_FromAOP ( CV, MapID, &
        ArrayOfPointers, NumVectors ) bind(C,name='Epetra_MultiVector_Create_FromAOP')
    import :: FT_Epetra_MultiVector_ID_t ,FT_Epetra_DataAccess_E_t , &
          FT_Epetra_BlockMap_ID_t ,c_double ,c_int
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_BlockMap_ID_t)   ,intent(in)   ,value              :: MapID
    real(c_double)                                      ,dimension(*) :: ArrayOfPointers
    integer(c_int)                  ,intent(in)   ,value              :: NumVectors
  end function


  ! Original C++ prototype:
  ! Epetra_MultiVector(Epetra_DataAccess CV, const Epetra_MultiVector& Source, int *Indices, int NumVectors);
  ! CTrilinos prototype:
  ! CT_Epetra_MultiVector_ID_t Epetra_MultiVector_Create_FromList ( Epetra_DataAccess CV, CT_Epetra_MultiVector_ID_t SourceID, int * Indices, int NumVectors );

  type(FT_Epetra_MultiVector_ID_t) function Epetra_MultiVector_Create_FromList ( CV, &
        SourceID, Indices, NumVectors ) bind(C,name='Epetra_MultiVector_Create_FromList')
    import :: FT_Epetra_MultiVector_ID_t ,FT_Epetra_DataAccess_E_t ,c_int
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: SourceID
    integer(c_int)                                      ,dimension(*) :: Indices
    integer(c_int)                  ,intent(in)   ,value              :: NumVectors
  end function


  ! Original C++ prototype:
  ! Epetra_MultiVector(Epetra_DataAccess CV, const Epetra_MultiVector& Source, int StartIndex, int NumVectors);
  ! CTrilinos prototype:
  ! CT_Epetra_MultiVector_ID_t Epetra_MultiVector_Create_FromRange ( Epetra_DataAccess CV, CT_Epetra_MultiVector_ID_t SourceID, int StartIndex, int NumVectors );

  type(FT_Epetra_MultiVector_ID_t) function Epetra_MultiVector_Create_FromRange ( CV, &
        SourceID, StartIndex, NumVectors ) &
        bind(C,name='Epetra_MultiVector_Create_FromRange')
    import :: FT_Epetra_MultiVector_ID_t ,FT_Epetra_DataAccess_E_t ,c_int
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: SourceID
    integer(c_int)                  ,intent(in)   ,value              :: StartIndex
    integer(c_int)                  ,intent(in)   ,value              :: NumVectors
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_MultiVector();
  ! CTrilinos prototype:
  ! void Epetra_MultiVector_Destroy ( CT_Epetra_MultiVector_ID_t * selfID );

  subroutine Epetra_MultiVector_Destroy ( selfID ) &
        bind(C,name='Epetra_MultiVector_Destroy')
    import :: FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int ReplaceGlobalValue(int GlobalRow, int VectorIndex, double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ReplaceGlobalValue ( CT_Epetra_MultiVector_ID_t selfID, int GlobalRow, int VectorIndex, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_ReplaceGlobalValue ( selfID, GlobalRow, &
        VectorIndex, ScalarValue ) bind(C,name='Epetra_MultiVector_ReplaceGlobalValue')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                  ,intent(in)   ,value              :: VectorIndex
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int ReplaceGlobalValue(int GlobalBlockRow, int BlockRowOffset, int VectorIndex, double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ReplaceGlobalValue_BlockPos ( CT_Epetra_MultiVector_ID_t selfID, int GlobalBlockRow, int BlockRowOffset, int VectorIndex, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_ReplaceGlobalValue_BlockPos ( selfID, &
        GlobalBlockRow, BlockRowOffset, VectorIndex, ScalarValue ) &
        bind(C,name='Epetra_MultiVector_ReplaceGlobalValue_BlockPos')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: GlobalBlockRow
    integer(c_int)                  ,intent(in)   ,value              :: BlockRowOffset
    integer(c_int)                  ,intent(in)   ,value              :: VectorIndex
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int SumIntoGlobalValue(int GlobalRow, int VectorIndex, double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_SumIntoGlobalValue ( CT_Epetra_MultiVector_ID_t selfID, int GlobalRow, int VectorIndex, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_SumIntoGlobalValue ( selfID, GlobalRow, &
        VectorIndex, ScalarValue ) bind(C,name='Epetra_MultiVector_SumIntoGlobalValue')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                  ,intent(in)   ,value              :: VectorIndex
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int SumIntoGlobalValue(int GlobalBlockRow, int BlockRowOffset, int VectorIndex, double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_SumIntoGlobalValue_BlockPos ( CT_Epetra_MultiVector_ID_t selfID, int GlobalBlockRow, int BlockRowOffset, int VectorIndex, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_SumIntoGlobalValue_BlockPos ( selfID, &
        GlobalBlockRow, BlockRowOffset, VectorIndex, ScalarValue ) &
        bind(C,name='Epetra_MultiVector_SumIntoGlobalValue_BlockPos')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: GlobalBlockRow
    integer(c_int)                  ,intent(in)   ,value              :: BlockRowOffset
    integer(c_int)                  ,intent(in)   ,value              :: VectorIndex
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int ReplaceMyValue(int MyRow, int VectorIndex, double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ReplaceMyValue ( CT_Epetra_MultiVector_ID_t selfID, int MyRow, int VectorIndex, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_ReplaceMyValue ( selfID, MyRow, VectorIndex, &
        ScalarValue ) bind(C,name='Epetra_MultiVector_ReplaceMyValue')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: MyRow
    integer(c_int)                  ,intent(in)   ,value              :: VectorIndex
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int ReplaceMyValue(int MyBlockRow, int BlockRowOffset, int VectorIndex, double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ReplaceMyValue_BlockPos ( CT_Epetra_MultiVector_ID_t selfID, int MyBlockRow, int BlockRowOffset, int VectorIndex, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_ReplaceMyValue_BlockPos ( selfID, MyBlockRow, &
        BlockRowOffset, VectorIndex, ScalarValue ) &
        bind(C,name='Epetra_MultiVector_ReplaceMyValue_BlockPos')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: MyBlockRow
    integer(c_int)                  ,intent(in)   ,value              :: BlockRowOffset
    integer(c_int)                  ,intent(in)   ,value              :: VectorIndex
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int SumIntoMyValue(int MyRow, int VectorIndex, double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_SumIntoMyValue ( CT_Epetra_MultiVector_ID_t selfID, int MyRow, int VectorIndex, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_SumIntoMyValue ( selfID, MyRow, VectorIndex, &
        ScalarValue ) bind(C,name='Epetra_MultiVector_SumIntoMyValue')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: MyRow
    integer(c_int)                  ,intent(in)   ,value              :: VectorIndex
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int SumIntoMyValue(int MyBlockRow, int BlockRowOffset, int VectorIndex, double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_SumIntoMyValue_BlockPos ( CT_Epetra_MultiVector_ID_t selfID, int MyBlockRow, int BlockRowOffset, int VectorIndex, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_SumIntoMyValue_BlockPos ( selfID, MyBlockRow, &
        BlockRowOffset, VectorIndex, ScalarValue ) &
        bind(C,name='Epetra_MultiVector_SumIntoMyValue_BlockPos')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: MyBlockRow
    integer(c_int)                  ,intent(in)   ,value              :: BlockRowOffset
    integer(c_int)                  ,intent(in)   ,value              :: VectorIndex
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int PutScalar (double ScalarConstant);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_PutScalar ( CT_Epetra_MultiVector_ID_t selfID, double ScalarConstant );

  integer(c_int) function Epetra_MultiVector_PutScalar ( selfID, ScalarConstant ) &
        bind(C,name='Epetra_MultiVector_PutScalar')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                  ,intent(in)   ,value              :: ScalarConstant
  end function


  ! Original C++ prototype:
  ! int Random();
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Random ( CT_Epetra_MultiVector_ID_t selfID );

  integer(c_int) function Epetra_MultiVector_Random ( selfID ) &
        bind(C,name='Epetra_MultiVector_Random')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ExtractCopy(double *A, int MyLDA) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ExtractCopy_Fill2DA ( CT_Epetra_MultiVector_ID_t selfID, double * A, int MyLDA );

  integer(c_int) function Epetra_MultiVector_ExtractCopy_Fill2DA ( selfID, A, MyLDA ) &
        bind(C,name='Epetra_MultiVector_ExtractCopy_Fill2DA')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: A
    integer(c_int)                  ,intent(in)   ,value              :: MyLDA
  end function


  ! Original C++ prototype:
  ! int ExtractCopy(double **ArrayOfPointers) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ExtractCopy_FillAOP ( CT_Epetra_MultiVector_ID_t selfID, double ** ArrayOfPointers );

  integer(c_int) function Epetra_MultiVector_ExtractCopy_FillAOP ( selfID, ArrayOfPointers ) &
        bind(C,name='Epetra_MultiVector_ExtractCopy_FillAOP')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: ArrayOfPointers
  end function


  ! Original C++ prototype:
  ! int ExtractView(double **A, int *MyLDA) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ExtractView_Set2DA ( CT_Epetra_MultiVector_ID_t selfID, double ** A, int * MyLDA );

  integer(c_int) function Epetra_MultiVector_ExtractView_Set2DA ( selfID, A, MyLDA ) &
        bind(C,name='Epetra_MultiVector_ExtractView_Set2DA')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: A
    integer(c_int)                                      ,dimension(*) :: MyLDA
  end function


  ! Original C++ prototype:
  ! int ExtractView(double ***ArrayOfPointers) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ExtractView_SetAOP ( CT_Epetra_MultiVector_ID_t selfID, double *** ArrayOfPointers );

  integer(c_int) function Epetra_MultiVector_ExtractView_SetAOP ( selfID, ArrayOfPointers ) &
        bind(C,name='Epetra_MultiVector_ExtractView_SetAOP')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: ArrayOfPointers
  end function


  ! Original C++ prototype:
  ! int Dot(const Epetra_MultiVector& A, double *Result) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Dot ( CT_Epetra_MultiVector_ID_t selfID, CT_Epetra_MultiVector_ID_t AID, double * Result );

  integer(c_int) function Epetra_MultiVector_Dot ( selfID, AID, Result ) &
        bind(C,name='Epetra_MultiVector_Dot')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
    real(c_double)                                      ,dimension(*) :: Result
  end function


  ! Original C++ prototype:
  ! int Abs(const Epetra_MultiVector& A);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Abs ( CT_Epetra_MultiVector_ID_t selfID, CT_Epetra_MultiVector_ID_t AID );

  integer(c_int) function Epetra_MultiVector_Abs ( selfID, AID ) &
        bind(C,name='Epetra_MultiVector_Abs')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
  end function


  ! Original C++ prototype:
  ! int Reciprocal(const Epetra_MultiVector& A);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Reciprocal ( CT_Epetra_MultiVector_ID_t selfID, CT_Epetra_MultiVector_ID_t AID );

  integer(c_int) function Epetra_MultiVector_Reciprocal ( selfID, AID ) &
        bind(C,name='Epetra_MultiVector_Reciprocal')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
  end function


  ! Original C++ prototype:
  ! int Scale(double ScalarValue);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Scale_Self ( CT_Epetra_MultiVector_ID_t selfID, double ScalarValue );

  integer(c_int) function Epetra_MultiVector_Scale_Self ( selfID, ScalarValue ) &
        bind(C,name='Epetra_MultiVector_Scale_Self')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                  ,intent(in)   ,value              :: ScalarValue
  end function


  ! Original C++ prototype:
  ! int Scale(double ScalarA, const Epetra_MultiVector& A);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Scale ( CT_Epetra_MultiVector_ID_t selfID, double ScalarA, CT_Epetra_MultiVector_ID_t AID );

  integer(c_int) function Epetra_MultiVector_Scale ( selfID, ScalarA, AID ) &
        bind(C,name='Epetra_MultiVector_Scale')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                  ,intent(in)   ,value              :: ScalarA
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
  end function


  ! Original C++ prototype:
  ! int Update(double ScalarA, const Epetra_MultiVector& A, double ScalarThis);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Update_WithA ( CT_Epetra_MultiVector_ID_t selfID, double ScalarA, CT_Epetra_MultiVector_ID_t AID, double ScalarThis );

  integer(c_int) function Epetra_MultiVector_Update_WithA ( selfID, ScalarA, AID, &
        ScalarThis ) bind(C,name='Epetra_MultiVector_Update_WithA')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                  ,intent(in)   ,value              :: ScalarA
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
    real(c_double)                  ,intent(in)   ,value              :: ScalarThis
  end function


  ! Original C++ prototype:
  ! int Update(double ScalarA, const Epetra_MultiVector& A, double ScalarB, const Epetra_MultiVector& B, double ScalarThis);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Update_WithAB ( CT_Epetra_MultiVector_ID_t selfID, double ScalarA, CT_Epetra_MultiVector_ID_t AID, double ScalarB, CT_Epetra_MultiVector_ID_t BID, double ScalarThis );

  integer(c_int) function Epetra_MultiVector_Update_WithAB ( selfID, ScalarA, AID, ScalarB, &
        BID, ScalarThis ) bind(C,name='Epetra_MultiVector_Update_WithAB')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                  ,intent(in)   ,value              :: ScalarA
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
    real(c_double)                  ,intent(in)   ,value              :: ScalarB
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: BID
    real(c_double)                  ,intent(in)   ,value              :: ScalarThis
  end function


  ! Original C++ prototype:
  ! int Norm1 (double * Result) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Norm1 ( CT_Epetra_MultiVector_ID_t selfID, double * Result );

  integer(c_int) function Epetra_MultiVector_Norm1 ( selfID, Result ) &
        bind(C,name='Epetra_MultiVector_Norm1')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: Result
  end function


  ! Original C++ prototype:
  ! int Norm2 (double * Result) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Norm2 ( CT_Epetra_MultiVector_ID_t selfID, double * Result );

  integer(c_int) function Epetra_MultiVector_Norm2 ( selfID, Result ) &
        bind(C,name='Epetra_MultiVector_Norm2')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: Result
  end function


  ! Original C++ prototype:
  ! int NormInf (double * Result) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_NormInf ( CT_Epetra_MultiVector_ID_t selfID, double * Result );

  integer(c_int) function Epetra_MultiVector_NormInf ( selfID, Result ) &
        bind(C,name='Epetra_MultiVector_NormInf')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: Result
  end function


  ! Original C++ prototype:
  ! int NormWeighted (const Epetra_MultiVector& Weights, double * Result) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_NormWeighted ( CT_Epetra_MultiVector_ID_t selfID, CT_Epetra_MultiVector_ID_t WeightsID, double * Result );

  integer(c_int) function Epetra_MultiVector_NormWeighted ( selfID, WeightsID, Result ) &
        bind(C,name='Epetra_MultiVector_NormWeighted')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: WeightsID
    real(c_double)                                      ,dimension(*) :: Result
  end function


  ! Original C++ prototype:
  ! int MinValue (double * Result) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_MinValue ( CT_Epetra_MultiVector_ID_t selfID, double * Result );

  integer(c_int) function Epetra_MultiVector_MinValue ( selfID, Result ) &
        bind(C,name='Epetra_MultiVector_MinValue')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: Result
  end function


  ! Original C++ prototype:
  ! int MaxValue (double * Result) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_MaxValue ( CT_Epetra_MultiVector_ID_t selfID, double * Result );

  integer(c_int) function Epetra_MultiVector_MaxValue ( selfID, Result ) &
        bind(C,name='Epetra_MultiVector_MaxValue')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: Result
  end function


  ! Original C++ prototype:
  ! int MeanValue (double * Result) const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_MeanValue ( CT_Epetra_MultiVector_ID_t selfID, double * Result );

  integer(c_int) function Epetra_MultiVector_MeanValue ( selfID, Result ) &
        bind(C,name='Epetra_MultiVector_MeanValue')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                      ,dimension(*) :: Result
  end function


  ! Original C++ prototype:
  ! int Multiply(char TransA, char TransB, double ScalarAB, const Epetra_MultiVector& A, const Epetra_MultiVector& B, double ScalarThis );
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Multiply_Matrix ( CT_Epetra_MultiVector_ID_t selfID, char TransA, char TransB, double ScalarAB, CT_Epetra_MultiVector_ID_t AID, CT_Epetra_MultiVector_ID_t BID, double ScalarThis );

  integer(c_int) function Epetra_MultiVector_Multiply_Matrix ( selfID, TransA, TransB, &
        ScalarAB, AID, BID, ScalarThis ) bind(C,name='Epetra_MultiVector_Multiply_Matrix')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_char ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)          ,intent(in)   ,value              :: TransA
    character(kind=c_char)          ,intent(in)   ,value              :: TransB
    real(c_double)                  ,intent(in)   ,value              :: ScalarAB
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: BID
    real(c_double)                  ,intent(in)   ,value              :: ScalarThis
  end function


  ! Original C++ prototype:
  ! int Multiply(double ScalarAB, const Epetra_MultiVector& A, const Epetra_MultiVector& B, double ScalarThis );
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Multiply_ByEl ( CT_Epetra_MultiVector_ID_t selfID, double ScalarAB, CT_Epetra_MultiVector_ID_t AID, CT_Epetra_MultiVector_ID_t BID, double ScalarThis );

  integer(c_int) function Epetra_MultiVector_Multiply_ByEl ( selfID, ScalarAB, AID, BID, &
        ScalarThis ) bind(C,name='Epetra_MultiVector_Multiply_ByEl')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                  ,intent(in)   ,value              :: ScalarAB
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: BID
    real(c_double)                  ,intent(in)   ,value              :: ScalarThis
  end function


  ! Original C++ prototype:
  ! int ReciprocalMultiply(double ScalarAB, const Epetra_MultiVector& A, const Epetra_MultiVector& B, double ScalarThis );
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ReciprocalMultiply ( CT_Epetra_MultiVector_ID_t selfID, double ScalarAB, CT_Epetra_MultiVector_ID_t AID, CT_Epetra_MultiVector_ID_t BID, double ScalarThis );

  integer(c_int) function Epetra_MultiVector_ReciprocalMultiply ( selfID, ScalarAB, AID, &
        BID, ScalarThis ) bind(C,name='Epetra_MultiVector_ReciprocalMultiply')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,c_double
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                  ,intent(in)   ,value              :: ScalarAB
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: AID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: BID
    real(c_double)                  ,intent(in)   ,value              :: ScalarThis
  end function


  ! Original C++ prototype:
  ! int SetSeed(unsigned int Seed_in);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_SetSeed ( CT_Epetra_MultiVector_ID_t selfID, unsigned int Seed_in );

  integer(c_int) function Epetra_MultiVector_SetSeed ( selfID, Seed_in ) &
        bind(C,name='Epetra_MultiVector_SetSeed')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: Seed_in
  end function


  ! Original C++ prototype:
  ! unsigned int Seed();
  ! CTrilinos prototype:
  ! unsigned int Epetra_MultiVector_Seed ( CT_Epetra_MultiVector_ID_t selfID );

  integer(c_int) function Epetra_MultiVector_Seed ( selfID ) &
        bind(C,name='Epetra_MultiVector_Seed')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_MultiVector& operator = (const Epetra_MultiVector& Source);
  ! CTrilinos prototype:
  ! void Epetra_MultiVector_Assign ( CT_Epetra_MultiVector_ID_t selfID, CT_Epetra_MultiVector_ID_t SourceID );

  subroutine Epetra_MultiVector_Assign ( selfID, SourceID ) &
        bind(C,name='Epetra_MultiVector_Assign')
    import :: FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: SourceID
  end subroutine


  ! Original C++ prototype:
  ! double * const & operator [] (int i) const;
  ! CTrilinos prototype:
  ! double * Epetra_MultiVector_getArray ( CT_Epetra_MultiVector_ID_t selfID, int i );

  type(c_ptr) function Epetra_MultiVector_getArray ( selfID, i ) &
        bind(C,name='Epetra_MultiVector_getArray')
    import :: c_ptr ,FT_Epetra_MultiVector_ID_t ,c_int
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: i
  end function


  ! Original C++ prototype:
  ! const Epetra_Vector * & operator () (int i) const;
  ! CTrilinos prototype:
  ! CT_Epetra_Vector_ID_t Epetra_MultiVector_getVector ( CT_Epetra_MultiVector_ID_t selfID, int i );

  type(FT_Epetra_Vector_ID_t) function Epetra_MultiVector_getVector ( selfID, i ) &
        bind(C,name='Epetra_MultiVector_getVector')
    import :: FT_Epetra_Vector_ID_t ,FT_Epetra_MultiVector_ID_t ,c_int
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                  ,intent(in)   ,value              :: i
  end function


  ! Original C++ prototype:
  ! int NumVectors() const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_NumVectors ( CT_Epetra_MultiVector_ID_t selfID );

  integer(c_int) function Epetra_MultiVector_NumVectors ( selfID ) &
        bind(C,name='Epetra_MultiVector_NumVectors')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MyLength() const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_MyLength ( CT_Epetra_MultiVector_ID_t selfID );

  integer(c_int) function Epetra_MultiVector_MyLength ( selfID ) &
        bind(C,name='Epetra_MultiVector_MyLength')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int GlobalLength() const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_GlobalLength ( CT_Epetra_MultiVector_ID_t selfID );

  integer(c_int) function Epetra_MultiVector_GlobalLength ( selfID ) &
        bind(C,name='Epetra_MultiVector_GlobalLength')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int Stride() const;
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_Stride ( CT_Epetra_MultiVector_ID_t selfID );

  integer(c_int) function Epetra_MultiVector_Stride ( selfID ) &
        bind(C,name='Epetra_MultiVector_Stride')
    import :: c_int ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool ConstantStride() const;
  ! CTrilinos prototype:
  ! boolean Epetra_MultiVector_ConstantStride ( CT_Epetra_MultiVector_ID_t selfID );

  logical(c_bool) function Epetra_MultiVector_ConstantStride ( selfID ) &
        bind(C,name='Epetra_MultiVector_ConstantStride')
    import :: c_bool ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ReplaceMap(const Epetra_BlockMap& map);
  ! CTrilinos prototype:
  ! int Epetra_MultiVector_ReplaceMap ( CT_Epetra_MultiVector_ID_t selfID, CT_Epetra_BlockMap_ID_t mapID );

  integer(c_int) function Epetra_MultiVector_ReplaceMap ( selfID, mapID ) &
        bind(C,name='Epetra_MultiVector_ReplaceMap')
    import :: c_int ,FT_Epetra_MultiVector_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t)   ,intent(in)   ,value              :: mapID
  end function


  ! _________________ Epetra_OffsetIndex interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_OffsetIndex_ID_t Epetra_OffsetIndex_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_OffsetIndex_ID_t) function Epetra_OffsetIndex_Cast ( id ) &
        bind(C,name='Epetra_OffsetIndex_Cast')
    import :: FT_Epetra_OffsetIndex_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t)   ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_OffsetIndex_Abstract ( CT_Epetra_OffsetIndex_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_OffsetIndex_Abstract ( id ) &
        bind(C,name='Epetra_OffsetIndex_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_OffsetIndex( const Epetra_CrsGraph & SourceGraph, const Epetra_CrsGraph & TargetGraph, Epetra_Import & Importer );
  ! CTrilinos prototype:
  ! CT_Epetra_OffsetIndex_ID_t Epetra_OffsetIndex_Create_FromImporter ( CT_Epetra_CrsGraph_ID_t SourceGraphID, CT_Epetra_CrsGraph_ID_t TargetGraphID, CT_Epetra_Import_ID_t ImporterID );

  type(FT_Epetra_OffsetIndex_ID_t) function Epetra_OffsetIndex_Create_FromImporter ( &
        SourceGraphID, TargetGraphID, ImporterID ) &
        bind(C,name='Epetra_OffsetIndex_Create_FromImporter')
    import :: FT_Epetra_OffsetIndex_ID_t ,FT_Epetra_CrsGraph_ID_t ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t)   ,intent(in)   ,value              :: SourceGraphID
    type(FT_Epetra_CrsGraph_ID_t)   ,intent(in)   ,value              :: TargetGraphID
    type(FT_Epetra_Import_ID_t)     ,intent(in)   ,value              :: ImporterID
  end function


  ! Original C++ prototype:
  ! Epetra_OffsetIndex( const Epetra_CrsGraph & SourceGraph, const Epetra_CrsGraph & TargetGraph, Epetra_Export & Exporter );
  ! CTrilinos prototype:
  ! CT_Epetra_OffsetIndex_ID_t Epetra_OffsetIndex_Create_FromExporter ( CT_Epetra_CrsGraph_ID_t SourceGraphID, CT_Epetra_CrsGraph_ID_t TargetGraphID, CT_Epetra_Export_ID_t ExporterID );

  type(FT_Epetra_OffsetIndex_ID_t) function Epetra_OffsetIndex_Create_FromExporter ( &
        SourceGraphID, TargetGraphID, ExporterID ) &
        bind(C,name='Epetra_OffsetIndex_Create_FromExporter')
    import :: FT_Epetra_OffsetIndex_ID_t ,FT_Epetra_CrsGraph_ID_t ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t)   ,intent(in)   ,value              :: SourceGraphID
    type(FT_Epetra_CrsGraph_ID_t)   ,intent(in)   ,value              :: TargetGraphID
    type(FT_Epetra_Export_ID_t)     ,intent(in)   ,value              :: ExporterID
  end function


  ! Original C++ prototype:
  ! Epetra_OffsetIndex(const Epetra_OffsetIndex & Indexor);
  ! CTrilinos prototype:
  ! CT_Epetra_OffsetIndex_ID_t Epetra_OffsetIndex_Duplicate ( CT_Epetra_OffsetIndex_ID_t IndexorID );

  type(FT_Epetra_OffsetIndex_ID_t) function Epetra_OffsetIndex_Duplicate ( IndexorID ) &
        bind(C,name='Epetra_OffsetIndex_Duplicate')
    import :: FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: IndexorID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_OffsetIndex(void);
  ! CTrilinos prototype:
  ! void Epetra_OffsetIndex_Destroy ( CT_Epetra_OffsetIndex_ID_t * selfID );

  subroutine Epetra_OffsetIndex_Destroy ( selfID ) &
        bind(C,name='Epetra_OffsetIndex_Destroy')
    import :: FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_OffsetIndex_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int ** SameOffsets() const;
  ! CTrilinos prototype:
  ! int ** Epetra_OffsetIndex_SameOffsets ( CT_Epetra_OffsetIndex_ID_t selfID );

  type(c_ptr) function Epetra_OffsetIndex_SameOffsets ( selfID ) &
        bind(C,name='Epetra_OffsetIndex_SameOffsets')
    import :: c_ptr ,FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ** PermuteOffsets() const;
  ! CTrilinos prototype:
  ! int ** Epetra_OffsetIndex_PermuteOffsets ( CT_Epetra_OffsetIndex_ID_t selfID );

  type(c_ptr) function Epetra_OffsetIndex_PermuteOffsets ( selfID ) &
        bind(C,name='Epetra_OffsetIndex_PermuteOffsets')
    import :: c_ptr ,FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ** RemoteOffsets() const;
  ! CTrilinos prototype:
  ! int ** Epetra_OffsetIndex_RemoteOffsets ( CT_Epetra_OffsetIndex_ID_t selfID );

  type(c_ptr) function Epetra_OffsetIndex_RemoteOffsets ( selfID ) &
        bind(C,name='Epetra_OffsetIndex_RemoteOffsets')
    import :: c_ptr ,FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: selfID
  end function


  ! _________________ Epetra_Object interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Object_ID_t Epetra_Object_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Object_ID_t) function Epetra_Object_Cast ( id ) &
        bind(C,name='Epetra_Object_Cast')
    import :: FT_Epetra_Object_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Object_Abstract ( CT_Epetra_Object_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Object_Abstract ( id ) &
        bind(C,name='Epetra_Object_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Object_ID_t
    implicit none
    type(FT_Epetra_Object_ID_t) ,intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_Object(int TracebackModeIn = -1, bool set_label = true);
  ! CTrilinos prototype:
  ! CT_Epetra_Object_ID_t Epetra_Object_Create ( int TracebackModeIn, boolean set_label );

  type(FT_Epetra_Object_ID_t) function Epetra_Object_Create ( TracebackModeIn, set_label ) &
        bind(C,name='Epetra_Object_Create')
    import :: FT_Epetra_Object_ID_t ,c_int ,c_bool
    implicit none
    integer(c_int)              ,intent(in)   ,value              :: TracebackModeIn
    logical(c_bool)             ,intent(in)   ,value              :: set_label
  end function


  ! Original C++ prototype:
  ! Epetra_Object(const char * const Label, int TracebackModeIn = -1);
  ! CTrilinos prototype:
  ! CT_Epetra_Object_ID_t Epetra_Object_Create_WithLabel ( const char * const Label, int TracebackModeIn );

  type(FT_Epetra_Object_ID_t) function Epetra_Object_Create_WithLabel ( Label, &
        TracebackModeIn ) bind(C,name='Epetra_Object_Create_WithLabel')
    import :: FT_Epetra_Object_ID_t ,c_char ,c_int
    implicit none
    character(kind=c_char)      ,intent(in)         ,dimension(*) :: Label
    integer(c_int)              ,intent(in)   ,value              :: TracebackModeIn
  end function


  ! Original C++ prototype:
  ! Epetra_Object(const Epetra_Object& Object);
  ! CTrilinos prototype:
  ! CT_Epetra_Object_ID_t Epetra_Object_Duplicate ( CT_Epetra_Object_ID_t ObjectID );

  type(FT_Epetra_Object_ID_t) function Epetra_Object_Duplicate ( ObjectID ) &
        bind(C,name='Epetra_Object_Duplicate')
    import :: FT_Epetra_Object_ID_t
    implicit none
    type(FT_Epetra_Object_ID_t) ,intent(in)   ,value              :: ObjectID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Object();
  ! CTrilinos prototype:
  ! void Epetra_Object_Destroy ( CT_Epetra_Object_ID_t * selfID );

  subroutine Epetra_Object_Destroy ( selfID ) bind(C,name='Epetra_Object_Destroy')
    import :: FT_Epetra_Object_ID_t
    implicit none
    type(FT_Epetra_Object_ID_t)                                   :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual void SetLabel(const char * const Label);
  ! CTrilinos prototype:
  ! void Epetra_Object_SetLabel ( CT_Epetra_Object_ID_t selfID, const char * const Label );

  subroutine Epetra_Object_SetLabel ( selfID, Label ) bind(C,name='Epetra_Object_SetLabel')
    import :: FT_Epetra_Object_ID_t ,c_char
    implicit none
    type(FT_Epetra_Object_ID_t) ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)         ,dimension(*) :: Label
  end subroutine


  ! Original C++ prototype:
  ! virtual const char * Label() const;
  ! CTrilinos prototype:
  ! const char * Epetra_Object_Label ( CT_Epetra_Object_ID_t selfID );

  type(c_ptr) function Epetra_Object_Label ( selfID ) bind(C,name='Epetra_Object_Label')
    import :: c_ptr ,FT_Epetra_Object_ID_t
    implicit none
    type(FT_Epetra_Object_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int ReportError(const string Message, int ErrorCode) const;
  ! CTrilinos prototype:
  ! int Epetra_Object_ReportError ( CT_Epetra_Object_ID_t selfID, const char * const Message, int ErrorCode );

  integer(c_int) function Epetra_Object_ReportError ( selfID, Message, ErrorCode ) &
        bind(C,name='Epetra_Object_ReportError')
    import :: c_int ,FT_Epetra_Object_ID_t ,c_char
    implicit none
    type(FT_Epetra_Object_ID_t) ,intent(in)   ,value              :: selfID
    character(kind=c_char)      ,intent(in)         ,dimension(*) :: Message
    integer(c_int)              ,intent(in)   ,value              :: ErrorCode
  end function


  ! _________________ Epetra_RowMatrix interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_RowMatrix_ID_t Epetra_RowMatrix_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_RowMatrix_ID_t) function Epetra_RowMatrix_Cast ( id ) &
        bind(C,name='Epetra_RowMatrix_Cast')
    import :: FT_Epetra_RowMatrix_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t) ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_RowMatrix_Abstract ( CT_Epetra_RowMatrix_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_RowMatrix_Abstract ( id ) &
        bind(C,name='Epetra_RowMatrix_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_RowMatrix();
  ! CTrilinos prototype:
  ! void Epetra_RowMatrix_Destroy ( CT_Epetra_RowMatrix_ID_t * selfID );

  subroutine Epetra_RowMatrix_Destroy ( selfID ) bind(C,name='Epetra_RowMatrix_Destroy')
    import :: FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual int NumMyRowEntries(int MyRow, int & NumEntries) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumMyRowEntries ( CT_Epetra_RowMatrix_ID_t selfID, int MyRow, int * NumEntries );

  integer(c_int) function Epetra_RowMatrix_NumMyRowEntries ( selfID, MyRow, NumEntries ) &
        bind(C,name='Epetra_RowMatrix_NumMyRowEntries')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(inout)                    :: NumEntries
  end function


  ! Original C++ prototype:
  ! virtual int MaxNumEntries() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_MaxNumEntries ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_MaxNumEntries ( selfID ) &
        bind(C,name='Epetra_RowMatrix_MaxNumEntries')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int ExtractMyRowCopy(int MyRow, int Length, int & NumEntries, double *Values, int * Indices) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_ExtractMyRowCopy ( CT_Epetra_RowMatrix_ID_t selfID, int MyRow, int Length, int * NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_RowMatrix_ExtractMyRowCopy ( selfID, MyRow, Length, &
        NumEntries, Values, Indices ) bind(C,name='Epetra_RowMatrix_ExtractMyRowCopy')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(in)   ,value              :: Length
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! virtual int ExtractDiagonalCopy(Epetra_Vector & Diagonal) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_ExtractDiagonalCopy ( CT_Epetra_RowMatrix_ID_t selfID, CT_Epetra_Vector_ID_t DiagonalID );

  integer(c_int) function Epetra_RowMatrix_ExtractDiagonalCopy ( selfID, DiagonalID ) &
        bind(C,name='Epetra_RowMatrix_ExtractDiagonalCopy')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: DiagonalID
  end function


  ! Original C++ prototype:
  ! virtual int Multiply(bool TransA, const Epetra_MultiVector& X, Epetra_MultiVector& Y) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_Multiply ( CT_Epetra_RowMatrix_ID_t selfID, boolean TransA, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_RowMatrix_Multiply ( selfID, TransA, XID, YID ) &
        bind(C,name='Epetra_RowMatrix_Multiply')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t ,c_bool ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: TransA
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! virtual int Solve(bool Upper, bool Trans, bool UnitDiagonal, const Epetra_MultiVector& X, Epetra_MultiVector& Y) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_Solve ( CT_Epetra_RowMatrix_ID_t selfID, boolean Upper, boolean Trans, boolean UnitDiagonal, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_RowMatrix_Solve ( selfID, Upper, Trans, UnitDiagonal, XID, &
        YID ) bind(C,name='Epetra_RowMatrix_Solve')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t ,c_bool ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: Upper
    logical(c_bool)               ,intent(in)   ,value              :: Trans
    logical(c_bool)               ,intent(in)   ,value              :: UnitDiagonal
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! virtual int InvRowSums(Epetra_Vector& x) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_InvRowSums ( CT_Epetra_RowMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_RowMatrix_InvRowSums ( selfID, xID ) &
        bind(C,name='Epetra_RowMatrix_InvRowSums')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! virtual int LeftScale(const Epetra_Vector& x) = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_LeftScale ( CT_Epetra_RowMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_RowMatrix_LeftScale ( selfID, xID ) &
        bind(C,name='Epetra_RowMatrix_LeftScale')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! virtual int InvColSums(Epetra_Vector& x) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_InvColSums ( CT_Epetra_RowMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_RowMatrix_InvColSums ( selfID, xID ) &
        bind(C,name='Epetra_RowMatrix_InvColSums')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! virtual int RightScale(const Epetra_Vector& x) = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_RightScale ( CT_Epetra_RowMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_RowMatrix_RightScale ( selfID, xID ) &
        bind(C,name='Epetra_RowMatrix_RightScale')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! virtual bool Filled() const = 0;
  ! CTrilinos prototype:
  ! boolean Epetra_RowMatrix_Filled ( CT_Epetra_RowMatrix_ID_t selfID );

  logical(c_bool) function Epetra_RowMatrix_Filled ( selfID ) &
        bind(C,name='Epetra_RowMatrix_Filled')
    import :: c_bool ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual double NormInf() const = 0;
  ! CTrilinos prototype:
  ! double Epetra_RowMatrix_NormInf ( CT_Epetra_RowMatrix_ID_t selfID );

  real(c_double) function Epetra_RowMatrix_NormInf ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NormInf')
    import :: c_double ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual double NormOne() const = 0;
  ! CTrilinos prototype:
  ! double Epetra_RowMatrix_NormOne ( CT_Epetra_RowMatrix_ID_t selfID );

  real(c_double) function Epetra_RowMatrix_NormOne ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NormOne')
    import :: c_double ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumGlobalNonzeros() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumGlobalNonzeros ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_NumGlobalNonzeros ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NumGlobalNonzeros')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumGlobalRows() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumGlobalRows ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_NumGlobalRows ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NumGlobalRows')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumGlobalCols() const= 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumGlobalCols ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_NumGlobalCols ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NumGlobalCols')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumGlobalDiagonals() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumGlobalDiagonals ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_NumGlobalDiagonals ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NumGlobalDiagonals')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumMyNonzeros() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumMyNonzeros ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_NumMyNonzeros ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NumMyNonzeros')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumMyRows() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumMyRows ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_NumMyRows ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NumMyRows')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumMyCols() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumMyCols ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_NumMyCols ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NumMyCols')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual int NumMyDiagonals() const = 0;
  ! CTrilinos prototype:
  ! int Epetra_RowMatrix_NumMyDiagonals ( CT_Epetra_RowMatrix_ID_t selfID );

  integer(c_int) function Epetra_RowMatrix_NumMyDiagonals ( selfID ) &
        bind(C,name='Epetra_RowMatrix_NumMyDiagonals')
    import :: c_int ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual bool LowerTriangular() const = 0;
  ! CTrilinos prototype:
  ! boolean Epetra_RowMatrix_LowerTriangular ( CT_Epetra_RowMatrix_ID_t selfID );

  logical(c_bool) function Epetra_RowMatrix_LowerTriangular ( selfID ) &
        bind(C,name='Epetra_RowMatrix_LowerTriangular')
    import :: c_bool ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual bool UpperTriangular() const = 0;
  ! CTrilinos prototype:
  ! boolean Epetra_RowMatrix_UpperTriangular ( CT_Epetra_RowMatrix_ID_t selfID );

  logical(c_bool) function Epetra_RowMatrix_UpperTriangular ( selfID ) &
        bind(C,name='Epetra_RowMatrix_UpperTriangular')
    import :: c_bool ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual const Epetra_Map & RowMatrixRowMap() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_RowMatrix_RowMatrixRowMap ( CT_Epetra_RowMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_RowMatrix_RowMatrixRowMap ( selfID ) &
        bind(C,name='Epetra_RowMatrix_RowMatrixRowMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual const Epetra_Map & RowMatrixColMap() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_RowMatrix_RowMatrixColMap ( CT_Epetra_RowMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_RowMatrix_RowMatrixColMap ( selfID ) &
        bind(C,name='Epetra_RowMatrix_RowMatrixColMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual const Epetra_Import * RowMatrixImporter() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_Import_ID_t Epetra_RowMatrix_RowMatrixImporter ( CT_Epetra_RowMatrix_ID_t selfID );

  type(FT_Epetra_Import_ID_t) function Epetra_RowMatrix_RowMatrixImporter ( selfID ) &
        bind(C,name='Epetra_RowMatrix_RowMatrixImporter')
    import :: FT_Epetra_Import_ID_t ,FT_Epetra_RowMatrix_ID_t
    implicit none
    type(FT_Epetra_RowMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! _________________ Epetra_CompObject interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_CompObject_ID_t Epetra_CompObject_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_CompObject_ID_t) function Epetra_CompObject_Cast ( id ) &
        bind(C,name='Epetra_CompObject_Cast')
    import :: FT_Epetra_CompObject_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t)  ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_CompObject_Abstract ( CT_Epetra_CompObject_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_CompObject_Abstract ( id ) &
        bind(C,name='Epetra_CompObject_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_CompObject();
  ! CTrilinos prototype:
  ! CT_Epetra_CompObject_ID_t Epetra_CompObject_Create (  );

  type(FT_Epetra_CompObject_ID_t) function Epetra_CompObject_Create (  ) &
        bind(C,name='Epetra_CompObject_Create')
    import :: FT_Epetra_CompObject_ID_t
    implicit none
  end function


  ! Original C++ prototype:
  ! Epetra_CompObject(const Epetra_CompObject& Source);
  ! CTrilinos prototype:
  ! CT_Epetra_CompObject_ID_t Epetra_CompObject_Duplicate ( CT_Epetra_CompObject_ID_t SourceID );

  type(FT_Epetra_CompObject_ID_t) function Epetra_CompObject_Duplicate ( SourceID ) &
        bind(C,name='Epetra_CompObject_Duplicate')
    import :: FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: SourceID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_CompObject();
  ! CTrilinos prototype:
  ! void Epetra_CompObject_Destroy ( CT_Epetra_CompObject_ID_t * selfID );

  subroutine Epetra_CompObject_Destroy ( selfID ) bind(C,name='Epetra_CompObject_Destroy')
    import :: FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! void SetFlopCounter(const Epetra_Flops & FlopCounter_in);
  ! CTrilinos prototype:
  ! void Epetra_CompObject_SetFlopCounter ( CT_Epetra_CompObject_ID_t selfID, CT_Epetra_Flops_ID_t FlopCounter_inID );

  subroutine Epetra_CompObject_SetFlopCounter ( selfID, FlopCounter_inID ) &
        bind(C,name='Epetra_CompObject_SetFlopCounter')
    import :: FT_Epetra_CompObject_ID_t ,FT_Epetra_Flops_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Flops_ID_t)     ,intent(in)   ,value              :: FlopCounter_inID
  end subroutine


  ! Original C++ prototype:
  ! void SetFlopCounter(const Epetra_CompObject & CompObject);
  ! CTrilinos prototype:
  ! void Epetra_CompObject_SetFlopCounter_Matching ( CT_Epetra_CompObject_ID_t selfID, CT_Epetra_CompObject_ID_t CompObjectID );

  subroutine Epetra_CompObject_SetFlopCounter_Matching ( selfID, CompObjectID ) &
        bind(C,name='Epetra_CompObject_SetFlopCounter_Matching')
    import :: FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: CompObjectID
  end subroutine


  ! Original C++ prototype:
  ! void UnsetFlopCounter();
  ! CTrilinos prototype:
  ! void Epetra_CompObject_UnsetFlopCounter ( CT_Epetra_CompObject_ID_t selfID );

  subroutine Epetra_CompObject_UnsetFlopCounter ( selfID ) &
        bind(C,name='Epetra_CompObject_UnsetFlopCounter')
    import :: FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
  end subroutine


  ! Original C++ prototype:
  ! Epetra_Flops * GetFlopCounter() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Flops_ID_t Epetra_CompObject_GetFlopCounter ( CT_Epetra_CompObject_ID_t selfID );

  type(FT_Epetra_Flops_ID_t) function Epetra_CompObject_GetFlopCounter ( selfID ) &
        bind(C,name='Epetra_CompObject_GetFlopCounter')
    import :: FT_Epetra_Flops_ID_t ,FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! void ResetFlops() const;
  ! CTrilinos prototype:
  ! void Epetra_CompObject_ResetFlops ( CT_Epetra_CompObject_ID_t selfID );

  subroutine Epetra_CompObject_ResetFlops ( selfID ) &
        bind(C,name='Epetra_CompObject_ResetFlops')
    import :: FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
  end subroutine


  ! Original C++ prototype:
  ! double Flops() const;
  ! CTrilinos prototype:
  ! double Epetra_CompObject_Flops ( CT_Epetra_CompObject_ID_t selfID );

  real(c_double) function Epetra_CompObject_Flops ( selfID ) &
        bind(C,name='Epetra_CompObject_Flops')
    import :: c_double ,FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! void UpdateFlops(int Flops_in) const;
  ! CTrilinos prototype:
  ! void Epetra_CompObject_UpdateFlops_Int ( CT_Epetra_CompObject_ID_t selfID, int Flops_in );

  subroutine Epetra_CompObject_UpdateFlops_Int ( selfID, Flops_in ) &
        bind(C,name='Epetra_CompObject_UpdateFlops_Int')
    import :: FT_Epetra_CompObject_ID_t ,c_int
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                 ,intent(in)   ,value              :: Flops_in
  end subroutine


  ! Original C++ prototype:
  ! void UpdateFlops(long int Flops_in) const;
  ! CTrilinos prototype:
  ! void Epetra_CompObject_UpdateFlops_Long ( CT_Epetra_CompObject_ID_t selfID, long int Flops_in );

  subroutine Epetra_CompObject_UpdateFlops_Long ( selfID, Flops_in ) &
        bind(C,name='Epetra_CompObject_UpdateFlops_Long')
    import :: FT_Epetra_CompObject_ID_t ,c_int
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                 ,intent(in)   ,value              :: Flops_in
  end subroutine


  ! Original C++ prototype:
  ! void UpdateFlops(double Flops_in) const;
  ! CTrilinos prototype:
  ! void Epetra_CompObject_UpdateFlops_Double ( CT_Epetra_CompObject_ID_t selfID, double Flops_in );

  subroutine Epetra_CompObject_UpdateFlops_Double ( selfID, Flops_in ) &
        bind(C,name='Epetra_CompObject_UpdateFlops_Double')
    import :: FT_Epetra_CompObject_ID_t ,c_double
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                 ,intent(in)   ,value              :: Flops_in
  end subroutine


  ! Original C++ prototype:
  ! void UpdateFlops(float Flops_in) const;
  ! CTrilinos prototype:
  ! void Epetra_CompObject_UpdateFlops_Float ( CT_Epetra_CompObject_ID_t selfID, float Flops_in );

  subroutine Epetra_CompObject_UpdateFlops_Float ( selfID, Flops_in ) &
        bind(C,name='Epetra_CompObject_UpdateFlops_Float')
    import :: FT_Epetra_CompObject_ID_t ,c_float
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
    real(c_float)                  ,intent(in)   ,value              :: Flops_in
  end subroutine


  ! Original C++ prototype:
  ! Epetra_CompObject& operator=(const Epetra_CompObject& src);
  ! CTrilinos prototype:
  ! void Epetra_CompObject_Assign ( CT_Epetra_CompObject_ID_t selfID, CT_Epetra_CompObject_ID_t srcID );

  subroutine Epetra_CompObject_Assign ( selfID, srcID ) &
        bind(C,name='Epetra_CompObject_Assign')
    import :: FT_Epetra_CompObject_ID_t
    implicit none
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_CompObject_ID_t),intent(in)   ,value              :: srcID
  end subroutine


  ! _________________ Epetra_Directory interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Directory_ID_t Epetra_Directory_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Directory_ID_t) function Epetra_Directory_Cast ( id ) &
        bind(C,name='Epetra_Directory_Cast')
    import :: FT_Epetra_Directory_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t) ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Directory_Abstract ( CT_Epetra_Directory_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Directory_Abstract ( id ) &
        bind(C,name='Epetra_Directory_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Directory_ID_t
    implicit none
    type(FT_Epetra_Directory_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Directory();
  ! CTrilinos prototype:
  ! void Epetra_Directory_Destroy ( CT_Epetra_Directory_ID_t * selfID );

  subroutine Epetra_Directory_Destroy ( selfID ) bind(C,name='Epetra_Directory_Destroy')
    import :: FT_Epetra_Directory_ID_t
    implicit none
    type(FT_Epetra_Directory_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual int GetDirectoryEntries( const Epetra_BlockMap& Map, const int NumEntries, const int * GlobalEntries, int * Procs, int * LocalEntries, int * EntrySizes, bool high_rank_sharing_procs=false) const = 0;
  ! CTrilinos prototype:
  ! int Epetra_Directory_GetDirectoryEntries ( CT_Epetra_Directory_ID_t selfID, CT_Epetra_BlockMap_ID_t MapID, const int NumEntries, const int * GlobalEntries, int * Procs, int * LocalEntries, int * EntrySizes, boolean high_rank_sharing_procs );

  integer(c_int) function Epetra_Directory_GetDirectoryEntries ( selfID, MapID, NumEntries, &
        GlobalEntries, Procs, LocalEntries, EntrySizes, high_rank_sharing_procs ) &
        bind(C,name='Epetra_Directory_GetDirectoryEntries')
    import :: c_int ,FT_Epetra_Directory_ID_t ,FT_Epetra_BlockMap_ID_t ,c_bool
    implicit none
    type(FT_Epetra_Directory_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t) ,intent(in)   ,value              :: MapID
    integer(c_int)                ,intent(in)   ,value              :: NumEntries
    integer(c_int)                ,intent(in)         ,dimension(*) :: GlobalEntries
    integer(c_int)                                    ,dimension(*) :: Procs
    integer(c_int)                                    ,dimension(*) :: LocalEntries
    integer(c_int)                                    ,dimension(*) :: EntrySizes
    logical(c_bool)               ,intent(in)   ,value              :: high_rank_sharing_procs
  end function


  ! Original C++ prototype:
  ! virtual bool GIDsAllUniquelyOwned() const = 0;
  ! CTrilinos prototype:
  ! boolean Epetra_Directory_GIDsAllUniquelyOwned ( CT_Epetra_Directory_ID_t selfID );

  logical(c_bool) function Epetra_Directory_GIDsAllUniquelyOwned ( selfID ) &
        bind(C,name='Epetra_Directory_GIDsAllUniquelyOwned')
    import :: c_bool ,FT_Epetra_Directory_ID_t
    implicit none
    type(FT_Epetra_Directory_ID_t),intent(in)   ,value              :: selfID
  end function


  ! _________________ Epetra_Flops interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Flops_ID_t Epetra_Flops_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Flops_ID_t) function Epetra_Flops_Cast ( id ) &
        bind(C,name='Epetra_Flops_Cast')
    import :: FT_Epetra_Flops_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Flops_Abstract ( CT_Epetra_Flops_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Flops_Abstract ( id ) &
        bind(C,name='Epetra_Flops_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Flops_ID_t
    implicit none
    type(FT_Epetra_Flops_ID_t)  ,intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_Flops(void);
  ! CTrilinos prototype:
  ! CT_Epetra_Flops_ID_t Epetra_Flops_Create (  );

  type(FT_Epetra_Flops_ID_t) function Epetra_Flops_Create (  ) &
        bind(C,name='Epetra_Flops_Create')
    import :: FT_Epetra_Flops_ID_t
    implicit none
  end function


  ! Original C++ prototype:
  ! Epetra_Flops(const Epetra_Flops& Flops_in);
  ! CTrilinos prototype:
  ! CT_Epetra_Flops_ID_t Epetra_Flops_Duplicate ( CT_Epetra_Flops_ID_t Flops_inID );

  type(FT_Epetra_Flops_ID_t) function Epetra_Flops_Duplicate ( Flops_inID ) &
        bind(C,name='Epetra_Flops_Duplicate')
    import :: FT_Epetra_Flops_ID_t
    implicit none
    type(FT_Epetra_Flops_ID_t)  ,intent(in)   ,value              :: Flops_inID
  end function


  ! Original C++ prototype:
  ! double Flops() const;
  ! CTrilinos prototype:
  ! double Epetra_Flops_Flops ( CT_Epetra_Flops_ID_t selfID );

  real(c_double) function Epetra_Flops_Flops ( selfID ) bind(C,name='Epetra_Flops_Flops')
    import :: c_double ,FT_Epetra_Flops_ID_t
    implicit none
    type(FT_Epetra_Flops_ID_t)  ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! void ResetFlops();
  ! CTrilinos prototype:
  ! void Epetra_Flops_ResetFlops ( CT_Epetra_Flops_ID_t selfID );

  subroutine Epetra_Flops_ResetFlops ( selfID ) bind(C,name='Epetra_Flops_ResetFlops')
    import :: FT_Epetra_Flops_ID_t
    implicit none
    type(FT_Epetra_Flops_ID_t)  ,intent(in)   ,value              :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual ~Epetra_Flops(void);
  ! CTrilinos prototype:
  ! void Epetra_Flops_Destroy ( CT_Epetra_Flops_ID_t * selfID );

  subroutine Epetra_Flops_Destroy ( selfID ) bind(C,name='Epetra_Flops_Destroy')
    import :: FT_Epetra_Flops_ID_t
    implicit none
    type(FT_Epetra_Flops_ID_t)                                    :: selfID
  end subroutine


  ! Original C++ prototype:
  ! Epetra_Flops& operator=(const Epetra_Flops& src);
  ! CTrilinos prototype:
  ! void Epetra_Flops_Assign ( CT_Epetra_Flops_ID_t selfID, CT_Epetra_Flops_ID_t srcID );

  subroutine Epetra_Flops_Assign ( selfID, srcID ) bind(C,name='Epetra_Flops_Assign')
    import :: FT_Epetra_Flops_ID_t
    implicit none
    type(FT_Epetra_Flops_ID_t)  ,intent(in)   ,value              :: selfID
    type(FT_Epetra_Flops_ID_t)  ,intent(in)   ,value              :: srcID
  end subroutine


  ! _________________ Epetra_SrcDistObject interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_SrcDistObject_ID_t Epetra_SrcDistObject_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_SrcDistObject_ID_t) function Epetra_SrcDistObject_Cast ( id ) &
        bind(C,name='Epetra_SrcDistObject_Cast')
    import :: FT_Epetra_SrcDistObject_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t)     ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_SrcDistObject_Abstract ( CT_Epetra_SrcDistObject_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_SrcDistObject_Abstract ( id ) &
        bind(C,name='Epetra_SrcDistObject_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_SrcDistObject_ID_t
    implicit none
    type(FT_Epetra_SrcDistObject_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_SrcDistObject();
  ! CTrilinos prototype:
  ! void Epetra_SrcDistObject_Destroy ( CT_Epetra_SrcDistObject_ID_t * selfID );

  subroutine Epetra_SrcDistObject_Destroy ( selfID ) &
        bind(C,name='Epetra_SrcDistObject_Destroy')
    import :: FT_Epetra_SrcDistObject_ID_t
    implicit none
    type(FT_Epetra_SrcDistObject_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! virtual const Epetra_BlockMap & Map() const = 0;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_SrcDistObject_Map ( CT_Epetra_SrcDistObject_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_SrcDistObject_Map ( selfID ) &
        bind(C,name='Epetra_SrcDistObject_Map')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_SrcDistObject_ID_t
    implicit none
    type(FT_Epetra_SrcDistObject_ID_t),intent(in)   ,value              :: selfID
  end function


  ! _________________ Epetra_MpiComm interface bodies _________________





#ifdef HAVE_MPI


  ! CTrilinos prototype:
  ! CT_Epetra_MpiComm_ID_t Epetra_MpiComm_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_MpiComm_ID_t) function Epetra_MpiComm_Cast ( id ) &
        bind(C,name='Epetra_MpiComm_Cast')
    import :: FT_Epetra_MpiComm_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_MpiComm_Abstract ( CT_Epetra_MpiComm_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_MpiComm_Abstract ( id ) &
        bind(C,name='Epetra_MpiComm_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_MpiComm(MPI_Comm comm);
  ! CTrilinos prototype:
  ! CT_Epetra_MpiComm_ID_t Epetra_MpiComm_Create ( MPI_Comm comm );

  type(FT_Epetra_MpiComm_ID_t) function Epetra_MpiComm_Create ( comm ) &
        bind(C,name='Epetra_MpiComm_Create')
    import :: FT_Epetra_MpiComm_ID_t ,FT_MPI_Comm_E_t
    implicit none
    integer(FT_MPI_Comm_E_t)    ,intent(in)   ,value              :: comm
  end function


  ! Original C++ prototype:
  ! Epetra_MpiComm(const Epetra_MpiComm & Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_MpiComm_ID_t Epetra_MpiComm_Duplicate ( CT_Epetra_MpiComm_ID_t CommID );

  type(FT_Epetra_MpiComm_ID_t) function Epetra_MpiComm_Duplicate ( CommID ) &
        bind(C,name='Epetra_MpiComm_Duplicate')
    import :: FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_Comm * Clone() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_MpiComm_Clone ( CT_Epetra_MpiComm_ID_t selfID );

  type(FT_Epetra_Comm_ID_t) function Epetra_MpiComm_Clone ( selfID ) &
        bind(C,name='Epetra_MpiComm_Clone')
    import :: FT_Epetra_Comm_ID_t ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_MpiComm();
  ! CTrilinos prototype:
  ! void Epetra_MpiComm_Destroy ( CT_Epetra_MpiComm_ID_t * selfID );

  subroutine Epetra_MpiComm_Destroy ( selfID ) bind(C,name='Epetra_MpiComm_Destroy')
    import :: FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! void Barrier() const;
  ! CTrilinos prototype:
  ! void Epetra_MpiComm_Barrier ( CT_Epetra_MpiComm_ID_t selfID );

  subroutine Epetra_MpiComm_Barrier ( selfID ) bind(C,name='Epetra_MpiComm_Barrier')
    import :: FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int Broadcast(double * MyVals, int Count, int Root) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_Broadcast_Double ( CT_Epetra_MpiComm_ID_t selfID, double * MyVals, int Count, int Root );

  integer(c_int) function Epetra_MpiComm_Broadcast_Double ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_MpiComm_Broadcast_Double')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: MyVals
    integer(c_int)              ,intent(in)   ,value              :: Count
    integer(c_int)              ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! int Broadcast(int * MyVals, int Count, int Root) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_Broadcast_Int ( CT_Epetra_MpiComm_ID_t selfID, int * MyVals, int Count, int Root );

  integer(c_int) function Epetra_MpiComm_Broadcast_Int ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_MpiComm_Broadcast_Int')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: MyVals
    integer(c_int)              ,intent(in)   ,value              :: Count
    integer(c_int)              ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! int Broadcast(long * MyVals, int Count, int Root) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_Broadcast_Long ( CT_Epetra_MpiComm_ID_t selfID, long * MyVals, int Count, int Root );

  integer(c_int) function Epetra_MpiComm_Broadcast_Long ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_MpiComm_Broadcast_Long')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: MyVals
    integer(c_int)              ,intent(in)   ,value              :: Count
    integer(c_int)              ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! int Broadcast(char * MyVals, int Count, int Root) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_Broadcast_Char ( CT_Epetra_MpiComm_ID_t selfID, char * MyVals, int Count, int Root );

  integer(c_int) function Epetra_MpiComm_Broadcast_Char ( selfID, MyVals, Count, Root ) &
        bind(C,name='Epetra_MpiComm_Broadcast_Char')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_char
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    character(kind=c_char)                          ,dimension(*) :: MyVals
    integer(c_int)              ,intent(in)   ,value              :: Count
    integer(c_int)              ,intent(in)   ,value              :: Root
  end function


  ! Original C++ prototype:
  ! int GatherAll(double * MyVals, double * AllVals, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_GatherAll_Double ( CT_Epetra_MpiComm_ID_t selfID, double * MyVals, double * AllVals, int Count );

  integer(c_int) function Epetra_MpiComm_GatherAll_Double ( selfID, MyVals, AllVals, Count ) &
        bind(C,name='Epetra_MpiComm_GatherAll_Double')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: MyVals
    real(c_double)                                  ,dimension(*) :: AllVals
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int GatherAll(int * MyVals, int * AllVals, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_GatherAll_Int ( CT_Epetra_MpiComm_ID_t selfID, int * MyVals, int * AllVals, int Count );

  integer(c_int) function Epetra_MpiComm_GatherAll_Int ( selfID, MyVals, AllVals, Count ) &
        bind(C,name='Epetra_MpiComm_GatherAll_Int')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: MyVals
    integer(c_int)                                  ,dimension(*) :: AllVals
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int GatherAll(long * MyVals, long * AllVals, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_GatherAll_Long ( CT_Epetra_MpiComm_ID_t selfID, long * MyVals, long * AllVals, int Count );

  integer(c_int) function Epetra_MpiComm_GatherAll_Long ( selfID, MyVals, AllVals, Count ) &
        bind(C,name='Epetra_MpiComm_GatherAll_Long')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: MyVals
    integer(c_long)                                 ,dimension(*) :: AllVals
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int SumAll(double * PartialSums, double * GlobalSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_SumAll_Double ( CT_Epetra_MpiComm_ID_t selfID, double * PartialSums, double * GlobalSums, int Count );

  integer(c_int) function Epetra_MpiComm_SumAll_Double ( selfID, PartialSums, GlobalSums, &
        Count ) bind(C,name='Epetra_MpiComm_SumAll_Double')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: PartialSums
    real(c_double)                                  ,dimension(*) :: GlobalSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int SumAll(int * PartialSums, int * GlobalSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_SumAll_Int ( CT_Epetra_MpiComm_ID_t selfID, int * PartialSums, int * GlobalSums, int Count );

  integer(c_int) function Epetra_MpiComm_SumAll_Int ( selfID, PartialSums, GlobalSums, &
        Count ) bind(C,name='Epetra_MpiComm_SumAll_Int')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: PartialSums
    integer(c_int)                                  ,dimension(*) :: GlobalSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int SumAll(long * PartialSums, long * GlobalSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_SumAll_Long ( CT_Epetra_MpiComm_ID_t selfID, long * PartialSums, long * GlobalSums, int Count );

  integer(c_int) function Epetra_MpiComm_SumAll_Long ( selfID, PartialSums, GlobalSums, &
        Count ) bind(C,name='Epetra_MpiComm_SumAll_Long')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: PartialSums
    integer(c_long)                                 ,dimension(*) :: GlobalSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MaxAll(double * PartialMaxs, double * GlobalMaxs, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_MaxAll_Double ( CT_Epetra_MpiComm_ID_t selfID, double * PartialMaxs, double * GlobalMaxs, int Count );

  integer(c_int) function Epetra_MpiComm_MaxAll_Double ( selfID, PartialMaxs, GlobalMaxs, &
        Count ) bind(C,name='Epetra_MpiComm_MaxAll_Double')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: PartialMaxs
    real(c_double)                                  ,dimension(*) :: GlobalMaxs
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MaxAll(int * PartialMaxs, int * GlobalMaxs, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_MaxAll_Int ( CT_Epetra_MpiComm_ID_t selfID, int * PartialMaxs, int * GlobalMaxs, int Count );

  integer(c_int) function Epetra_MpiComm_MaxAll_Int ( selfID, PartialMaxs, GlobalMaxs, &
        Count ) bind(C,name='Epetra_MpiComm_MaxAll_Int')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: PartialMaxs
    integer(c_int)                                  ,dimension(*) :: GlobalMaxs
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MaxAll(long * PartialMaxs, long * GlobalMaxs, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_MaxAll_Long ( CT_Epetra_MpiComm_ID_t selfID, long * PartialMaxs, long * GlobalMaxs, int Count );

  integer(c_int) function Epetra_MpiComm_MaxAll_Long ( selfID, PartialMaxs, GlobalMaxs, &
        Count ) bind(C,name='Epetra_MpiComm_MaxAll_Long')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: PartialMaxs
    integer(c_long)                                 ,dimension(*) :: GlobalMaxs
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MinAll(double * PartialMins, double * GlobalMins, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_MinAll_Double ( CT_Epetra_MpiComm_ID_t selfID, double * PartialMins, double * GlobalMins, int Count );

  integer(c_int) function Epetra_MpiComm_MinAll_Double ( selfID, PartialMins, GlobalMins, &
        Count ) bind(C,name='Epetra_MpiComm_MinAll_Double')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: PartialMins
    real(c_double)                                  ,dimension(*) :: GlobalMins
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MinAll(int * PartialMins, int * GlobalMins, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_MinAll_Int ( CT_Epetra_MpiComm_ID_t selfID, int * PartialMins, int * GlobalMins, int Count );

  integer(c_int) function Epetra_MpiComm_MinAll_Int ( selfID, PartialMins, GlobalMins, &
        Count ) bind(C,name='Epetra_MpiComm_MinAll_Int')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: PartialMins
    integer(c_int)                                  ,dimension(*) :: GlobalMins
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int MinAll(long * PartialMins, long * GlobalMins, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_MinAll_Long ( CT_Epetra_MpiComm_ID_t selfID, long * PartialMins, long * GlobalMins, int Count );

  integer(c_int) function Epetra_MpiComm_MinAll_Long ( selfID, PartialMins, GlobalMins, &
        Count ) bind(C,name='Epetra_MpiComm_MinAll_Long')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: PartialMins
    integer(c_long)                                 ,dimension(*) :: GlobalMins
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int ScanSum(double * MyVals, double * ScanSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_ScanSum_Double ( CT_Epetra_MpiComm_ID_t selfID, double * MyVals, double * ScanSums, int Count );

  integer(c_int) function Epetra_MpiComm_ScanSum_Double ( selfID, MyVals, ScanSums, Count ) &
        bind(C,name='Epetra_MpiComm_ScanSum_Double')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_double
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: MyVals
    real(c_double)                                  ,dimension(*) :: ScanSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int ScanSum(int * MyVals, int * ScanSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_ScanSum_Int ( CT_Epetra_MpiComm_ID_t selfID, int * MyVals, int * ScanSums, int Count );

  integer(c_int) function Epetra_MpiComm_ScanSum_Int ( selfID, MyVals, ScanSums, Count ) &
        bind(C,name='Epetra_MpiComm_ScanSum_Int')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                  ,dimension(*) :: MyVals
    integer(c_int)                                  ,dimension(*) :: ScanSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! int ScanSum(long * MyVals, long * ScanSums, int Count) const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_ScanSum_Long ( CT_Epetra_MpiComm_ID_t selfID, long * MyVals, long * ScanSums, int Count );

  integer(c_int) function Epetra_MpiComm_ScanSum_Long ( selfID, MyVals, ScanSums, Count ) &
        bind(C,name='Epetra_MpiComm_ScanSum_Long')
    import :: c_int ,FT_Epetra_MpiComm_ID_t ,c_long
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    integer(c_long)                                 ,dimension(*) :: MyVals
    integer(c_long)                                 ,dimension(*) :: ScanSums
    integer(c_int)              ,intent(in)   ,value              :: Count
  end function


  ! Original C++ prototype:
  ! MPI_Comm Comm() const;
  ! CTrilinos prototype:
  ! MPI_Comm Epetra_MpiComm_Comm ( CT_Epetra_MpiComm_ID_t selfID );

  integer(FT_MPI_Comm_E_t) function Epetra_MpiComm_Comm ( selfID ) &
        bind(C,name='Epetra_MpiComm_Comm')
    import :: FT_MPI_Comm_E_t ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MyPID() const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_MyPID ( CT_Epetra_MpiComm_ID_t selfID );

  integer(c_int) function Epetra_MpiComm_MyPID ( selfID ) &
        bind(C,name='Epetra_MpiComm_MyPID')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumProc() const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_NumProc ( CT_Epetra_MpiComm_ID_t selfID );

  integer(c_int) function Epetra_MpiComm_NumProc ( selfID ) &
        bind(C,name='Epetra_MpiComm_NumProc')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_Distributor * CreateDistributor() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Distributor_ID_t Epetra_MpiComm_CreateDistributor ( CT_Epetra_MpiComm_ID_t selfID );

  type(FT_Epetra_Distributor_ID_t) function Epetra_MpiComm_CreateDistributor ( selfID ) &
        bind(C,name='Epetra_MpiComm_CreateDistributor')
    import :: FT_Epetra_Distributor_ID_t ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_Directory * CreateDirectory(const Epetra_BlockMap & Map) const;
  ! CTrilinos prototype:
  ! CT_Epetra_Directory_ID_t Epetra_MpiComm_CreateDirectory ( CT_Epetra_MpiComm_ID_t selfID, CT_Epetra_BlockMap_ID_t MapID );

  type(FT_Epetra_Directory_ID_t) function Epetra_MpiComm_CreateDirectory ( selfID, MapID ) &
        bind(C,name='Epetra_MpiComm_CreateDirectory')
    import :: FT_Epetra_Directory_ID_t ,FT_Epetra_MpiComm_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: MapID
  end function


  ! Original C++ prototype:
  ! int GetMpiTag() const;
  ! CTrilinos prototype:
  ! int Epetra_MpiComm_GetMpiTag ( CT_Epetra_MpiComm_ID_t selfID );

  integer(c_int) function Epetra_MpiComm_GetMpiTag ( selfID ) &
        bind(C,name='Epetra_MpiComm_GetMpiTag')
    import :: c_int ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! MPI_Comm GetMpiComm() const;
  ! CTrilinos prototype:
  ! MPI_Comm Epetra_MpiComm_GetMpiComm ( CT_Epetra_MpiComm_ID_t selfID );

  integer(FT_MPI_Comm_E_t) function Epetra_MpiComm_GetMpiComm ( selfID ) &
        bind(C,name='Epetra_MpiComm_GetMpiComm')
    import :: FT_MPI_Comm_E_t ,FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_MpiComm & operator=(const Epetra_MpiComm & Comm);
  ! CTrilinos prototype:
  ! void Epetra_MpiComm_Assign ( CT_Epetra_MpiComm_ID_t selfID, CT_Epetra_MpiComm_ID_t CommID );

  subroutine Epetra_MpiComm_Assign ( selfID, CommID ) bind(C,name='Epetra_MpiComm_Assign')
    import :: FT_Epetra_MpiComm_ID_t
    implicit none
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MpiComm_ID_t),intent(in)   ,value              :: CommID
  end subroutine


#endif /* HAVE_MPI */


  ! _________________ Epetra_CrsMatrix interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_CrsMatrix_ID_t Epetra_CrsMatrix_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_CrsMatrix_ID_t) function Epetra_CrsMatrix_Cast ( id ) &
        bind(C,name='Epetra_CrsMatrix_Cast')
    import :: FT_Epetra_CrsMatrix_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t) ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_CrsMatrix_Abstract ( CT_Epetra_CrsMatrix_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_CrsMatrix_Abstract ( id ) &
        bind(C,name='Epetra_CrsMatrix_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_CrsMatrix(Epetra_DataAccess CV, const Epetra_Map& RowMap, const int* NumEntriesPerRow, bool StaticProfile = false);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsMatrix_ID_t Epetra_CrsMatrix_Create_VarPerRow ( Epetra_DataAccess CV, CT_Epetra_Map_ID_t RowMapID, const int * NumEntriesPerRow, boolean StaticProfile );

  type(FT_Epetra_CrsMatrix_ID_t) function Epetra_CrsMatrix_Create_VarPerRow ( CV, RowMapID, &
        NumEntriesPerRow, StaticProfile ) bind(C,name='Epetra_CrsMatrix_Create_VarPerRow')
    import :: FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_Map_ID_t , &
          c_int ,c_bool
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: RowMapID
    integer(c_int)                ,intent(in)         ,dimension(*) :: NumEntriesPerRow
    logical(c_bool)               ,intent(in)   ,value              :: StaticProfile
  end function


  ! Original C++ prototype:
  ! Epetra_CrsMatrix(Epetra_DataAccess CV, const Epetra_Map& RowMap, int NumEntriesPerRow, bool StaticProfile = false);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsMatrix_ID_t Epetra_CrsMatrix_Create ( Epetra_DataAccess CV, CT_Epetra_Map_ID_t RowMapID, int NumEntriesPerRow, boolean StaticProfile );

  type(FT_Epetra_CrsMatrix_ID_t) function Epetra_CrsMatrix_Create ( CV, RowMapID, &
        NumEntriesPerRow, StaticProfile ) bind(C,name='Epetra_CrsMatrix_Create')
    import :: FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_Map_ID_t , &
          c_int ,c_bool
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: RowMapID
    integer(c_int)                ,intent(in)   ,value              :: NumEntriesPerRow
    logical(c_bool)               ,intent(in)   ,value              :: StaticProfile
  end function


  ! Original C++ prototype:
  ! Epetra_CrsMatrix(Epetra_DataAccess CV, const Epetra_Map& RowMap, const Epetra_Map& ColMap, const int* NumEntriesPerRow, bool StaticProfile = false);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsMatrix_ID_t Epetra_CrsMatrix_Create_VarPerRow_WithColMap ( Epetra_DataAccess CV, CT_Epetra_Map_ID_t RowMapID, CT_Epetra_Map_ID_t ColMapID, const int * NumEntriesPerRow, boolean StaticProfile );

  type(FT_Epetra_CrsMatrix_ID_t) function Epetra_CrsMatrix_Create_VarPerRow_WithColMap ( CV, &
        RowMapID, ColMapID, NumEntriesPerRow, StaticProfile ) &
        bind(C,name='Epetra_CrsMatrix_Create_VarPerRow_WithColMap')
    import :: FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_Map_ID_t , &
          c_int ,c_bool
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: RowMapID
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: ColMapID
    integer(c_int)                ,intent(in)         ,dimension(*) :: NumEntriesPerRow
    logical(c_bool)               ,intent(in)   ,value              :: StaticProfile
  end function


  ! Original C++ prototype:
  ! Epetra_CrsMatrix(Epetra_DataAccess CV, const Epetra_Map& RowMap, const Epetra_Map& ColMap, int NumEntriesPerRow, bool StaticProfile = false);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsMatrix_ID_t Epetra_CrsMatrix_Create_WithColMap ( Epetra_DataAccess CV, CT_Epetra_Map_ID_t RowMapID, CT_Epetra_Map_ID_t ColMapID, int NumEntriesPerRow, boolean StaticProfile );

  type(FT_Epetra_CrsMatrix_ID_t) function Epetra_CrsMatrix_Create_WithColMap ( CV, RowMapID, &
        ColMapID, NumEntriesPerRow, StaticProfile ) &
        bind(C,name='Epetra_CrsMatrix_Create_WithColMap')
    import :: FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_Map_ID_t , &
          c_int ,c_bool
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: RowMapID
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: ColMapID
    integer(c_int)                ,intent(in)   ,value              :: NumEntriesPerRow
    logical(c_bool)               ,intent(in)   ,value              :: StaticProfile
  end function


  ! Original C++ prototype:
  ! Epetra_CrsMatrix(Epetra_DataAccess CV, const Epetra_CrsGraph& Graph);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsMatrix_ID_t Epetra_CrsMatrix_Create_FromGraph ( Epetra_DataAccess CV, CT_Epetra_CrsGraph_ID_t GraphID );

  type(FT_Epetra_CrsMatrix_ID_t) function Epetra_CrsMatrix_Create_FromGraph ( CV, GraphID ) &
        bind(C,name='Epetra_CrsMatrix_Create_FromGraph')
    import :: FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_CrsGraph_ID_t) ,intent(in)   ,value              :: GraphID
  end function


  ! Original C++ prototype:
  ! Epetra_CrsMatrix(const Epetra_CrsMatrix& Matrix);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsMatrix_ID_t Epetra_CrsMatrix_Duplicate ( CT_Epetra_CrsMatrix_ID_t MatrixID );

  type(FT_Epetra_CrsMatrix_ID_t) function Epetra_CrsMatrix_Duplicate ( MatrixID ) &
        bind(C,name='Epetra_CrsMatrix_Duplicate')
    import :: FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: MatrixID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_CrsMatrix();
  ! CTrilinos prototype:
  ! void Epetra_CrsMatrix_Destroy ( CT_Epetra_CrsMatrix_ID_t * selfID );

  subroutine Epetra_CrsMatrix_Destroy ( selfID ) bind(C,name='Epetra_CrsMatrix_Destroy')
    import :: FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! Epetra_CrsMatrix& operator=(const Epetra_CrsMatrix& src);
  ! CTrilinos prototype:
  ! void Epetra_CrsMatrix_Assign ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_CrsMatrix_ID_t srcID );

  subroutine Epetra_CrsMatrix_Assign ( selfID, srcID ) &
        bind(C,name='Epetra_CrsMatrix_Assign')
    import :: FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: srcID
  end subroutine


  ! Original C++ prototype:
  ! int PutScalar(double ScalarConstant);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_PutScalar ( CT_Epetra_CrsMatrix_ID_t selfID, double ScalarConstant );

  integer(c_int) function Epetra_CrsMatrix_PutScalar ( selfID, ScalarConstant ) &
        bind(C,name='Epetra_CrsMatrix_PutScalar')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                ,intent(in)   ,value              :: ScalarConstant
  end function


  ! Original C++ prototype:
  ! int Scale(double ScalarConstant);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_Scale ( CT_Epetra_CrsMatrix_ID_t selfID, double ScalarConstant );

  integer(c_int) function Epetra_CrsMatrix_Scale ( selfID, ScalarConstant ) &
        bind(C,name='Epetra_CrsMatrix_Scale')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    real(c_double)                ,intent(in)   ,value              :: ScalarConstant
  end function


  ! Original C++ prototype:
  ! virtual int InsertGlobalValues(int GlobalRow, int NumEntries, double* Values, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_InsertGlobalValues ( CT_Epetra_CrsMatrix_ID_t selfID, int GlobalRow, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_CrsMatrix_InsertGlobalValues ( selfID, GlobalRow, &
        NumEntries, Values, Indices ) bind(C,name='Epetra_CrsMatrix_InsertGlobalValues')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                ,intent(in)   ,value              :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! virtual int ReplaceGlobalValues(int GlobalRow, int NumEntries, double* Values, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ReplaceGlobalValues ( CT_Epetra_CrsMatrix_ID_t selfID, int GlobalRow, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_CrsMatrix_ReplaceGlobalValues ( selfID, GlobalRow, &
        NumEntries, Values, Indices ) bind(C,name='Epetra_CrsMatrix_ReplaceGlobalValues')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                ,intent(in)   ,value              :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! virtual int SumIntoGlobalValues(int GlobalRow, int NumEntries, double* Values, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_SumIntoGlobalValues ( CT_Epetra_CrsMatrix_ID_t selfID, int GlobalRow, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_CrsMatrix_SumIntoGlobalValues ( selfID, GlobalRow, &
        NumEntries, Values, Indices ) bind(C,name='Epetra_CrsMatrix_SumIntoGlobalValues')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                ,intent(in)   ,value              :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int InsertMyValues(int MyRow, int NumEntries, double* Values, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_InsertMyValues ( CT_Epetra_CrsMatrix_ID_t selfID, int MyRow, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_CrsMatrix_InsertMyValues ( selfID, MyRow, NumEntries, &
        Values, Indices ) bind(C,name='Epetra_CrsMatrix_InsertMyValues')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(in)   ,value              :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ReplaceMyValues(int MyRow, int NumEntries, double* Values, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ReplaceMyValues ( CT_Epetra_CrsMatrix_ID_t selfID, int MyRow, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_CrsMatrix_ReplaceMyValues ( selfID, MyRow, NumEntries, &
        Values, Indices ) bind(C,name='Epetra_CrsMatrix_ReplaceMyValues')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(in)   ,value              :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int SumIntoMyValues(int MyRow, int NumEntries, double* Values, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_SumIntoMyValues ( CT_Epetra_CrsMatrix_ID_t selfID, int MyRow, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_CrsMatrix_SumIntoMyValues ( selfID, MyRow, NumEntries, &
        Values, Indices ) bind(C,name='Epetra_CrsMatrix_SumIntoMyValues')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(in)   ,value              :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ReplaceDiagonalValues(const Epetra_Vector& Diagonal);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ReplaceDiagonalValues ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Vector_ID_t DiagonalID );

  integer(c_int) function Epetra_CrsMatrix_ReplaceDiagonalValues ( selfID, DiagonalID ) &
        bind(C,name='Epetra_CrsMatrix_ReplaceDiagonalValues')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: DiagonalID
  end function


  ! Original C++ prototype:
  ! int FillComplete(bool OptimizeDataStorage = true);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_FillComplete ( CT_Epetra_CrsMatrix_ID_t selfID, boolean OptimizeDataStorage );

  integer(c_int) function Epetra_CrsMatrix_FillComplete ( selfID, OptimizeDataStorage ) &
        bind(C,name='Epetra_CrsMatrix_FillComplete')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_bool
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: OptimizeDataStorage
  end function


  ! Original C++ prototype:
  ! int FillComplete(const Epetra_Map& DomainMap, const Epetra_Map& RangeMap, bool OptimizeDataStorage = true);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_FillComplete_UsingMaps ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Map_ID_t DomainMapID, CT_Epetra_Map_ID_t RangeMapID, boolean OptimizeDataStorage );

  integer(c_int) function Epetra_CrsMatrix_FillComplete_UsingMaps ( selfID, DomainMapID, &
        RangeMapID, OptimizeDataStorage ) &
        bind(C,name='Epetra_CrsMatrix_FillComplete_UsingMaps')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Map_ID_t ,c_bool
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: DomainMapID
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: RangeMapID
    logical(c_bool)               ,intent(in)   ,value              :: OptimizeDataStorage
  end function


  ! Original C++ prototype:
  ! int OptimizeStorage();
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_OptimizeStorage ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_OptimizeStorage ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_OptimizeStorage')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MakeDataContiguous();
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_MakeDataContiguous ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_MakeDataContiguous ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_MakeDataContiguous')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ExtractGlobalRowCopy(int GlobalRow, int Length, int& NumEntries, double* Values, int* Indices) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractGlobalRowCopy_WithIndices ( CT_Epetra_CrsMatrix_ID_t selfID, int GlobalRow, int Length, int * NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_CrsMatrix_ExtractGlobalRowCopy_WithIndices ( selfID, &
        GlobalRow, Length, NumEntries, Values, Indices ) &
        bind(C,name='Epetra_CrsMatrix_ExtractGlobalRowCopy_WithIndices')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                ,intent(in)   ,value              :: Length
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ExtractMyRowCopy(int MyRow, int Length, int& NumEntries, double* Values, int* Indices) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractMyRowCopy_WithIndices ( CT_Epetra_CrsMatrix_ID_t selfID, int MyRow, int Length, int * NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_CrsMatrix_ExtractMyRowCopy_WithIndices ( selfID, MyRow, &
        Length, NumEntries, Values, Indices ) &
        bind(C,name='Epetra_CrsMatrix_ExtractMyRowCopy_WithIndices')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(in)   ,value              :: Length
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
    integer(c_int)                                    ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ExtractGlobalRowCopy(int GlobalRow, int Length, int& NumEntries, double* Values) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractGlobalRowCopy ( CT_Epetra_CrsMatrix_ID_t selfID, int GlobalRow, int Length, int * NumEntries, double * Values );

  integer(c_int) function Epetra_CrsMatrix_ExtractGlobalRowCopy ( selfID, GlobalRow, Length, &
        NumEntries, Values ) bind(C,name='Epetra_CrsMatrix_ExtractGlobalRowCopy')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                ,intent(in)   ,value              :: Length
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
  end function


  ! Original C++ prototype:
  ! int ExtractMyRowCopy(int MyRow, int Length, int& NumEntries, double* Values) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractMyRowCopy ( CT_Epetra_CrsMatrix_ID_t selfID, int MyRow, int Length, int * NumEntries, double * Values );

  integer(c_int) function Epetra_CrsMatrix_ExtractMyRowCopy ( selfID, MyRow, Length, &
        NumEntries, Values ) bind(C,name='Epetra_CrsMatrix_ExtractMyRowCopy')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(in)   ,value              :: Length
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                                    ,dimension(*) :: Values
  end function


  ! Original C++ prototype:
  ! int ExtractDiagonalCopy(Epetra_Vector& Diagonal) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractDiagonalCopy ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Vector_ID_t DiagonalID );

  integer(c_int) function Epetra_CrsMatrix_ExtractDiagonalCopy ( selfID, DiagonalID ) &
        bind(C,name='Epetra_CrsMatrix_ExtractDiagonalCopy')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: DiagonalID
  end function


  ! Original C++ prototype:
  ! int ExtractGlobalRowView(int GlobalRow, int& NumEntries, double*& Values, int*& Indices) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractGlobalRowView_WithIndices ( CT_Epetra_CrsMatrix_ID_t selfID, int GlobalRow, int * NumEntries, double ** Values, int ** Indices );

  integer(c_int) function Epetra_CrsMatrix_ExtractGlobalRowView_WithIndices ( selfID, &
        GlobalRow, NumEntries, Values, Indices ) &
        bind(C,name='Epetra_CrsMatrix_ExtractGlobalRowView_WithIndices')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                ,intent(inout)      ,dimension(*) :: Values
    integer(c_int)                ,intent(inout)      ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ExtractMyRowView(int MyRow, int& NumEntries, double*& Values, int*& Indices) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractMyRowView_WithIndices ( CT_Epetra_CrsMatrix_ID_t selfID, int MyRow, int * NumEntries, double ** Values, int ** Indices );

  integer(c_int) function Epetra_CrsMatrix_ExtractMyRowView_WithIndices ( selfID, MyRow, &
        NumEntries, Values, Indices ) &
        bind(C,name='Epetra_CrsMatrix_ExtractMyRowView_WithIndices')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                ,intent(inout)      ,dimension(*) :: Values
    integer(c_int)                ,intent(inout)      ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ExtractGlobalRowView(int GlobalRow, int& NumEntries, double*& Values) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractGlobalRowView ( CT_Epetra_CrsMatrix_ID_t selfID, int GlobalRow, int * NumEntries, double ** Values );

  integer(c_int) function Epetra_CrsMatrix_ExtractGlobalRowView ( selfID, GlobalRow, &
        NumEntries, Values ) bind(C,name='Epetra_CrsMatrix_ExtractGlobalRowView')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GlobalRow
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                ,intent(inout)      ,dimension(*) :: Values
  end function


  ! Original C++ prototype:
  ! int ExtractMyRowView(int MyRow, int& NumEntries, double*& Values) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ExtractMyRowView ( CT_Epetra_CrsMatrix_ID_t selfID, int MyRow, int * NumEntries, double ** Values );

  integer(c_int) function Epetra_CrsMatrix_ExtractMyRowView ( selfID, MyRow, NumEntries, &
        Values ) bind(C,name='Epetra_CrsMatrix_ExtractMyRowView')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_double
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(inout)                    :: NumEntries
    real(c_double)                ,intent(inout)      ,dimension(*) :: Values
  end function


  ! Original C++ prototype:
  ! int Multiply(bool TransA, const Epetra_Vector& x, Epetra_Vector& y) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_Multiply_Vector ( CT_Epetra_CrsMatrix_ID_t selfID, boolean TransA, CT_Epetra_Vector_ID_t xID, CT_Epetra_Vector_ID_t yID );

  integer(c_int) function Epetra_CrsMatrix_Multiply_Vector ( selfID, TransA, xID, yID ) &
        bind(C,name='Epetra_CrsMatrix_Multiply_Vector')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_bool ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: TransA
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: yID
  end function


  ! Original C++ prototype:
  ! int Multiply1(bool TransA, const Epetra_Vector& x, Epetra_Vector& y) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_Multiply1_Vector ( CT_Epetra_CrsMatrix_ID_t selfID, boolean TransA, CT_Epetra_Vector_ID_t xID, CT_Epetra_Vector_ID_t yID );

  integer(c_int) function Epetra_CrsMatrix_Multiply1_Vector ( selfID, TransA, xID, yID ) &
        bind(C,name='Epetra_CrsMatrix_Multiply1_Vector')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_bool ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: TransA
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: yID
  end function


  ! Original C++ prototype:
  ! int Multiply(bool TransA, const Epetra_MultiVector& X, Epetra_MultiVector& Y) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_Multiply_MultiVector ( CT_Epetra_CrsMatrix_ID_t selfID, boolean TransA, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_CrsMatrix_Multiply_MultiVector ( selfID, TransA, XID, YID ) &
        bind(C,name='Epetra_CrsMatrix_Multiply_MultiVector')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_bool ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: TransA
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! int Multiply1(bool TransA, const Epetra_MultiVector& X, Epetra_MultiVector& Y) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_Multiply1_MultiVector ( CT_Epetra_CrsMatrix_ID_t selfID, boolean TransA, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_CrsMatrix_Multiply1_MultiVector ( selfID, TransA, XID, YID ) &
        bind(C,name='Epetra_CrsMatrix_Multiply1_MultiVector')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_bool ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: TransA
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! int Solve(bool Upper, bool Trans, bool UnitDiagonal, const Epetra_Vector& x, Epetra_Vector& y) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_Solve_Vector ( CT_Epetra_CrsMatrix_ID_t selfID, boolean Upper, boolean Trans, boolean UnitDiagonal, CT_Epetra_Vector_ID_t xID, CT_Epetra_Vector_ID_t yID );

  integer(c_int) function Epetra_CrsMatrix_Solve_Vector ( selfID, Upper, Trans, &
        UnitDiagonal, xID, yID ) bind(C,name='Epetra_CrsMatrix_Solve_Vector')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_bool ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: Upper
    logical(c_bool)               ,intent(in)   ,value              :: Trans
    logical(c_bool)               ,intent(in)   ,value              :: UnitDiagonal
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: yID
  end function


  ! Original C++ prototype:
  ! int Solve(bool Upper, bool Trans, bool UnitDiagonal, const Epetra_MultiVector& X, Epetra_MultiVector& Y) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_Solve_MultiVector ( CT_Epetra_CrsMatrix_ID_t selfID, boolean Upper, boolean Trans, boolean UnitDiagonal, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_CrsMatrix_Solve_MultiVector ( selfID, Upper, Trans, &
        UnitDiagonal, XID, YID ) bind(C,name='Epetra_CrsMatrix_Solve_MultiVector')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_bool ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: Upper
    logical(c_bool)               ,intent(in)   ,value              :: Trans
    logical(c_bool)               ,intent(in)   ,value              :: UnitDiagonal
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! int InvRowSums(Epetra_Vector& x) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_InvRowSums ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_CrsMatrix_InvRowSums ( selfID, xID ) &
        bind(C,name='Epetra_CrsMatrix_InvRowSums')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! int InvRowMaxs(Epetra_Vector& x) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_InvRowMaxs ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_CrsMatrix_InvRowMaxs ( selfID, xID ) &
        bind(C,name='Epetra_CrsMatrix_InvRowMaxs')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! int LeftScale(const Epetra_Vector& x);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_LeftScale ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_CrsMatrix_LeftScale ( selfID, xID ) &
        bind(C,name='Epetra_CrsMatrix_LeftScale')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! int InvColSums(Epetra_Vector& x) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_InvColSums ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_CrsMatrix_InvColSums ( selfID, xID ) &
        bind(C,name='Epetra_CrsMatrix_InvColSums')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! int InvColMaxs(Epetra_Vector& x) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_InvColMaxs ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_CrsMatrix_InvColMaxs ( selfID, xID ) &
        bind(C,name='Epetra_CrsMatrix_InvColMaxs')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! int RightScale(const Epetra_Vector& x);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_RightScale ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Vector_ID_t xID );

  integer(c_int) function Epetra_CrsMatrix_RightScale ( selfID, xID ) &
        bind(C,name='Epetra_CrsMatrix_RightScale')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Vector_ID_t)   ,intent(in)   ,value              :: xID
  end function


  ! Original C++ prototype:
  ! bool Filled() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_Filled ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_Filled ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_Filled')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool StorageOptimized() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_StorageOptimized ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_StorageOptimized ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_StorageOptimized')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool IndicesAreGlobal() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_IndicesAreGlobal ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_IndicesAreGlobal ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_IndicesAreGlobal')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool IndicesAreLocal() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_IndicesAreLocal ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_IndicesAreLocal ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_IndicesAreLocal')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool IndicesAreContiguous() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_IndicesAreContiguous ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_IndicesAreContiguous ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_IndicesAreContiguous')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool LowerTriangular() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_LowerTriangular ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_LowerTriangular ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_LowerTriangular')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool UpperTriangular() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_UpperTriangular ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_UpperTriangular ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_UpperTriangular')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool NoDiagonal() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_NoDiagonal ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_NoDiagonal ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NoDiagonal')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! double NormInf() const;
  ! CTrilinos prototype:
  ! double Epetra_CrsMatrix_NormInf ( CT_Epetra_CrsMatrix_ID_t selfID );

  real(c_double) function Epetra_CrsMatrix_NormInf ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NormInf')
    import :: c_double ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! double NormOne() const;
  ! CTrilinos prototype:
  ! double Epetra_CrsMatrix_NormOne ( CT_Epetra_CrsMatrix_ID_t selfID );

  real(c_double) function Epetra_CrsMatrix_NormOne ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NormOne')
    import :: c_double ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! double NormFrobenius() const;
  ! CTrilinos prototype:
  ! double Epetra_CrsMatrix_NormFrobenius ( CT_Epetra_CrsMatrix_ID_t selfID );

  real(c_double) function Epetra_CrsMatrix_NormFrobenius ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NormFrobenius')
    import :: c_double ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalNonzeros() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumGlobalNonzeros ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_NumGlobalNonzeros ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NumGlobalNonzeros')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalRows() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumGlobalRows ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_NumGlobalRows ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NumGlobalRows')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalCols() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumGlobalCols ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_NumGlobalCols ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NumGlobalCols')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalDiagonals() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumGlobalDiagonals ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_NumGlobalDiagonals ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NumGlobalDiagonals')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyNonzeros() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumMyNonzeros ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_NumMyNonzeros ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NumMyNonzeros')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyRows() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumMyRows ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_NumMyRows ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NumMyRows')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyCols() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumMyCols ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_NumMyCols ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NumMyCols')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyDiagonals() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumMyDiagonals ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_NumMyDiagonals ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_NumMyDiagonals')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalEntries(int Row) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumGlobalEntries ( CT_Epetra_CrsMatrix_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsMatrix_NumGlobalEntries ( selfID, Row ) &
        bind(C,name='Epetra_CrsMatrix_NumGlobalEntries')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int NumAllocatedGlobalEntries(int Row) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumAllocatedGlobalEntries ( CT_Epetra_CrsMatrix_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsMatrix_NumAllocatedGlobalEntries ( selfID, Row ) &
        bind(C,name='Epetra_CrsMatrix_NumAllocatedGlobalEntries')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int MaxNumEntries() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_MaxNumEntries ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_MaxNumEntries ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_MaxNumEntries')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int GlobalMaxNumEntries() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_GlobalMaxNumEntries ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_GlobalMaxNumEntries ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_GlobalMaxNumEntries')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyEntries(int Row) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumMyEntries ( CT_Epetra_CrsMatrix_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsMatrix_NumMyEntries ( selfID, Row ) &
        bind(C,name='Epetra_CrsMatrix_NumMyEntries')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int NumAllocatedMyEntries(int Row) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumAllocatedMyEntries ( CT_Epetra_CrsMatrix_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsMatrix_NumAllocatedMyEntries ( selfID, Row ) &
        bind(C,name='Epetra_CrsMatrix_NumAllocatedMyEntries')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int IndexBase() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_IndexBase ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_IndexBase ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_IndexBase')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool StaticGraph();
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_StaticGraph ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_StaticGraph ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_StaticGraph')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_CrsGraph& Graph() const;
  ! CTrilinos prototype:
  ! CT_Epetra_CrsGraph_ID_t Epetra_CrsMatrix_Graph ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_CrsGraph_ID_t) function Epetra_CrsMatrix_Graph ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_Graph')
    import :: FT_Epetra_CrsGraph_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& RowMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_RowMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_RowMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_RowMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ReplaceRowMap(const Epetra_BlockMap& newmap);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ReplaceRowMap ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_BlockMap_ID_t newmapID );

  integer(c_int) function Epetra_CrsMatrix_ReplaceRowMap ( selfID, newmapID ) &
        bind(C,name='Epetra_CrsMatrix_ReplaceRowMap')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t) ,intent(in)   ,value              :: newmapID
  end function


  ! Original C++ prototype:
  ! bool HaveColMap() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_HaveColMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_HaveColMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_HaveColMap')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ReplaceColMap(const Epetra_BlockMap& newmap);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ReplaceColMap ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_BlockMap_ID_t newmapID );

  integer(c_int) function Epetra_CrsMatrix_ReplaceColMap ( selfID, newmapID ) &
        bind(C,name='Epetra_CrsMatrix_ReplaceColMap')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t) ,intent(in)   ,value              :: newmapID
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& ColMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_ColMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_ColMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_ColMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& DomainMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_DomainMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_DomainMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_DomainMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& RangeMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_RangeMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_RangeMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_RangeMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Import* Importer() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Import_ID_t Epetra_CrsMatrix_Importer ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Import_ID_t) function Epetra_CrsMatrix_Importer ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_Importer')
    import :: FT_Epetra_Import_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Export* Exporter() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Export_ID_t Epetra_CrsMatrix_Exporter ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Export_ID_t) function Epetra_CrsMatrix_Exporter ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_Exporter')
    import :: FT_Epetra_Export_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Comm& Comm() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_CrsMatrix_Comm ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Comm_ID_t) function Epetra_CrsMatrix_Comm ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_Comm')
    import :: FT_Epetra_Comm_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int LRID( int GRID_in) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_LRID ( CT_Epetra_CrsMatrix_ID_t selfID, int GRID_in );

  integer(c_int) function Epetra_CrsMatrix_LRID ( selfID, GRID_in ) &
        bind(C,name='Epetra_CrsMatrix_LRID')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GRID_in
  end function


  ! Original C++ prototype:
  ! int GRID( int LRID_in) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_GRID ( CT_Epetra_CrsMatrix_ID_t selfID, int LRID_in );

  integer(c_int) function Epetra_CrsMatrix_GRID ( selfID, LRID_in ) &
        bind(C,name='Epetra_CrsMatrix_GRID')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: LRID_in
  end function


  ! Original C++ prototype:
  ! int LCID( int GCID_in) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_LCID ( CT_Epetra_CrsMatrix_ID_t selfID, int GCID_in );

  integer(c_int) function Epetra_CrsMatrix_LCID ( selfID, GCID_in ) &
        bind(C,name='Epetra_CrsMatrix_LCID')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GCID_in
  end function


  ! Original C++ prototype:
  ! int GCID( int LCID_in) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_GCID ( CT_Epetra_CrsMatrix_ID_t selfID, int LCID_in );

  integer(c_int) function Epetra_CrsMatrix_GCID ( selfID, LCID_in ) &
        bind(C,name='Epetra_CrsMatrix_GCID')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: LCID_in
  end function


  ! Original C++ prototype:
  ! bool MyGRID(int GRID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_MyGRID ( CT_Epetra_CrsMatrix_ID_t selfID, int GRID_in );

  logical(c_bool) function Epetra_CrsMatrix_MyGRID ( selfID, GRID_in ) &
        bind(C,name='Epetra_CrsMatrix_MyGRID')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GRID_in
  end function


  ! Original C++ prototype:
  ! bool MyLRID(int LRID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_MyLRID ( CT_Epetra_CrsMatrix_ID_t selfID, int LRID_in );

  logical(c_bool) function Epetra_CrsMatrix_MyLRID ( selfID, LRID_in ) &
        bind(C,name='Epetra_CrsMatrix_MyLRID')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: LRID_in
  end function


  ! Original C++ prototype:
  ! bool MyGCID(int GCID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_MyGCID ( CT_Epetra_CrsMatrix_ID_t selfID, int GCID_in );

  logical(c_bool) function Epetra_CrsMatrix_MyGCID ( selfID, GCID_in ) &
        bind(C,name='Epetra_CrsMatrix_MyGCID')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GCID_in
  end function


  ! Original C++ prototype:
  ! bool MyLCID(int LCID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_MyLCID ( CT_Epetra_CrsMatrix_ID_t selfID, int LCID_in );

  logical(c_bool) function Epetra_CrsMatrix_MyLCID ( selfID, LCID_in ) &
        bind(C,name='Epetra_CrsMatrix_MyLCID')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: LCID_in
  end function


  ! Original C++ prototype:
  ! bool MyGlobalRow(int GID) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_MyGlobalRow ( CT_Epetra_CrsMatrix_ID_t selfID, int GID );

  logical(c_bool) function Epetra_CrsMatrix_MyGlobalRow ( selfID, GID ) &
        bind(C,name='Epetra_CrsMatrix_MyGlobalRow')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: GID
  end function


  ! Original C++ prototype:
  ! const char* Label() const;
  ! CTrilinos prototype:
  ! const char * Epetra_CrsMatrix_Label ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(c_ptr) function Epetra_CrsMatrix_Label ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_Label')
    import :: c_ptr ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int SetUseTranspose(bool UseTranspose_in);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_SetUseTranspose ( CT_Epetra_CrsMatrix_ID_t selfID, boolean UseTranspose_in );

  integer(c_int) function Epetra_CrsMatrix_SetUseTranspose ( selfID, UseTranspose_in ) &
        bind(C,name='Epetra_CrsMatrix_SetUseTranspose')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,c_bool
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    logical(c_bool)               ,intent(in)   ,value              :: UseTranspose_in
  end function


  ! Original C++ prototype:
  ! int Apply(const Epetra_MultiVector& X, Epetra_MultiVector& Y) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_Apply ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_CrsMatrix_Apply ( selfID, XID, YID ) &
        bind(C,name='Epetra_CrsMatrix_Apply')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! int ApplyInverse(const Epetra_MultiVector& X, Epetra_MultiVector& Y) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_ApplyInverse ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_MultiVector_ID_t XID, CT_Epetra_MultiVector_ID_t YID );

  integer(c_int) function Epetra_CrsMatrix_ApplyInverse ( selfID, XID, YID ) &
        bind(C,name='Epetra_CrsMatrix_ApplyInverse')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_MultiVector_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: XID
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: YID
  end function


  ! Original C++ prototype:
  ! bool HasNormInf() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_HasNormInf ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_HasNormInf ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_HasNormInf')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool UseTranspose() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsMatrix_UseTranspose ( CT_Epetra_CrsMatrix_ID_t selfID );

  logical(c_bool) function Epetra_CrsMatrix_UseTranspose ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_UseTranspose')
    import :: c_bool ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& OperatorDomainMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_OperatorDomainMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_OperatorDomainMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_OperatorDomainMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& OperatorRangeMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_OperatorRangeMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_OperatorRangeMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_OperatorRangeMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyRowEntries(int MyRow, int& NumEntries) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_NumMyRowEntries ( CT_Epetra_CrsMatrix_ID_t selfID, int MyRow, int * NumEntries );

  integer(c_int) function Epetra_CrsMatrix_NumMyRowEntries ( selfID, MyRow, NumEntries ) &
        bind(C,name='Epetra_CrsMatrix_NumMyRowEntries')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: MyRow
    integer(c_int)                ,intent(inout)                    :: NumEntries
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& RowMatrixRowMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_RowMatrixRowMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_RowMatrixRowMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_RowMatrixRowMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& RowMatrixColMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_RowMatrixColMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_RowMatrixColMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_RowMatrixColMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Import* RowMatrixImporter() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Import_ID_t Epetra_CrsMatrix_RowMatrixImporter ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Import_ID_t) function Epetra_CrsMatrix_RowMatrixImporter ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_RowMatrixImporter')
    import :: FT_Epetra_Import_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! inline double* operator[] (int Loc) const;
  ! CTrilinos prototype:
  ! double * Epetra_CrsMatrix_getRow ( CT_Epetra_CrsMatrix_ID_t selfID, int Loc );

  type(c_ptr) function Epetra_CrsMatrix_getRow ( selfID, Loc ) &
        bind(C,name='Epetra_CrsMatrix_getRow')
    import :: c_ptr ,FT_Epetra_CrsMatrix_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                ,intent(in)   ,value              :: Loc
  end function


  ! Original C++ prototype:
  ! const Epetra_Map& ImportMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_CrsMatrix_ImportMap ( CT_Epetra_CrsMatrix_ID_t selfID );

  type(FT_Epetra_Map_ID_t) function Epetra_CrsMatrix_ImportMap ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_ImportMap')
    import :: FT_Epetra_Map_ID_t ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int TransformToLocal();
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_TransformToLocal ( CT_Epetra_CrsMatrix_ID_t selfID );

  integer(c_int) function Epetra_CrsMatrix_TransformToLocal ( selfID ) &
        bind(C,name='Epetra_CrsMatrix_TransformToLocal')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int TransformToLocal(const Epetra_Map* DomainMap, const Epetra_Map* RangeMap);
  ! CTrilinos prototype:
  ! int Epetra_CrsMatrix_TransformToLocal_UsingMaps ( CT_Epetra_CrsMatrix_ID_t selfID, CT_Epetra_Map_ID_t DomainMapID, CT_Epetra_Map_ID_t RangeMapID );

  integer(c_int) function Epetra_CrsMatrix_TransformToLocal_UsingMaps ( selfID, DomainMapID, &
        RangeMapID ) bind(C,name='Epetra_CrsMatrix_TransformToLocal_UsingMaps')
    import :: c_int ,FT_Epetra_CrsMatrix_ID_t ,FT_Epetra_Map_ID_t
    implicit none
    type(FT_Epetra_CrsMatrix_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: DomainMapID
    type(FT_Epetra_Map_ID_t)      ,intent(in)   ,value              :: RangeMapID
  end function


  ! _________________ Epetra_CrsGraph interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_CrsGraph_ID_t Epetra_CrsGraph_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_CrsGraph_ID_t) function Epetra_CrsGraph_Cast ( id ) &
        bind(C,name='Epetra_CrsGraph_Cast')
    import :: FT_Epetra_CrsGraph_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_CrsGraph_Abstract ( CT_Epetra_CrsGraph_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_CrsGraph_Abstract ( id ) &
        bind(C,name='Epetra_CrsGraph_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_CrsGraph(Epetra_DataAccess CV, const Epetra_BlockMap& RowMap, const int* NumIndicesPerRow, bool StaticProfile = false);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsGraph_ID_t Epetra_CrsGraph_Create_VarPerRow ( Epetra_DataAccess CV, CT_Epetra_BlockMap_ID_t RowMapID, const int * NumIndicesPerRow, boolean StaticProfile );

  type(FT_Epetra_CrsGraph_ID_t) function Epetra_CrsGraph_Create_VarPerRow ( CV, RowMapID, &
        NumIndicesPerRow, StaticProfile ) bind(C,name='Epetra_CrsGraph_Create_VarPerRow')
    import :: FT_Epetra_CrsGraph_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_BlockMap_ID_t , &
          c_int ,c_bool
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: RowMapID
    integer(c_int)               ,intent(in)         ,dimension(*) :: NumIndicesPerRow
    logical(c_bool)              ,intent(in)   ,value              :: StaticProfile
  end function


  ! Original C++ prototype:
  ! Epetra_CrsGraph(Epetra_DataAccess CV, const Epetra_BlockMap& RowMap, int NumIndicesPerRow, bool StaticProfile = false);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsGraph_ID_t Epetra_CrsGraph_Create ( Epetra_DataAccess CV, CT_Epetra_BlockMap_ID_t RowMapID, int NumIndicesPerRow, boolean StaticProfile );

  type(FT_Epetra_CrsGraph_ID_t) function Epetra_CrsGraph_Create ( CV, RowMapID, &
        NumIndicesPerRow, StaticProfile ) bind(C,name='Epetra_CrsGraph_Create')
    import :: FT_Epetra_CrsGraph_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_BlockMap_ID_t , &
          c_int ,c_bool
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: RowMapID
    integer(c_int)               ,intent(in)   ,value              :: NumIndicesPerRow
    logical(c_bool)              ,intent(in)   ,value              :: StaticProfile
  end function


  ! Original C++ prototype:
  ! Epetra_CrsGraph(Epetra_DataAccess CV, const Epetra_BlockMap& RowMap, const Epetra_BlockMap& ColMap, const int* NumIndicesPerRow, bool StaticProfile = false);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsGraph_ID_t Epetra_CrsGraph_Create_VarPerRow_WithColMap ( Epetra_DataAccess CV, CT_Epetra_BlockMap_ID_t RowMapID, CT_Epetra_BlockMap_ID_t ColMapID, const int * NumIndicesPerRow, boolean StaticProfile );

  type(FT_Epetra_CrsGraph_ID_t) function Epetra_CrsGraph_Create_VarPerRow_WithColMap ( CV, &
        RowMapID, ColMapID, NumIndicesPerRow, StaticProfile ) &
        bind(C,name='Epetra_CrsGraph_Create_VarPerRow_WithColMap')
    import :: FT_Epetra_CrsGraph_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_BlockMap_ID_t , &
          c_int ,c_bool
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: RowMapID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: ColMapID
    integer(c_int)               ,intent(in)         ,dimension(*) :: NumIndicesPerRow
    logical(c_bool)              ,intent(in)   ,value              :: StaticProfile
  end function


  ! Original C++ prototype:
  ! Epetra_CrsGraph(Epetra_DataAccess CV, const Epetra_BlockMap& RowMap, const Epetra_BlockMap& ColMap, int NumIndicesPerRow, bool StaticProfile = false);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsGraph_ID_t Epetra_CrsGraph_Create_With_ColMap ( Epetra_DataAccess CV, CT_Epetra_BlockMap_ID_t RowMapID, CT_Epetra_BlockMap_ID_t ColMapID, int NumIndicesPerRow, boolean StaticProfile );

  type(FT_Epetra_CrsGraph_ID_t) function Epetra_CrsGraph_Create_With_ColMap ( CV, RowMapID, &
        ColMapID, NumIndicesPerRow, StaticProfile ) &
        bind(C,name='Epetra_CrsGraph_Create_With_ColMap')
    import :: FT_Epetra_CrsGraph_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_BlockMap_ID_t , &
          c_int ,c_bool
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: RowMapID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: ColMapID
    integer(c_int)               ,intent(in)   ,value              :: NumIndicesPerRow
    logical(c_bool)              ,intent(in)   ,value              :: StaticProfile
  end function


  ! Original C++ prototype:
  ! Epetra_CrsGraph(const Epetra_CrsGraph& Graph);
  ! CTrilinos prototype:
  ! CT_Epetra_CrsGraph_ID_t Epetra_CrsGraph_Duplicate ( CT_Epetra_CrsGraph_ID_t GraphID );

  type(FT_Epetra_CrsGraph_ID_t) function Epetra_CrsGraph_Duplicate ( GraphID ) &
        bind(C,name='Epetra_CrsGraph_Duplicate')
    import :: FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: GraphID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_CrsGraph();
  ! CTrilinos prototype:
  ! void Epetra_CrsGraph_Destroy ( CT_Epetra_CrsGraph_ID_t * selfID );

  subroutine Epetra_CrsGraph_Destroy ( selfID ) bind(C,name='Epetra_CrsGraph_Destroy')
    import :: FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int InsertGlobalIndices(int GlobalRow, int NumIndices, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_InsertGlobalIndices ( CT_Epetra_CrsGraph_ID_t selfID, int GlobalRow, int NumIndices, int * Indices );

  integer(c_int) function Epetra_CrsGraph_InsertGlobalIndices ( selfID, GlobalRow, &
        NumIndices, Indices ) bind(C,name='Epetra_CrsGraph_InsertGlobalIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GlobalRow
    integer(c_int)               ,intent(in)   ,value              :: NumIndices
    integer(c_int)                                   ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int RemoveGlobalIndices(int GlobalRow, int NumIndices, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_RemoveGlobalIndices ( CT_Epetra_CrsGraph_ID_t selfID, int GlobalRow, int NumIndices, int * Indices );

  integer(c_int) function Epetra_CrsGraph_RemoveGlobalIndices ( selfID, GlobalRow, &
        NumIndices, Indices ) bind(C,name='Epetra_CrsGraph_RemoveGlobalIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GlobalRow
    integer(c_int)               ,intent(in)   ,value              :: NumIndices
    integer(c_int)                                   ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int RemoveGlobalIndices(int Row);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_RemoveGlobalIndices_LocalRow ( CT_Epetra_CrsGraph_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsGraph_RemoveGlobalIndices_LocalRow ( selfID, Row ) &
        bind(C,name='Epetra_CrsGraph_RemoveGlobalIndices_LocalRow')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int InsertMyIndices(int LocalRow, int NumIndices, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_InsertMyIndices ( CT_Epetra_CrsGraph_ID_t selfID, int LocalRow, int NumIndices, int * Indices );

  integer(c_int) function Epetra_CrsGraph_InsertMyIndices ( selfID, LocalRow, NumIndices, &
        Indices ) bind(C,name='Epetra_CrsGraph_InsertMyIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LocalRow
    integer(c_int)               ,intent(in)   ,value              :: NumIndices
    integer(c_int)                                   ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int RemoveMyIndices(int LocalRow, int NumIndices, int* Indices);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_RemoveMyIndices ( CT_Epetra_CrsGraph_ID_t selfID, int LocalRow, int NumIndices, int * Indices );

  integer(c_int) function Epetra_CrsGraph_RemoveMyIndices ( selfID, LocalRow, NumIndices, &
        Indices ) bind(C,name='Epetra_CrsGraph_RemoveMyIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LocalRow
    integer(c_int)               ,intent(in)   ,value              :: NumIndices
    integer(c_int)                                   ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int RemoveMyIndices(int Row);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_RemoveMyIndices_LocalRow ( CT_Epetra_CrsGraph_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsGraph_RemoveMyIndices_LocalRow ( selfID, Row ) &
        bind(C,name='Epetra_CrsGraph_RemoveMyIndices_LocalRow')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int FillComplete();
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_FillComplete ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_FillComplete ( selfID ) &
        bind(C,name='Epetra_CrsGraph_FillComplete')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int FillComplete(const Epetra_BlockMap& DomainMap, const Epetra_BlockMap& RangeMap);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_FillComplete_UsingMaps ( CT_Epetra_CrsGraph_ID_t selfID, CT_Epetra_BlockMap_ID_t DomainMapID, CT_Epetra_BlockMap_ID_t RangeMapID );

  integer(c_int) function Epetra_CrsGraph_FillComplete_UsingMaps ( selfID, DomainMapID, &
        RangeMapID ) bind(C,name='Epetra_CrsGraph_FillComplete_UsingMaps')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: DomainMapID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: RangeMapID
  end function


  ! Original C++ prototype:
  ! int OptimizeStorage();
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_OptimizeStorage ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_OptimizeStorage ( selfID ) &
        bind(C,name='Epetra_CrsGraph_OptimizeStorage')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ExtractGlobalRowCopy(int GlobalRow, int LenOfIndices, int& NumIndices, int* Indices) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_ExtractGlobalRowCopy ( CT_Epetra_CrsGraph_ID_t selfID, int GlobalRow, int LenOfIndices, int * NumIndices, int * Indices );

  integer(c_int) function Epetra_CrsGraph_ExtractGlobalRowCopy ( selfID, GlobalRow, &
        LenOfIndices, NumIndices, Indices ) &
        bind(C,name='Epetra_CrsGraph_ExtractGlobalRowCopy')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GlobalRow
    integer(c_int)               ,intent(in)   ,value              :: LenOfIndices
    integer(c_int)               ,intent(inout)                    :: NumIndices
    integer(c_int)                                   ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ExtractMyRowCopy(int LocalRow, int LenOfIndices, int& NumIndices, int* Indices) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_ExtractMyRowCopy ( CT_Epetra_CrsGraph_ID_t selfID, int LocalRow, int LenOfIndices, int * NumIndices, int * Indices );

  integer(c_int) function Epetra_CrsGraph_ExtractMyRowCopy ( selfID, LocalRow, LenOfIndices, &
        NumIndices, Indices ) bind(C,name='Epetra_CrsGraph_ExtractMyRowCopy')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LocalRow
    integer(c_int)               ,intent(in)   ,value              :: LenOfIndices
    integer(c_int)               ,intent(inout)                    :: NumIndices
    integer(c_int)                                   ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ExtractGlobalRowView(int GlobalRow, int& NumIndices, int*& Indices) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_ExtractGlobalRowView ( CT_Epetra_CrsGraph_ID_t selfID, int GlobalRow, int * NumIndices, int ** Indices );

  integer(c_int) function Epetra_CrsGraph_ExtractGlobalRowView ( selfID, GlobalRow, &
        NumIndices, Indices ) bind(C,name='Epetra_CrsGraph_ExtractGlobalRowView')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GlobalRow
    integer(c_int)               ,intent(inout)                    :: NumIndices
    integer(c_int)               ,intent(inout)      ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ExtractMyRowView(int LocalRow, int& NumIndices, int*& Indices) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_ExtractMyRowView ( CT_Epetra_CrsGraph_ID_t selfID, int LocalRow, int * NumIndices, int ** Indices );

  integer(c_int) function Epetra_CrsGraph_ExtractMyRowView ( selfID, LocalRow, NumIndices, &
        Indices ) bind(C,name='Epetra_CrsGraph_ExtractMyRowView')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LocalRow
    integer(c_int)               ,intent(inout)                    :: NumIndices
    integer(c_int)               ,intent(inout)      ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! bool Filled() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_Filled ( CT_Epetra_CrsGraph_ID_t selfID );

  logical(c_bool) function Epetra_CrsGraph_Filled ( selfID ) &
        bind(C,name='Epetra_CrsGraph_Filled')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool StorageOptimized() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_StorageOptimized ( CT_Epetra_CrsGraph_ID_t selfID );

  logical(c_bool) function Epetra_CrsGraph_StorageOptimized ( selfID ) &
        bind(C,name='Epetra_CrsGraph_StorageOptimized')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool IndicesAreGlobal() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_IndicesAreGlobal ( CT_Epetra_CrsGraph_ID_t selfID );

  logical(c_bool) function Epetra_CrsGraph_IndicesAreGlobal ( selfID ) &
        bind(C,name='Epetra_CrsGraph_IndicesAreGlobal')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool IndicesAreLocal() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_IndicesAreLocal ( CT_Epetra_CrsGraph_ID_t selfID );

  logical(c_bool) function Epetra_CrsGraph_IndicesAreLocal ( selfID ) &
        bind(C,name='Epetra_CrsGraph_IndicesAreLocal')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool LowerTriangular() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_LowerTriangular ( CT_Epetra_CrsGraph_ID_t selfID );

  logical(c_bool) function Epetra_CrsGraph_LowerTriangular ( selfID ) &
        bind(C,name='Epetra_CrsGraph_LowerTriangular')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool UpperTriangular() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_UpperTriangular ( CT_Epetra_CrsGraph_ID_t selfID );

  logical(c_bool) function Epetra_CrsGraph_UpperTriangular ( selfID ) &
        bind(C,name='Epetra_CrsGraph_UpperTriangular')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool NoDiagonal() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_NoDiagonal ( CT_Epetra_CrsGraph_ID_t selfID );

  logical(c_bool) function Epetra_CrsGraph_NoDiagonal ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NoDiagonal')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool MyGlobalRow(int GID) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_MyGlobalRow ( CT_Epetra_CrsGraph_ID_t selfID, int GID );

  logical(c_bool) function Epetra_CrsGraph_MyGlobalRow ( selfID, GID ) &
        bind(C,name='Epetra_CrsGraph_MyGlobalRow')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GID
  end function


  ! Original C++ prototype:
  ! bool HaveColMap() const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_HaveColMap ( CT_Epetra_CrsGraph_ID_t selfID );

  logical(c_bool) function Epetra_CrsGraph_HaveColMap ( selfID ) &
        bind(C,name='Epetra_CrsGraph_HaveColMap')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyRows() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyRows ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumMyRows ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumMyRows')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalRows() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalRows ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumGlobalRows ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalRows')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyCols() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyCols ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumMyCols ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumMyCols')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalCols() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalCols ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumGlobalCols ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalCols')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalNonzeros() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalNonzeros ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumGlobalNonzeros ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalNonzeros')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalDiagonals() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalDiagonals ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumGlobalDiagonals ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalDiagonals')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyDiagonals() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyDiagonals ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumMyDiagonals ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumMyDiagonals')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyBlockRows() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyBlockRows ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumMyBlockRows ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumMyBlockRows')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalBlockRows() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalBlockRows ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumGlobalBlockRows ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalBlockRows')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyBlockCols() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyBlockCols ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumMyBlockCols ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumMyBlockCols')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalBlockCols() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalBlockCols ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumGlobalBlockCols ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalBlockCols')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyBlockDiagonals() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyBlockDiagonals ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumMyBlockDiagonals ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumMyBlockDiagonals')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalBlockDiagonals() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalBlockDiagonals ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumGlobalBlockDiagonals ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalBlockDiagonals')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalEntries() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalEntries ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumGlobalEntries ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalEntries')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyEntries() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyEntries ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumMyEntries ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumMyEntries')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MaxRowDim() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_MaxRowDim ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_MaxRowDim ( selfID ) &
        bind(C,name='Epetra_CrsGraph_MaxRowDim')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int GlobalMaxRowDim() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_GlobalMaxRowDim ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_GlobalMaxRowDim ( selfID ) &
        bind(C,name='Epetra_CrsGraph_GlobalMaxRowDim')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MaxColDim() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_MaxColDim ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_MaxColDim ( selfID ) &
        bind(C,name='Epetra_CrsGraph_MaxColDim')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int GlobalMaxColDim() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_GlobalMaxColDim ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_GlobalMaxColDim ( selfID ) &
        bind(C,name='Epetra_CrsGraph_GlobalMaxColDim')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyNonzeros() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyNonzeros ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_NumMyNonzeros ( selfID ) &
        bind(C,name='Epetra_CrsGraph_NumMyNonzeros')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalIndices(int Row) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumGlobalIndices ( CT_Epetra_CrsGraph_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsGraph_NumGlobalIndices ( selfID, Row ) &
        bind(C,name='Epetra_CrsGraph_NumGlobalIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int NumAllocatedGlobalIndices(int Row) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumAllocatedGlobalIndices ( CT_Epetra_CrsGraph_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsGraph_NumAllocatedGlobalIndices ( selfID, Row ) &
        bind(C,name='Epetra_CrsGraph_NumAllocatedGlobalIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int MaxNumIndices() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_MaxNumIndices ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_MaxNumIndices ( selfID ) &
        bind(C,name='Epetra_CrsGraph_MaxNumIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int GlobalMaxNumIndices() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_GlobalMaxNumIndices ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_GlobalMaxNumIndices ( selfID ) &
        bind(C,name='Epetra_CrsGraph_GlobalMaxNumIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MaxNumNonzeros() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_MaxNumNonzeros ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_MaxNumNonzeros ( selfID ) &
        bind(C,name='Epetra_CrsGraph_MaxNumNonzeros')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int GlobalMaxNumNonzeros() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_GlobalMaxNumNonzeros ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_GlobalMaxNumNonzeros ( selfID ) &
        bind(C,name='Epetra_CrsGraph_GlobalMaxNumNonzeros')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyIndices(int Row) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumMyIndices ( CT_Epetra_CrsGraph_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsGraph_NumMyIndices ( selfID, Row ) &
        bind(C,name='Epetra_CrsGraph_NumMyIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int NumAllocatedMyIndices(int Row) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_NumAllocatedMyIndices ( CT_Epetra_CrsGraph_ID_t selfID, int Row );

  integer(c_int) function Epetra_CrsGraph_NumAllocatedMyIndices ( selfID, Row ) &
        bind(C,name='Epetra_CrsGraph_NumAllocatedMyIndices')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: Row
  end function


  ! Original C++ prototype:
  ! int IndexBase() const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_IndexBase ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_IndexBase ( selfID ) &
        bind(C,name='Epetra_CrsGraph_IndexBase')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap& RowMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_CrsGraph_RowMap ( CT_Epetra_CrsGraph_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_CrsGraph_RowMap ( selfID ) &
        bind(C,name='Epetra_CrsGraph_RowMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ReplaceRowMap(const Epetra_BlockMap& newmap);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_ReplaceRowMap ( CT_Epetra_CrsGraph_ID_t selfID, CT_Epetra_BlockMap_ID_t newmapID );

  integer(c_int) function Epetra_CrsGraph_ReplaceRowMap ( selfID, newmapID ) &
        bind(C,name='Epetra_CrsGraph_ReplaceRowMap')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: newmapID
  end function


  ! Original C++ prototype:
  ! int ReplaceColMap(const Epetra_BlockMap& newmap);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_ReplaceColMap ( CT_Epetra_CrsGraph_ID_t selfID, CT_Epetra_BlockMap_ID_t newmapID );

  integer(c_int) function Epetra_CrsGraph_ReplaceColMap ( selfID, newmapID ) &
        bind(C,name='Epetra_CrsGraph_ReplaceColMap')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: newmapID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap& ColMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_CrsGraph_ColMap ( CT_Epetra_CrsGraph_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_CrsGraph_ColMap ( selfID ) &
        bind(C,name='Epetra_CrsGraph_ColMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap& DomainMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_CrsGraph_DomainMap ( CT_Epetra_CrsGraph_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_CrsGraph_DomainMap ( selfID ) &
        bind(C,name='Epetra_CrsGraph_DomainMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap& RangeMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_CrsGraph_RangeMap ( CT_Epetra_CrsGraph_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_CrsGraph_RangeMap ( selfID ) &
        bind(C,name='Epetra_CrsGraph_RangeMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Import* Importer() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Import_ID_t Epetra_CrsGraph_Importer ( CT_Epetra_CrsGraph_ID_t selfID );

  type(FT_Epetra_Import_ID_t) function Epetra_CrsGraph_Importer ( selfID ) &
        bind(C,name='Epetra_CrsGraph_Importer')
    import :: FT_Epetra_Import_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Export* Exporter() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Export_ID_t Epetra_CrsGraph_Exporter ( CT_Epetra_CrsGraph_ID_t selfID );

  type(FT_Epetra_Export_ID_t) function Epetra_CrsGraph_Exporter ( selfID ) &
        bind(C,name='Epetra_CrsGraph_Exporter')
    import :: FT_Epetra_Export_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Comm& Comm() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_CrsGraph_Comm ( CT_Epetra_CrsGraph_ID_t selfID );

  type(FT_Epetra_Comm_ID_t) function Epetra_CrsGraph_Comm ( selfID ) &
        bind(C,name='Epetra_CrsGraph_Comm')
    import :: FT_Epetra_Comm_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int LRID(int GRID_in) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_LRID ( CT_Epetra_CrsGraph_ID_t selfID, int GRID_in );

  integer(c_int) function Epetra_CrsGraph_LRID ( selfID, GRID_in ) &
        bind(C,name='Epetra_CrsGraph_LRID')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GRID_in
  end function


  ! Original C++ prototype:
  ! int GRID(int LRID_in) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_GRID ( CT_Epetra_CrsGraph_ID_t selfID, int LRID_in );

  integer(c_int) function Epetra_CrsGraph_GRID ( selfID, LRID_in ) &
        bind(C,name='Epetra_CrsGraph_GRID')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LRID_in
  end function


  ! Original C++ prototype:
  ! int LCID(int GCID_in) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_LCID ( CT_Epetra_CrsGraph_ID_t selfID, int GCID_in );

  integer(c_int) function Epetra_CrsGraph_LCID ( selfID, GCID_in ) &
        bind(C,name='Epetra_CrsGraph_LCID')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GCID_in
  end function


  ! Original C++ prototype:
  ! int GCID(int LCID_in) const;
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_GCID ( CT_Epetra_CrsGraph_ID_t selfID, int LCID_in );

  integer(c_int) function Epetra_CrsGraph_GCID ( selfID, LCID_in ) &
        bind(C,name='Epetra_CrsGraph_GCID')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LCID_in
  end function


  ! Original C++ prototype:
  ! bool MyGRID(int GRID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_MyGRID ( CT_Epetra_CrsGraph_ID_t selfID, int GRID_in );

  logical(c_bool) function Epetra_CrsGraph_MyGRID ( selfID, GRID_in ) &
        bind(C,name='Epetra_CrsGraph_MyGRID')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GRID_in
  end function


  ! Original C++ prototype:
  ! bool MyLRID(int LRID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_MyLRID ( CT_Epetra_CrsGraph_ID_t selfID, int LRID_in );

  logical(c_bool) function Epetra_CrsGraph_MyLRID ( selfID, LRID_in ) &
        bind(C,name='Epetra_CrsGraph_MyLRID')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LRID_in
  end function


  ! Original C++ prototype:
  ! bool MyGCID(int GCID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_MyGCID ( CT_Epetra_CrsGraph_ID_t selfID, int GCID_in );

  logical(c_bool) function Epetra_CrsGraph_MyGCID ( selfID, GCID_in ) &
        bind(C,name='Epetra_CrsGraph_MyGCID')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GCID_in
  end function


  ! Original C++ prototype:
  ! bool MyLCID(int LCID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_CrsGraph_MyLCID ( CT_Epetra_CrsGraph_ID_t selfID, int LCID_in );

  logical(c_bool) function Epetra_CrsGraph_MyLCID ( selfID, LCID_in ) &
        bind(C,name='Epetra_CrsGraph_MyLCID')
    import :: c_bool ,FT_Epetra_CrsGraph_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LCID_in
  end function


  ! Original C++ prototype:
  ! inline int* operator[]( int Loc ) const;
  ! CTrilinos prototype:
  ! int * Epetra_CrsGraph_getRow ( CT_Epetra_CrsGraph_ID_t selfID, int Loc );

  type(c_ptr) function Epetra_CrsGraph_getRow ( selfID, Loc ) &
        bind(C,name='Epetra_CrsGraph_getRow')
    import :: c_ptr ,FT_Epetra_CrsGraph_ID_t ,c_int
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: Loc
  end function


  ! Original C++ prototype:
  ! Epetra_CrsGraph& operator = (const Epetra_CrsGraph& Source);
  ! CTrilinos prototype:
  ! void Epetra_CrsGraph_Assign ( CT_Epetra_CrsGraph_ID_t selfID, CT_Epetra_CrsGraph_ID_t SourceID );

  subroutine Epetra_CrsGraph_Assign ( selfID, SourceID ) &
        bind(C,name='Epetra_CrsGraph_Assign')
    import :: FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: SourceID
  end subroutine


  ! Original C++ prototype:
  ! const Epetra_BlockMap& ImportMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_CrsGraph_ImportMap ( CT_Epetra_CrsGraph_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_CrsGraph_ImportMap ( selfID ) &
        bind(C,name='Epetra_CrsGraph_ImportMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int TransformToLocal();
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_TransformToLocal ( CT_Epetra_CrsGraph_ID_t selfID );

  integer(c_int) function Epetra_CrsGraph_TransformToLocal ( selfID ) &
        bind(C,name='Epetra_CrsGraph_TransformToLocal')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int TransformToLocal(const Epetra_BlockMap* DomainMap, const Epetra_BlockMap* RangeMap);
  ! CTrilinos prototype:
  ! int Epetra_CrsGraph_TransformToLocal_UsingMaps ( CT_Epetra_CrsGraph_ID_t selfID, CT_Epetra_BlockMap_ID_t DomainMapID, CT_Epetra_BlockMap_ID_t RangeMapID );

  integer(c_int) function Epetra_CrsGraph_TransformToLocal_UsingMaps ( selfID, DomainMapID, &
        RangeMapID ) bind(C,name='Epetra_CrsGraph_TransformToLocal_UsingMaps')
    import :: c_int ,FT_Epetra_CrsGraph_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_CrsGraph_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: DomainMapID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: RangeMapID
  end function


  ! _________________ Epetra_DistObject interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_DistObject_ID_t Epetra_DistObject_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_DistObject_ID_t) function Epetra_DistObject_Cast ( id ) &
        bind(C,name='Epetra_DistObject_Cast')
    import :: FT_Epetra_DistObject_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t)  ,intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_DistObject_Abstract ( CT_Epetra_DistObject_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_DistObject_Abstract ( id ) &
        bind(C,name='Epetra_DistObject_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_DistObject_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_DistObject();
  ! CTrilinos prototype:
  ! void Epetra_DistObject_Destroy ( CT_Epetra_DistObject_ID_t * selfID );

  subroutine Epetra_DistObject_Destroy ( selfID ) bind(C,name='Epetra_DistObject_Destroy')
    import :: FT_Epetra_DistObject_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int Import(const Epetra_SrcDistObject& A, const Epetra_Import& Importer, Epetra_CombineMode CombineMode, const Epetra_OffsetIndex * Indexor = 0);
  ! CTrilinos prototype:
  ! int Epetra_DistObject_Import ( CT_Epetra_DistObject_ID_t selfID, CT_Epetra_SrcDistObject_ID_t AID, CT_Epetra_Import_ID_t ImporterID, Epetra_CombineMode CombineMode, CT_Epetra_OffsetIndex_ID_t IndexorID );

  integer(c_int) function Epetra_DistObject_Import ( selfID, AID, ImporterID, CombineMode, &
        IndexorID ) bind(C,name='Epetra_DistObject_Import')
    import :: c_int ,FT_Epetra_DistObject_ID_t ,FT_Epetra_SrcDistObject_ID_t , &
          FT_Epetra_Import_ID_t ,FT_Epetra_CombineMode_E_t ,FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_SrcDistObject_ID_t),intent(in)   ,value              :: AID
    type(FT_Epetra_Import_ID_t)    ,intent(in)   ,value              :: ImporterID
    integer(FT_Epetra_CombineMode_E_t),intent(in)   ,value              :: CombineMode
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: IndexorID
  end function


  ! Original C++ prototype:
  ! int Import(const Epetra_SrcDistObject& A, const Epetra_Export& Exporter, Epetra_CombineMode CombineMode, const Epetra_OffsetIndex * Indexor = 0);
  ! CTrilinos prototype:
  ! int Epetra_DistObject_Import_UsingExporter ( CT_Epetra_DistObject_ID_t selfID, CT_Epetra_SrcDistObject_ID_t AID, CT_Epetra_Export_ID_t ExporterID, Epetra_CombineMode CombineMode, CT_Epetra_OffsetIndex_ID_t IndexorID );

  integer(c_int) function Epetra_DistObject_Import_UsingExporter ( selfID, AID, ExporterID, &
        CombineMode, IndexorID ) bind(C,name='Epetra_DistObject_Import_UsingExporter')
    import :: c_int ,FT_Epetra_DistObject_ID_t ,FT_Epetra_SrcDistObject_ID_t , &
          FT_Epetra_Export_ID_t ,FT_Epetra_CombineMode_E_t ,FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_SrcDistObject_ID_t),intent(in)   ,value              :: AID
    type(FT_Epetra_Export_ID_t)    ,intent(in)   ,value              :: ExporterID
    integer(FT_Epetra_CombineMode_E_t),intent(in)   ,value              :: CombineMode
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: IndexorID
  end function


  ! Original C++ prototype:
  ! int Export(const Epetra_SrcDistObject& A, const Epetra_Import & Importer, Epetra_CombineMode CombineMode, const Epetra_OffsetIndex * Indexor = 0);
  ! CTrilinos prototype:
  ! int Epetra_DistObject_Export_UsingImporter ( CT_Epetra_DistObject_ID_t selfID, CT_Epetra_SrcDistObject_ID_t AID, CT_Epetra_Import_ID_t ImporterID, Epetra_CombineMode CombineMode, CT_Epetra_OffsetIndex_ID_t IndexorID );

  integer(c_int) function Epetra_DistObject_Export_UsingImporter ( selfID, AID, ImporterID, &
        CombineMode, IndexorID ) bind(C,name='Epetra_DistObject_Export_UsingImporter')
    import :: c_int ,FT_Epetra_DistObject_ID_t ,FT_Epetra_SrcDistObject_ID_t , &
          FT_Epetra_Import_ID_t ,FT_Epetra_CombineMode_E_t ,FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_SrcDistObject_ID_t),intent(in)   ,value              :: AID
    type(FT_Epetra_Import_ID_t)    ,intent(in)   ,value              :: ImporterID
    integer(FT_Epetra_CombineMode_E_t),intent(in)   ,value              :: CombineMode
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: IndexorID
  end function


  ! Original C++ prototype:
  ! int Export(const Epetra_SrcDistObject& A, const Epetra_Export& Exporter, Epetra_CombineMode CombineMode, const Epetra_OffsetIndex * Indexor = 0);
  ! CTrilinos prototype:
  ! int Epetra_DistObject_Export ( CT_Epetra_DistObject_ID_t selfID, CT_Epetra_SrcDistObject_ID_t AID, CT_Epetra_Export_ID_t ExporterID, Epetra_CombineMode CombineMode, CT_Epetra_OffsetIndex_ID_t IndexorID );

  integer(c_int) function Epetra_DistObject_Export ( selfID, AID, ExporterID, CombineMode, &
        IndexorID ) bind(C,name='Epetra_DistObject_Export')
    import :: c_int ,FT_Epetra_DistObject_ID_t ,FT_Epetra_SrcDistObject_ID_t , &
          FT_Epetra_Export_ID_t ,FT_Epetra_CombineMode_E_t ,FT_Epetra_OffsetIndex_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_SrcDistObject_ID_t),intent(in)   ,value              :: AID
    type(FT_Epetra_Export_ID_t)    ,intent(in)   ,value              :: ExporterID
    integer(FT_Epetra_CombineMode_E_t),intent(in)   ,value              :: CombineMode
    type(FT_Epetra_OffsetIndex_ID_t),intent(in)   ,value              :: IndexorID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap& Map() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_DistObject_Map ( CT_Epetra_DistObject_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_DistObject_Map ( selfID ) &
        bind(C,name='Epetra_DistObject_Map')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_DistObject_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_Comm& Comm() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_DistObject_Comm ( CT_Epetra_DistObject_ID_t selfID );

  type(FT_Epetra_Comm_ID_t) function Epetra_DistObject_Comm ( selfID ) &
        bind(C,name='Epetra_DistObject_Comm')
    import :: FT_Epetra_Comm_ID_t ,FT_Epetra_DistObject_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool DistributedGlobal() const;
  ! CTrilinos prototype:
  ! boolean Epetra_DistObject_DistributedGlobal ( CT_Epetra_DistObject_ID_t selfID );

  logical(c_bool) function Epetra_DistObject_DistributedGlobal ( selfID ) &
        bind(C,name='Epetra_DistObject_DistributedGlobal')
    import :: c_bool ,FT_Epetra_DistObject_ID_t
    implicit none
    type(FT_Epetra_DistObject_ID_t),intent(in)   ,value              :: selfID
  end function


  ! _________________ Epetra_Vector interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Vector_ID_t Epetra_Vector_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Vector_ID_t) function Epetra_Vector_Cast ( id ) &
        bind(C,name='Epetra_Vector_Cast')
    import :: FT_Epetra_Vector_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Vector_Abstract ( CT_Epetra_Vector_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Vector_Abstract ( id ) &
        bind(C,name='Epetra_Vector_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_Vector(const Epetra_BlockMap& Map, bool zeroOut = true);
  ! CTrilinos prototype:
  ! CT_Epetra_Vector_ID_t Epetra_Vector_Create ( CT_Epetra_BlockMap_ID_t MapID, boolean zeroOut );

  type(FT_Epetra_Vector_ID_t) function Epetra_Vector_Create ( MapID, zeroOut ) &
        bind(C,name='Epetra_Vector_Create')
    import :: FT_Epetra_Vector_ID_t ,FT_Epetra_BlockMap_ID_t ,c_bool
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: MapID
    logical(c_bool)             ,intent(in)   ,value              :: zeroOut
  end function


  ! Original C++ prototype:
  ! Epetra_Vector(const Epetra_Vector& Source);
  ! CTrilinos prototype:
  ! CT_Epetra_Vector_ID_t Epetra_Vector_Duplicate ( CT_Epetra_Vector_ID_t SourceID );

  type(FT_Epetra_Vector_ID_t) function Epetra_Vector_Duplicate ( SourceID ) &
        bind(C,name='Epetra_Vector_Duplicate')
    import :: FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: SourceID
  end function


  ! Original C++ prototype:
  ! Epetra_Vector(Epetra_DataAccess CV, const Epetra_BlockMap& Map, double *V);
  ! CTrilinos prototype:
  ! CT_Epetra_Vector_ID_t Epetra_Vector_Create_FromArray ( Epetra_DataAccess CV, CT_Epetra_BlockMap_ID_t MapID, double * V );

  type(FT_Epetra_Vector_ID_t) function Epetra_Vector_Create_FromArray ( CV, MapID, V ) &
        bind(C,name='Epetra_Vector_Create_FromArray')
    import :: FT_Epetra_Vector_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_BlockMap_ID_t , &
          c_double
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: MapID
    real(c_double)                                  ,dimension(*) :: V
  end function


  ! Original C++ prototype:
  ! Epetra_Vector(Epetra_DataAccess CV, const Epetra_MultiVector& Source, int Index);
  ! CTrilinos prototype:
  ! CT_Epetra_Vector_ID_t Epetra_Vector_FromSource ( Epetra_DataAccess CV, CT_Epetra_MultiVector_ID_t SourceID, int Index );

  type(FT_Epetra_Vector_ID_t) function Epetra_Vector_FromSource ( CV, SourceID, Index ) &
        bind(C,name='Epetra_Vector_FromSource')
    import :: FT_Epetra_Vector_ID_t ,FT_Epetra_DataAccess_E_t ,FT_Epetra_MultiVector_ID_t , &
          c_int
    implicit none
    integer(FT_Epetra_DataAccess_E_t),intent(in)   ,value              :: CV
    type(FT_Epetra_MultiVector_ID_t),intent(in)   ,value              :: SourceID
    integer(c_int)              ,intent(in)   ,value              :: Index
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Vector ();
  ! CTrilinos prototype:
  ! void Epetra_Vector_Destroy ( CT_Epetra_Vector_ID_t * selfID );

  subroutine Epetra_Vector_Destroy ( selfID ) bind(C,name='Epetra_Vector_Destroy')
    import :: FT_Epetra_Vector_ID_t
    implicit none
    type(FT_Epetra_Vector_ID_t)                                   :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int ReplaceGlobalValues(int NumEntries, double * Values, int * Indices);
  ! CTrilinos prototype:
  ! int Epetra_Vector_ReplaceGlobalValues ( CT_Epetra_Vector_ID_t selfID, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_Vector_ReplaceGlobalValues ( selfID, NumEntries, Values, &
        Indices ) bind(C,name='Epetra_Vector_ReplaceGlobalValues')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: NumEntries
    real(c_double)                                  ,dimension(*) :: Values
    integer(c_int)                                  ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ReplaceMyValues(int NumEntries, double * Values, int * Indices);
  ! CTrilinos prototype:
  ! int Epetra_Vector_ReplaceMyValues ( CT_Epetra_Vector_ID_t selfID, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_Vector_ReplaceMyValues ( selfID, NumEntries, Values, &
        Indices ) bind(C,name='Epetra_Vector_ReplaceMyValues')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: NumEntries
    real(c_double)                                  ,dimension(*) :: Values
    integer(c_int)                                  ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int SumIntoGlobalValues(int NumEntries, double * Values, int * Indices);
  ! CTrilinos prototype:
  ! int Epetra_Vector_SumIntoGlobalValues ( CT_Epetra_Vector_ID_t selfID, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_Vector_SumIntoGlobalValues ( selfID, NumEntries, Values, &
        Indices ) bind(C,name='Epetra_Vector_SumIntoGlobalValues')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: NumEntries
    real(c_double)                                  ,dimension(*) :: Values
    integer(c_int)                                  ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int SumIntoMyValues(int NumEntries, double * Values, int * Indices);
  ! CTrilinos prototype:
  ! int Epetra_Vector_SumIntoMyValues ( CT_Epetra_Vector_ID_t selfID, int NumEntries, double * Values, int * Indices );

  integer(c_int) function Epetra_Vector_SumIntoMyValues ( selfID, NumEntries, Values, &
        Indices ) bind(C,name='Epetra_Vector_SumIntoMyValues')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: NumEntries
    real(c_double)                                  ,dimension(*) :: Values
    integer(c_int)                                  ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ReplaceGlobalValues(int NumEntries, int BlockOffset, double * Values, int * Indices);
  ! CTrilinos prototype:
  ! int Epetra_Vector_ReplaceGlobalValues_BlockPos ( CT_Epetra_Vector_ID_t selfID, int NumEntries, int BlockOffset, double * Values, int * Indices );

  integer(c_int) function Epetra_Vector_ReplaceGlobalValues_BlockPos ( selfID, NumEntries, &
        BlockOffset, Values, Indices ) &
        bind(C,name='Epetra_Vector_ReplaceGlobalValues_BlockPos')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: NumEntries
    integer(c_int)              ,intent(in)   ,value              :: BlockOffset
    real(c_double)                                  ,dimension(*) :: Values
    integer(c_int)                                  ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ReplaceMyValues(int NumEntries, int BlockOffset, double * Values, int * Indices);
  ! CTrilinos prototype:
  ! int Epetra_Vector_ReplaceMyValues_BlockPos ( CT_Epetra_Vector_ID_t selfID, int NumEntries, int BlockOffset, double * Values, int * Indices );

  integer(c_int) function Epetra_Vector_ReplaceMyValues_BlockPos ( selfID, NumEntries, &
        BlockOffset, Values, Indices ) &
        bind(C,name='Epetra_Vector_ReplaceMyValues_BlockPos')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: NumEntries
    integer(c_int)              ,intent(in)   ,value              :: BlockOffset
    real(c_double)                                  ,dimension(*) :: Values
    integer(c_int)                                  ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int SumIntoGlobalValues(int NumEntries, int BlockOffset, double * Values, int * Indices);
  ! CTrilinos prototype:
  ! int Epetra_Vector_SumIntoGlobalValues_BlockPos ( CT_Epetra_Vector_ID_t selfID, int NumEntries, int BlockOffset, double * Values, int * Indices );

  integer(c_int) function Epetra_Vector_SumIntoGlobalValues_BlockPos ( selfID, NumEntries, &
        BlockOffset, Values, Indices ) &
        bind(C,name='Epetra_Vector_SumIntoGlobalValues_BlockPos')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: NumEntries
    integer(c_int)              ,intent(in)   ,value              :: BlockOffset
    real(c_double)                                  ,dimension(*) :: Values
    integer(c_int)                                  ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int SumIntoMyValues(int NumEntries, int BlockOffset, double * Values, int * Indices);
  ! CTrilinos prototype:
  ! int Epetra_Vector_SumIntoMyValues_BlockPos ( CT_Epetra_Vector_ID_t selfID, int NumEntries, int BlockOffset, double * Values, int * Indices );

  integer(c_int) function Epetra_Vector_SumIntoMyValues_BlockPos ( selfID, NumEntries, &
        BlockOffset, Values, Indices ) &
        bind(C,name='Epetra_Vector_SumIntoMyValues_BlockPos')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: NumEntries
    integer(c_int)              ,intent(in)   ,value              :: BlockOffset
    real(c_double)                                  ,dimension(*) :: Values
    integer(c_int)                                  ,dimension(*) :: Indices
  end function


  ! Original C++ prototype:
  ! int ExtractCopy(double *V) const;
  ! CTrilinos prototype:
  ! int Epetra_Vector_ExtractCopy ( CT_Epetra_Vector_ID_t selfID, double * V );

  integer(c_int) function Epetra_Vector_ExtractCopy ( selfID, V ) &
        bind(C,name='Epetra_Vector_ExtractCopy')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: V
  end function


  ! Original C++ prototype:
  ! int ExtractView(double **V) const;
  ! CTrilinos prototype:
  ! int Epetra_Vector_ExtractView ( CT_Epetra_Vector_ID_t selfID, double ** V );

  integer(c_int) function Epetra_Vector_ExtractView ( selfID, V ) &
        bind(C,name='Epetra_Vector_ExtractView')
    import :: c_int ,FT_Epetra_Vector_ID_t ,c_double
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    real(c_double)                                  ,dimension(*) :: V
  end function


  ! Original C++ prototype:
  ! const double& operator [] (int index) const;
  ! CTrilinos prototype:
  ! double Epetra_Vector_getElement ( CT_Epetra_Vector_ID_t selfID, int index );

  real(c_double) function Epetra_Vector_getElement ( selfID, index ) &
        bind(C,name='Epetra_Vector_getElement')
    import :: c_double ,FT_Epetra_Vector_ID_t ,c_int
    implicit none
    type(FT_Epetra_Vector_ID_t) ,intent(in)   ,value              :: selfID
    integer(c_int)              ,intent(in)   ,value              :: index
  end function


  ! _________________ Epetra_Export interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Export_ID_t Epetra_Export_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Export_ID_t) function Epetra_Export_Cast ( id ) &
        bind(C,name='Epetra_Export_Cast')
    import :: FT_Epetra_Export_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Export_Abstract ( CT_Epetra_Export_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Export_Abstract ( id ) &
        bind(C,name='Epetra_Export_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_Export( const Epetra_BlockMap & SourceMap, const Epetra_BlockMap & TargetMap );
  ! CTrilinos prototype:
  ! CT_Epetra_Export_ID_t Epetra_Export_Create ( CT_Epetra_BlockMap_ID_t SourceMapID, CT_Epetra_BlockMap_ID_t TargetMapID );

  type(FT_Epetra_Export_ID_t) function Epetra_Export_Create ( SourceMapID, TargetMapID ) &
        bind(C,name='Epetra_Export_Create')
    import :: FT_Epetra_Export_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: SourceMapID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: TargetMapID
  end function


  ! Original C++ prototype:
  ! Epetra_Export(const Epetra_Export& Exporter);
  ! CTrilinos prototype:
  ! CT_Epetra_Export_ID_t Epetra_Export_Duplicate ( CT_Epetra_Export_ID_t ExporterID );

  type(FT_Epetra_Export_ID_t) function Epetra_Export_Duplicate ( ExporterID ) &
        bind(C,name='Epetra_Export_Duplicate')
    import :: FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: ExporterID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Export(void);
  ! CTrilinos prototype:
  ! void Epetra_Export_Destroy ( CT_Epetra_Export_ID_t * selfID );

  subroutine Epetra_Export_Destroy ( selfID ) bind(C,name='Epetra_Export_Destroy')
    import :: FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t)                                   :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int NumSameIDs() const;
  ! CTrilinos prototype:
  ! int Epetra_Export_NumSameIDs ( CT_Epetra_Export_ID_t selfID );

  integer(c_int) function Epetra_Export_NumSameIDs ( selfID ) &
        bind(C,name='Epetra_Export_NumSameIDs')
    import :: c_int ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumPermuteIDs() const;
  ! CTrilinos prototype:
  ! int Epetra_Export_NumPermuteIDs ( CT_Epetra_Export_ID_t selfID );

  integer(c_int) function Epetra_Export_NumPermuteIDs ( selfID ) &
        bind(C,name='Epetra_Export_NumPermuteIDs')
    import :: c_int ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * PermuteFromLIDs () const;
  ! CTrilinos prototype:
  ! int * Epetra_Export_PermuteFromLIDs ( CT_Epetra_Export_ID_t selfID );

  type(c_ptr) function Epetra_Export_PermuteFromLIDs ( selfID ) &
        bind(C,name='Epetra_Export_PermuteFromLIDs')
    import :: c_ptr ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * PermuteToLIDs () const;
  ! CTrilinos prototype:
  ! int * Epetra_Export_PermuteToLIDs ( CT_Epetra_Export_ID_t selfID );

  type(c_ptr) function Epetra_Export_PermuteToLIDs ( selfID ) &
        bind(C,name='Epetra_Export_PermuteToLIDs')
    import :: c_ptr ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumRemoteIDs() const;
  ! CTrilinos prototype:
  ! int Epetra_Export_NumRemoteIDs ( CT_Epetra_Export_ID_t selfID );

  integer(c_int) function Epetra_Export_NumRemoteIDs ( selfID ) &
        bind(C,name='Epetra_Export_NumRemoteIDs')
    import :: c_int ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * RemoteLIDs() const;
  ! CTrilinos prototype:
  ! int * Epetra_Export_RemoteLIDs ( CT_Epetra_Export_ID_t selfID );

  type(c_ptr) function Epetra_Export_RemoteLIDs ( selfID ) &
        bind(C,name='Epetra_Export_RemoteLIDs')
    import :: c_ptr ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumExportIDs () const;
  ! CTrilinos prototype:
  ! int Epetra_Export_NumExportIDs ( CT_Epetra_Export_ID_t selfID );

  integer(c_int) function Epetra_Export_NumExportIDs ( selfID ) &
        bind(C,name='Epetra_Export_NumExportIDs')
    import :: c_int ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * ExportLIDs () const;
  ! CTrilinos prototype:
  ! int * Epetra_Export_ExportLIDs ( CT_Epetra_Export_ID_t selfID );

  type(c_ptr) function Epetra_Export_ExportLIDs ( selfID ) &
        bind(C,name='Epetra_Export_ExportLIDs')
    import :: c_ptr ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * ExportPIDs () const;
  ! CTrilinos prototype:
  ! int * Epetra_Export_ExportPIDs ( CT_Epetra_Export_ID_t selfID );

  type(c_ptr) function Epetra_Export_ExportPIDs ( selfID ) &
        bind(C,name='Epetra_Export_ExportPIDs')
    import :: c_ptr ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumSend() const;
  ! CTrilinos prototype:
  ! int Epetra_Export_NumSend ( CT_Epetra_Export_ID_t selfID );

  integer(c_int) function Epetra_Export_NumSend ( selfID ) &
        bind(C,name='Epetra_Export_NumSend')
    import :: c_int ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumRecv() const;
  ! CTrilinos prototype:
  ! int Epetra_Export_NumRecv ( CT_Epetra_Export_ID_t selfID );

  integer(c_int) function Epetra_Export_NumRecv ( selfID ) &
        bind(C,name='Epetra_Export_NumRecv')
    import :: c_int ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap & SourceMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_Export_SourceMap ( CT_Epetra_Export_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_Export_SourceMap ( selfID ) &
        bind(C,name='Epetra_Export_SourceMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap & TargetMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_Export_TargetMap ( CT_Epetra_Export_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_Export_TargetMap ( selfID ) &
        bind(C,name='Epetra_Export_TargetMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_Distributor & Distributor() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Distributor_ID_t Epetra_Export_Distributor ( CT_Epetra_Export_ID_t selfID );

  type(FT_Epetra_Distributor_ID_t) function Epetra_Export_Distributor ( selfID ) &
        bind(C,name='Epetra_Export_Distributor')
    import :: FT_Epetra_Distributor_ID_t ,FT_Epetra_Export_ID_t
    implicit none
    type(FT_Epetra_Export_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! _________________ Epetra_Map interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_Map_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Map_ID_t) function Epetra_Map_Cast ( id ) bind(C,name='Epetra_Map_Cast')
    import :: FT_Epetra_Map_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Map_Abstract ( CT_Epetra_Map_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Map_Abstract ( id ) &
        bind(C,name='Epetra_Map_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Map_ID_t
    implicit none
    type(FT_Epetra_Map_ID_t)    ,intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_Map(int NumGlobalElements, int IndexBase, const Epetra_Comm& Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_Map_Create ( int NumGlobalElements, int IndexBase, CT_Epetra_Comm_ID_t CommID );

  type(FT_Epetra_Map_ID_t) function Epetra_Map_Create ( NumGlobalElements, IndexBase, &
        CommID ) bind(C,name='Epetra_Map_Create')
    import :: FT_Epetra_Map_ID_t ,c_int ,FT_Epetra_Comm_ID_t
    implicit none
    integer(c_int)              ,intent(in)   ,value              :: NumGlobalElements
    integer(c_int)              ,intent(in)   ,value              :: IndexBase
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_Map(int NumGlobalElements, int NumMyElements, int IndexBase, const Epetra_Comm& Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_Map_Create_Linear ( int NumGlobalElements, int NumMyElements, int IndexBase, CT_Epetra_Comm_ID_t CommID );

  type(FT_Epetra_Map_ID_t) function Epetra_Map_Create_Linear ( NumGlobalElements, &
        NumMyElements, IndexBase, CommID ) bind(C,name='Epetra_Map_Create_Linear')
    import :: FT_Epetra_Map_ID_t ,c_int ,FT_Epetra_Comm_ID_t
    implicit none
    integer(c_int)              ,intent(in)   ,value              :: NumGlobalElements
    integer(c_int)              ,intent(in)   ,value              :: NumMyElements
    integer(c_int)              ,intent(in)   ,value              :: IndexBase
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_Map(int NumGlobalElements, int NumMyElements, const int *MyGlobalElements, int IndexBase, const Epetra_Comm& Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_Map_Create_Arbitrary ( int NumGlobalElements, int NumMyElements, const int * MyGlobalElements, int IndexBase, CT_Epetra_Comm_ID_t CommID );

  type(FT_Epetra_Map_ID_t) function Epetra_Map_Create_Arbitrary ( NumGlobalElements, &
        NumMyElements, MyGlobalElements, IndexBase, CommID ) &
        bind(C,name='Epetra_Map_Create_Arbitrary')
    import :: FT_Epetra_Map_ID_t ,c_int ,FT_Epetra_Comm_ID_t
    implicit none
    integer(c_int)              ,intent(in)   ,value              :: NumGlobalElements
    integer(c_int)              ,intent(in)   ,value              :: NumMyElements
    integer(c_int)              ,intent(in)         ,dimension(*) :: MyGlobalElements
    integer(c_int)              ,intent(in)   ,value              :: IndexBase
    type(FT_Epetra_Comm_ID_t)   ,intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_Map(const Epetra_Map& map);
  ! CTrilinos prototype:
  ! CT_Epetra_Map_ID_t Epetra_Map_Duplicate ( CT_Epetra_Map_ID_t mapID );

  type(FT_Epetra_Map_ID_t) function Epetra_Map_Duplicate ( mapID ) &
        bind(C,name='Epetra_Map_Duplicate')
    import :: FT_Epetra_Map_ID_t
    implicit none
    type(FT_Epetra_Map_ID_t)    ,intent(in)   ,value              :: mapID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Map(void);
  ! CTrilinos prototype:
  ! void Epetra_Map_Destroy ( CT_Epetra_Map_ID_t * selfID );

  subroutine Epetra_Map_Destroy ( selfID ) bind(C,name='Epetra_Map_Destroy')
    import :: FT_Epetra_Map_ID_t
    implicit none
    type(FT_Epetra_Map_ID_t)                                      :: selfID
  end subroutine


  ! Original C++ prototype:
  ! Epetra_Map & operator=(const Epetra_Map & map);
  ! CTrilinos prototype:
  ! void Epetra_Map_Assign ( CT_Epetra_Map_ID_t selfID, CT_Epetra_Map_ID_t mapID );

  subroutine Epetra_Map_Assign ( selfID, mapID ) bind(C,name='Epetra_Map_Assign')
    import :: FT_Epetra_Map_ID_t
    implicit none
    type(FT_Epetra_Map_ID_t)    ,intent(in)   ,value              :: selfID
    type(FT_Epetra_Map_ID_t)    ,intent(in)   ,value              :: mapID
  end subroutine


  ! _________________ Epetra_BlockMap interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_BlockMap_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_BlockMap_Cast ( id ) &
        bind(C,name='Epetra_BlockMap_Cast')
    import :: FT_Epetra_BlockMap_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_BlockMap_Abstract ( CT_Epetra_BlockMap_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_BlockMap_Abstract ( id ) &
        bind(C,name='Epetra_BlockMap_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_BlockMap(int NumGlobalElements, int ElementSize, int IndexBase, const Epetra_Comm& Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_BlockMap_Create ( int NumGlobalElements, int ElementSize, int IndexBase, CT_Epetra_Comm_ID_t CommID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_BlockMap_Create ( NumGlobalElements, &
        ElementSize, IndexBase, CommID ) bind(C,name='Epetra_BlockMap_Create')
    import :: FT_Epetra_BlockMap_ID_t ,c_int ,FT_Epetra_Comm_ID_t
    implicit none
    integer(c_int)               ,intent(in)   ,value              :: NumGlobalElements
    integer(c_int)               ,intent(in)   ,value              :: ElementSize
    integer(c_int)               ,intent(in)   ,value              :: IndexBase
    type(FT_Epetra_Comm_ID_t)    ,intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_BlockMap(int NumGlobalElements, int NumMyElements, int ElementSize, int IndexBase, const Epetra_Comm& Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_BlockMap_Create_Linear ( int NumGlobalElements, int NumMyElements, int ElementSize, int IndexBase, CT_Epetra_Comm_ID_t CommID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_BlockMap_Create_Linear ( NumGlobalElements, &
        NumMyElements, ElementSize, IndexBase, CommID ) &
        bind(C,name='Epetra_BlockMap_Create_Linear')
    import :: FT_Epetra_BlockMap_ID_t ,c_int ,FT_Epetra_Comm_ID_t
    implicit none
    integer(c_int)               ,intent(in)   ,value              :: NumGlobalElements
    integer(c_int)               ,intent(in)   ,value              :: NumMyElements
    integer(c_int)               ,intent(in)   ,value              :: ElementSize
    integer(c_int)               ,intent(in)   ,value              :: IndexBase
    type(FT_Epetra_Comm_ID_t)    ,intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_BlockMap(int NumGlobalElements, int NumMyElements, const int *MyGlobalElements, int ElementSize, int IndexBase, const Epetra_Comm& Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_BlockMap_Create_Arbitrary ( int NumGlobalElements, int NumMyElements, const int * MyGlobalElements, int ElementSize, int IndexBase, CT_Epetra_Comm_ID_t CommID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_BlockMap_Create_Arbitrary ( &
        NumGlobalElements, NumMyElements, MyGlobalElements, ElementSize, IndexBase, CommID ) &
        bind(C,name='Epetra_BlockMap_Create_Arbitrary')
    import :: FT_Epetra_BlockMap_ID_t ,c_int ,FT_Epetra_Comm_ID_t
    implicit none
    integer(c_int)               ,intent(in)   ,value              :: NumGlobalElements
    integer(c_int)               ,intent(in)   ,value              :: NumMyElements
    integer(c_int)               ,intent(in)         ,dimension(*) :: MyGlobalElements
    integer(c_int)               ,intent(in)   ,value              :: ElementSize
    integer(c_int)               ,intent(in)   ,value              :: IndexBase
    type(FT_Epetra_Comm_ID_t)    ,intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_BlockMap(int NumGlobalElements, int NumMyElements, const int *MyGlobalElements, const int *ElementSizeList, int IndexBase, const Epetra_Comm& Comm);
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_BlockMap_Create_Variable ( int NumGlobalElements, int NumMyElements, const int * MyGlobalElements, const int * ElementSizeList, int IndexBase, CT_Epetra_Comm_ID_t CommID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_BlockMap_Create_Variable ( &
        NumGlobalElements, NumMyElements, MyGlobalElements, ElementSizeList, IndexBase, &
        CommID ) bind(C,name='Epetra_BlockMap_Create_Variable')
    import :: FT_Epetra_BlockMap_ID_t ,c_int ,FT_Epetra_Comm_ID_t
    implicit none
    integer(c_int)               ,intent(in)   ,value              :: NumGlobalElements
    integer(c_int)               ,intent(in)   ,value              :: NumMyElements
    integer(c_int)               ,intent(in)         ,dimension(*) :: MyGlobalElements
    integer(c_int)               ,intent(in)         ,dimension(*) :: ElementSizeList
    integer(c_int)               ,intent(in)   ,value              :: IndexBase
    type(FT_Epetra_Comm_ID_t)    ,intent(in)   ,value              :: CommID
  end function


  ! Original C++ prototype:
  ! Epetra_BlockMap(const Epetra_BlockMap& map);
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_BlockMap_Duplicate ( CT_Epetra_BlockMap_ID_t mapID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_BlockMap_Duplicate ( mapID ) &
        bind(C,name='Epetra_BlockMap_Duplicate')
    import :: FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: mapID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_BlockMap(void);
  ! CTrilinos prototype:
  ! void Epetra_BlockMap_Destroy ( CT_Epetra_BlockMap_ID_t * selfID );

  subroutine Epetra_BlockMap_Destroy ( selfID ) bind(C,name='Epetra_BlockMap_Destroy')
    import :: FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t)                                  :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int RemoteIDList(int NumIDs, const int * GIDList, int * PIDList, int * LIDList) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_RemoteIDList ( CT_Epetra_BlockMap_ID_t selfID, int NumIDs, const int * GIDList, int * PIDList, int * LIDList );

  integer(c_int) function Epetra_BlockMap_RemoteIDList ( selfID, NumIDs, GIDList, PIDList, &
        LIDList ) bind(C,name='Epetra_BlockMap_RemoteIDList')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: NumIDs
    integer(c_int)               ,intent(in)         ,dimension(*) :: GIDList
    integer(c_int)                                   ,dimension(*) :: PIDList
    integer(c_int)                                   ,dimension(*) :: LIDList
  end function


  ! Original C++ prototype:
  ! int RemoteIDList(int NumIDs, const int * GIDList, int * PIDList, int * LIDList, int * SizeList) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_RemoteIDList_WithSize ( CT_Epetra_BlockMap_ID_t selfID, int NumIDs, const int * GIDList, int * PIDList, int * LIDList, int * SizeList );

  integer(c_int) function Epetra_BlockMap_RemoteIDList_WithSize ( selfID, NumIDs, GIDList, &
        PIDList, LIDList, SizeList ) bind(C,name='Epetra_BlockMap_RemoteIDList_WithSize')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: NumIDs
    integer(c_int)               ,intent(in)         ,dimension(*) :: GIDList
    integer(c_int)                                   ,dimension(*) :: PIDList
    integer(c_int)                                   ,dimension(*) :: LIDList
    integer(c_int)                                   ,dimension(*) :: SizeList
  end function


  ! Original C++ prototype:
  ! int LID(int GID) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_LID ( CT_Epetra_BlockMap_ID_t selfID, int GID );

  integer(c_int) function Epetra_BlockMap_LID ( selfID, GID ) &
        bind(C,name='Epetra_BlockMap_LID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GID
  end function


  ! Original C++ prototype:
  ! int GID(int LID) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_GID ( CT_Epetra_BlockMap_ID_t selfID, int LID );

  integer(c_int) function Epetra_BlockMap_GID ( selfID, LID ) &
        bind(C,name='Epetra_BlockMap_GID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LID
  end function


  ! Original C++ prototype:
  ! int FindLocalElementID(int PointID, int & ElementID, int & ElementOffset) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_FindLocalElementID ( CT_Epetra_BlockMap_ID_t selfID, int PointID, int * ElementID, int * ElementOffset );

  integer(c_int) function Epetra_BlockMap_FindLocalElementID ( selfID, PointID, ElementID, &
        ElementOffset ) bind(C,name='Epetra_BlockMap_FindLocalElementID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: PointID
    integer(c_int)               ,intent(inout)                    :: ElementID
    integer(c_int)               ,intent(inout)                    :: ElementOffset
  end function


  ! Original C++ prototype:
  ! bool MyGID(int GID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_MyGID ( CT_Epetra_BlockMap_ID_t selfID, int GID_in );

  logical(c_bool) function Epetra_BlockMap_MyGID ( selfID, GID_in ) &
        bind(C,name='Epetra_BlockMap_MyGID')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t ,c_int
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: GID_in
  end function


  ! Original C++ prototype:
  ! bool MyLID(int LID_in) const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_MyLID ( CT_Epetra_BlockMap_ID_t selfID, int LID_in );

  logical(c_bool) function Epetra_BlockMap_MyLID ( selfID, LID_in ) &
        bind(C,name='Epetra_BlockMap_MyLID')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t ,c_int
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LID_in
  end function


  ! Original C++ prototype:
  ! int MinAllGID() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MinAllGID ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MinAllGID ( selfID ) &
        bind(C,name='Epetra_BlockMap_MinAllGID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MaxAllGID() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MaxAllGID ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MaxAllGID ( selfID ) &
        bind(C,name='Epetra_BlockMap_MaxAllGID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MinMyGID() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MinMyGID ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MinMyGID ( selfID ) &
        bind(C,name='Epetra_BlockMap_MinMyGID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MaxMyGID() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MaxMyGID ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MaxMyGID ( selfID ) &
        bind(C,name='Epetra_BlockMap_MaxMyGID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MinLID() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MinLID ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MinLID ( selfID ) &
        bind(C,name='Epetra_BlockMap_MinLID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MaxLID() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MaxLID ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MaxLID ( selfID ) &
        bind(C,name='Epetra_BlockMap_MaxLID')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalElements() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_NumGlobalElements ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_NumGlobalElements ( selfID ) &
        bind(C,name='Epetra_BlockMap_NumGlobalElements')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyElements() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_NumMyElements ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_NumMyElements ( selfID ) &
        bind(C,name='Epetra_BlockMap_NumMyElements')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MyGlobalElements(int * MyGlobalElementList) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MyGlobalElements_Fill ( CT_Epetra_BlockMap_ID_t selfID, int * MyGlobalElementList );

  integer(c_int) function Epetra_BlockMap_MyGlobalElements_Fill ( selfID, &
        MyGlobalElementList ) bind(C,name='Epetra_BlockMap_MyGlobalElements_Fill')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                   ,dimension(*) :: MyGlobalElementList
  end function


  ! Original C++ prototype:
  ! int ElementSize() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_ElementSize_Const ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_ElementSize_Const ( selfID ) &
        bind(C,name='Epetra_BlockMap_ElementSize_Const')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ElementSize(int LID) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_ElementSize ( CT_Epetra_BlockMap_ID_t selfID, int LID );

  integer(c_int) function Epetra_BlockMap_ElementSize ( selfID, LID ) &
        bind(C,name='Epetra_BlockMap_ElementSize')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LID
  end function


  ! Original C++ prototype:
  ! int FirstPointInElement(int LID) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_FirstPointInElement ( CT_Epetra_BlockMap_ID_t selfID, int LID );

  integer(c_int) function Epetra_BlockMap_FirstPointInElement ( selfID, LID ) &
        bind(C,name='Epetra_BlockMap_FirstPointInElement')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)               ,intent(in)   ,value              :: LID
  end function


  ! Original C++ prototype:
  ! int IndexBase() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_IndexBase ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_IndexBase ( selfID ) &
        bind(C,name='Epetra_BlockMap_IndexBase')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumGlobalPoints() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_NumGlobalPoints ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_NumGlobalPoints ( selfID ) &
        bind(C,name='Epetra_BlockMap_NumGlobalPoints')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumMyPoints() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_NumMyPoints ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_NumMyPoints ( selfID ) &
        bind(C,name='Epetra_BlockMap_NumMyPoints')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MinMyElementSize() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MinMyElementSize ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MinMyElementSize ( selfID ) &
        bind(C,name='Epetra_BlockMap_MinMyElementSize')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MaxMyElementSize() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MaxMyElementSize ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MaxMyElementSize ( selfID ) &
        bind(C,name='Epetra_BlockMap_MaxMyElementSize')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MinElementSize() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MinElementSize ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MinElementSize ( selfID ) &
        bind(C,name='Epetra_BlockMap_MinElementSize')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int MaxElementSize() const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_MaxElementSize ( CT_Epetra_BlockMap_ID_t selfID );

  integer(c_int) function Epetra_BlockMap_MaxElementSize ( selfID ) &
        bind(C,name='Epetra_BlockMap_MaxElementSize')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool UniqueGIDs() const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_UniqueGIDs ( CT_Epetra_BlockMap_ID_t selfID );

  logical(c_bool) function Epetra_BlockMap_UniqueGIDs ( selfID ) &
        bind(C,name='Epetra_BlockMap_UniqueGIDs')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool ConstantElementSize() const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_ConstantElementSize ( CT_Epetra_BlockMap_ID_t selfID );

  logical(c_bool) function Epetra_BlockMap_ConstantElementSize ( selfID ) &
        bind(C,name='Epetra_BlockMap_ConstantElementSize')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool SameAs(const Epetra_BlockMap & Map) const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_SameAs ( CT_Epetra_BlockMap_ID_t selfID, CT_Epetra_BlockMap_ID_t MapID );

  logical(c_bool) function Epetra_BlockMap_SameAs ( selfID, MapID ) &
        bind(C,name='Epetra_BlockMap_SameAs')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: MapID
  end function


  ! Original C++ prototype:
  ! bool PointSameAs(const Epetra_BlockMap & Map) const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_PointSameAs ( CT_Epetra_BlockMap_ID_t selfID, CT_Epetra_BlockMap_ID_t MapID );

  logical(c_bool) function Epetra_BlockMap_PointSameAs ( selfID, MapID ) &
        bind(C,name='Epetra_BlockMap_PointSameAs')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: MapID
  end function


  ! Original C++ prototype:
  ! bool LinearMap() const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_LinearMap ( CT_Epetra_BlockMap_ID_t selfID );

  logical(c_bool) function Epetra_BlockMap_LinearMap ( selfID ) &
        bind(C,name='Epetra_BlockMap_LinearMap')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool DistributedGlobal() const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_DistributedGlobal ( CT_Epetra_BlockMap_ID_t selfID );

  logical(c_bool) function Epetra_BlockMap_DistributedGlobal ( selfID ) &
        bind(C,name='Epetra_BlockMap_DistributedGlobal')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * MyGlobalElements() const;
  ! CTrilinos prototype:
  ! int * Epetra_BlockMap_MyGlobalElements ( CT_Epetra_BlockMap_ID_t selfID );

  type(c_ptr) function Epetra_BlockMap_MyGlobalElements ( selfID ) &
        bind(C,name='Epetra_BlockMap_MyGlobalElements')
    import :: c_ptr ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * FirstPointInElementList() const;
  ! CTrilinos prototype:
  ! int * Epetra_BlockMap_FirstPointInElementList ( CT_Epetra_BlockMap_ID_t selfID );

  type(c_ptr) function Epetra_BlockMap_FirstPointInElementList ( selfID ) &
        bind(C,name='Epetra_BlockMap_FirstPointInElementList')
    import :: c_ptr ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * ElementSizeList() const;
  ! CTrilinos prototype:
  ! int * Epetra_BlockMap_ElementSizeList ( CT_Epetra_BlockMap_ID_t selfID );

  type(c_ptr) function Epetra_BlockMap_ElementSizeList ( selfID ) &
        bind(C,name='Epetra_BlockMap_ElementSizeList')
    import :: c_ptr ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * PointToElementList() const;
  ! CTrilinos prototype:
  ! int * Epetra_BlockMap_PointToElementList ( CT_Epetra_BlockMap_ID_t selfID );

  type(c_ptr) function Epetra_BlockMap_PointToElementList ( selfID ) &
        bind(C,name='Epetra_BlockMap_PointToElementList')
    import :: c_ptr ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int ElementSizeList(int * ElementSizeList)const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_ElementSizeList_Fill ( CT_Epetra_BlockMap_ID_t selfID, int * ElementSizeList );

  integer(c_int) function Epetra_BlockMap_ElementSizeList_Fill ( selfID, ElementSizeList ) &
        bind(C,name='Epetra_BlockMap_ElementSizeList_Fill')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                   ,dimension(*) :: ElementSizeList
  end function


  ! Original C++ prototype:
  ! int FirstPointInElementList(int * FirstPointInElementList)const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_FirstPointInElementList_Fill ( CT_Epetra_BlockMap_ID_t selfID, int * FirstPointInElementList );

  integer(c_int) function Epetra_BlockMap_FirstPointInElementList_Fill ( selfID, &
        FirstPointInElementList ) &
        bind(C,name='Epetra_BlockMap_FirstPointInElementList_Fill')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                   ,dimension(*) :: FirstPointInElementList
  end function


  ! Original C++ prototype:
  ! int PointToElementList(int * PointToElementList) const;
  ! CTrilinos prototype:
  ! int Epetra_BlockMap_PointToElementList_Fill ( CT_Epetra_BlockMap_ID_t selfID, int * PointToElementList );

  integer(c_int) function Epetra_BlockMap_PointToElementList_Fill ( selfID, &
        PointToElementList ) bind(C,name='Epetra_BlockMap_PointToElementList_Fill')
    import :: c_int ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    integer(c_int)                                   ,dimension(*) :: PointToElementList
  end function


  ! Original C++ prototype:
  ! const Epetra_Comm & Comm() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Comm_ID_t Epetra_BlockMap_Comm ( CT_Epetra_BlockMap_ID_t selfID );

  type(FT_Epetra_Comm_ID_t) function Epetra_BlockMap_Comm ( selfID ) &
        bind(C,name='Epetra_BlockMap_Comm')
    import :: FT_Epetra_Comm_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! bool IsOneToOne() const;
  ! CTrilinos prototype:
  ! boolean Epetra_BlockMap_IsOneToOne ( CT_Epetra_BlockMap_ID_t selfID );

  logical(c_bool) function Epetra_BlockMap_IsOneToOne ( selfID ) &
        bind(C,name='Epetra_BlockMap_IsOneToOne')
    import :: c_bool ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_BlockMap & operator=(const Epetra_BlockMap & map);
  ! CTrilinos prototype:
  ! void Epetra_BlockMap_Assign ( CT_Epetra_BlockMap_ID_t selfID, CT_Epetra_BlockMap_ID_t mapID );

  subroutine Epetra_BlockMap_Assign ( selfID, mapID ) bind(C,name='Epetra_BlockMap_Assign')
    import :: FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: selfID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: mapID
  end subroutine


  ! _________________ Epetra_Import interface bodies _________________


  ! CTrilinos prototype:
  ! CT_Epetra_Import_ID_t Epetra_Import_Cast ( CTrilinos_Object_ID_t id );

  type(FT_Epetra_Import_ID_t) function Epetra_Import_Cast ( id ) &
        bind(C,name='Epetra_Import_Cast')
    import :: FT_Epetra_Import_ID_t ,ForTrilinos_Object_ID_t
    implicit none
    type(ForTrilinos_Object_ID_t),intent(in)   ,value              :: id
  end function


  ! CTrilinos prototype:
  ! CTrilinos_Object_ID_t Epetra_Import_Abstract ( CT_Epetra_Import_ID_t id );

  type(ForTrilinos_Object_ID_t) function Epetra_Import_Abstract ( id ) &
        bind(C,name='Epetra_Import_Abstract')
    import :: ForTrilinos_Object_ID_t ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: id
  end function


  ! Original C++ prototype:
  ! Epetra_Import( const Epetra_BlockMap & TargetMap, const Epetra_BlockMap & SourceMap );
  ! CTrilinos prototype:
  ! CT_Epetra_Import_ID_t Epetra_Import_Create ( CT_Epetra_BlockMap_ID_t TargetMapID, CT_Epetra_BlockMap_ID_t SourceMapID );

  type(FT_Epetra_Import_ID_t) function Epetra_Import_Create ( TargetMapID, SourceMapID ) &
        bind(C,name='Epetra_Import_Create')
    import :: FT_Epetra_Import_ID_t ,FT_Epetra_BlockMap_ID_t
    implicit none
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: TargetMapID
    type(FT_Epetra_BlockMap_ID_t),intent(in)   ,value              :: SourceMapID
  end function


  ! Original C++ prototype:
  ! Epetra_Import(const Epetra_Import& Importer);
  ! CTrilinos prototype:
  ! CT_Epetra_Import_ID_t Epetra_Import_Duplicate ( CT_Epetra_Import_ID_t ImporterID );

  type(FT_Epetra_Import_ID_t) function Epetra_Import_Duplicate ( ImporterID ) &
        bind(C,name='Epetra_Import_Duplicate')
    import :: FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: ImporterID
  end function


  ! Original C++ prototype:
  ! virtual ~Epetra_Import(void);
  ! CTrilinos prototype:
  ! void Epetra_Import_Destroy ( CT_Epetra_Import_ID_t * selfID );

  subroutine Epetra_Import_Destroy ( selfID ) bind(C,name='Epetra_Import_Destroy')
    import :: FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t)                                   :: selfID
  end subroutine


  ! Original C++ prototype:
  ! int NumSameIDs() const;
  ! CTrilinos prototype:
  ! int Epetra_Import_NumSameIDs ( CT_Epetra_Import_ID_t selfID );

  integer(c_int) function Epetra_Import_NumSameIDs ( selfID ) &
        bind(C,name='Epetra_Import_NumSameIDs')
    import :: c_int ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumPermuteIDs() const;
  ! CTrilinos prototype:
  ! int Epetra_Import_NumPermuteIDs ( CT_Epetra_Import_ID_t selfID );

  integer(c_int) function Epetra_Import_NumPermuteIDs ( selfID ) &
        bind(C,name='Epetra_Import_NumPermuteIDs')
    import :: c_int ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * PermuteFromLIDs () const;
  ! CTrilinos prototype:
  ! int * Epetra_Import_PermuteFromLIDs ( CT_Epetra_Import_ID_t selfID );

  type(c_ptr) function Epetra_Import_PermuteFromLIDs ( selfID ) &
        bind(C,name='Epetra_Import_PermuteFromLIDs')
    import :: c_ptr ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * PermuteToLIDs () const;
  ! CTrilinos prototype:
  ! int * Epetra_Import_PermuteToLIDs ( CT_Epetra_Import_ID_t selfID );

  type(c_ptr) function Epetra_Import_PermuteToLIDs ( selfID ) &
        bind(C,name='Epetra_Import_PermuteToLIDs')
    import :: c_ptr ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumRemoteIDs() const;
  ! CTrilinos prototype:
  ! int Epetra_Import_NumRemoteIDs ( CT_Epetra_Import_ID_t selfID );

  integer(c_int) function Epetra_Import_NumRemoteIDs ( selfID ) &
        bind(C,name='Epetra_Import_NumRemoteIDs')
    import :: c_int ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * RemoteLIDs() const;
  ! CTrilinos prototype:
  ! int * Epetra_Import_RemoteLIDs ( CT_Epetra_Import_ID_t selfID );

  type(c_ptr) function Epetra_Import_RemoteLIDs ( selfID ) &
        bind(C,name='Epetra_Import_RemoteLIDs')
    import :: c_ptr ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumExportIDs () const;
  ! CTrilinos prototype:
  ! int Epetra_Import_NumExportIDs ( CT_Epetra_Import_ID_t selfID );

  integer(c_int) function Epetra_Import_NumExportIDs ( selfID ) &
        bind(C,name='Epetra_Import_NumExportIDs')
    import :: c_int ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * ExportLIDs () const;
  ! CTrilinos prototype:
  ! int * Epetra_Import_ExportLIDs ( CT_Epetra_Import_ID_t selfID );

  type(c_ptr) function Epetra_Import_ExportLIDs ( selfID ) &
        bind(C,name='Epetra_Import_ExportLIDs')
    import :: c_ptr ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int * ExportPIDs () const;
  ! CTrilinos prototype:
  ! int * Epetra_Import_ExportPIDs ( CT_Epetra_Import_ID_t selfID );

  type(c_ptr) function Epetra_Import_ExportPIDs ( selfID ) &
        bind(C,name='Epetra_Import_ExportPIDs')
    import :: c_ptr ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumSend() const;
  ! CTrilinos prototype:
  ! int Epetra_Import_NumSend ( CT_Epetra_Import_ID_t selfID );

  integer(c_int) function Epetra_Import_NumSend ( selfID ) &
        bind(C,name='Epetra_Import_NumSend')
    import :: c_int ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! int NumRecv() const;
  ! CTrilinos prototype:
  ! int Epetra_Import_NumRecv ( CT_Epetra_Import_ID_t selfID );

  integer(c_int) function Epetra_Import_NumRecv ( selfID ) &
        bind(C,name='Epetra_Import_NumRecv')
    import :: c_int ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap & SourceMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_Import_SourceMap ( CT_Epetra_Import_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_Import_SourceMap ( selfID ) &
        bind(C,name='Epetra_Import_SourceMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! const Epetra_BlockMap & TargetMap() const;
  ! CTrilinos prototype:
  ! CT_Epetra_BlockMap_ID_t Epetra_Import_TargetMap ( CT_Epetra_Import_ID_t selfID );

  type(FT_Epetra_BlockMap_ID_t) function Epetra_Import_TargetMap ( selfID ) &
        bind(C,name='Epetra_Import_TargetMap')
    import :: FT_Epetra_BlockMap_ID_t ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  ! Original C++ prototype:
  ! Epetra_Distributor & Distributor() const;
  ! CTrilinos prototype:
  ! CT_Epetra_Distributor_ID_t Epetra_Import_Distributor ( CT_Epetra_Import_ID_t selfID );

  type(FT_Epetra_Distributor_ID_t) function Epetra_Import_Distributor ( selfID ) &
        bind(C,name='Epetra_Import_Distributor')
    import :: FT_Epetra_Distributor_ID_t ,FT_Epetra_Import_ID_t
    implicit none
    type(FT_Epetra_Import_ID_t) ,intent(in)   ,value              :: selfID
  end function


  end interface
end module forepetra
