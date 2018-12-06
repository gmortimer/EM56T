function GenDvcCode( Dvc, Dvcc, Dvcm, hasTxStats, hasRxStats, hasWrStats, hasBram )
%Generate Device Code for device name Dvc
%   GenDvcCode( Dvc, Dvcc, Dvcm, hasTxStats, hasRxStats, hasWrStats, hasBram )
%   Dvc         string  Device name used in code
%   Dvcc        string  Device name used in constant macros
%   Dvcm        string  Device name used in function macros
%   hasRxStats  generate code for Rx Statistics
%   hasTxStats  generate code for Tx Statistics
%   hasWrStats  generate code for Wr Statistics
%   hasBram     generate skeleton Bram access and test code;

Dvcc = upper( Dvcc );
Dvcm = upper( Dvcm );
fid = fopen( [ Dvc, '_tplate.c' ], 'w' );
fprintf( fid, '#include "include.h"\n' );
fprintf( fid, '\n' );
fprintf( fid, '\n' );
fprintf( fid, '// =================================\n' );
fprintf( fid, '// Boilerplate Function Declarations\n' );
fprintf( fid, '// =================================\n' );
fprintf( fid, 'void %sInit(\n', Dvc );
fprintf( fid, '    %s *pd,\n', Dvc );
fprintf( fid, '    char      *Name,\n' );
fprintf( fid, '    u32       BaseAddr,\n' );
fprintf( fid, '    SysCtrl   *pSysCtrl,\n' );
fprintf( fid, '    SysDvce   *pSysDvce,\n' );
fprintf( fid, '    SysDesc   *pSysDesc,\n' );
fprintf( fid, '    SysPtrs   *pSysPtrs,\n' );
fprintf( fid, '    SysData   *pSysData,\n' );
fprintf( fid, '    %sDesc *pDvcDesc,\n', Dvc );
fprintf( fid, '    %sData *pDvcData\n', Dvc );
fprintf( fid, '    );\n' );
fprintf( fid, '\n' );
fprintf( fid, 'static void SetParams    ( %s *pd );\n', Dvc );
fprintf( fid, 'static void SysDvceDump  ( %s *pd );\n', Dvc );
fprintf( fid, 'static void SysDescDump  ( %s *pd );\n', Dvc );
fprintf( fid, 'static void SysDataDump  ( %s *pd );\n', Dvc );
fprintf( fid, 'static void DvcDataInit  ( %s *pd );\n', Dvc );
fprintf( fid, 'static void DvcDataUpd   ( %s *pd );\n', Dvc );
fprintf( fid, 'static void DvcDescDump  ( %s *pd );\n', Dvc );
fprintf( fid, 'static void DvcDataDump  ( %s *pd );\n', Dvc );
fprintf( fid, '\n' );
fprintf( fid, '// =================================================\n' );
fprintf( fid, '// Device Structure Member Functions (public access)\n' );
fprintf( fid, '// =================================================\n' );
fprintf( fid, '// Insert device-specific member function prototypes here\n' );
fprintf( fid, '// Example: static inline void Start         ( %s *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), %s_CTRL_REG << 2, %s_START ); }\n', Dvc, upper( Dvc ), upper( Dvc ) );
fprintf( fid, '// Example: static void        WriteBuf      ( %s *pd, u32 addr, u32 data );\n', Dvc );
if hasBram == 1
    fprintf( fid, 'static u32  TestBram        ( %s *pd );\n', Dvc );
    fprintf( fid, 'static u32  ReadBram        ( %s *pd, u32 addr );\n', Dvc );
    fprintf( fid, 'static void WriteBram       ( %s *pd, u32 addr, u32 data );\n', Dvc );
    fprintf( fid, 'static void InitBram        ( %s *pd, u32 addr, u32 count, u32 data );\n', Dvc );
    fprintf( fid, '//static void LoadBram        ( %s *pd );\n', Dvc );
    fprintf( fid, 'static void DumpBram        ( %s *pd, u32 addr, u32 nBits );\n', Dvc );
end
fprintf( fid, 'static void Dump            ( %s *pd );\n', Dvc );
fprintf( fid, '\n' );
fprintf( fid, '// Declare init structure here with member functions\n' );
fprintf( fid, '%s %sInitStr = {\n', Dvc, Dvc );
fprintf( fid, '    NULL,\n' );
fprintf( fid, '    NULL,\n' );
fprintf( fid, '    NULL,\n' );
if hasBram == 1
    fprintf( fid, '    TestBram        ,\n' );
    fprintf( fid, '    ReadBram        ,\n' );
    fprintf( fid, '    WriteBram       ,\n' );
    fprintf( fid, '    InitBram        ,\n' );
    fprintf( fid, '//    LoadBram        ,\n' );
    fprintf( fid, '    DumpBram        ,\n' );
end
fprintf( fid, '    Dump\n' );
fprintf( fid, '};\n' );
fprintf( fid, '\n' );
fprintf( fid, '//===================\n' );
fprintf( fid, '// Initialize Device\n' );
fprintf( fid, '//===================\n' );
fprintf( fid, 'void %sInit( %s *pd, char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, %sDesc *pDvcDesc, %sData *pDvcData )\n', Dvc, Dvc, Dvc, Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '    *pd             = %sInitStr;\n', Dvc );
fprintf( fid, '    pd->pSysDvce    = pSysDvce;\n' );
fprintf( fid, '    SysDvceInit(\n' );
fprintf( fid, '        pd->pSysDvce,\n' );
fprintf( fid, '        Name,\n' );
fprintf( fid, '        pSysCtrl,\n' );
fprintf( fid, '        pSysDesc,\n' );
fprintf( fid, '        pSysPtrs,\n' );
fprintf( fid, '        pSysData,\n' );
fprintf( fid, '        BaseAddr,\n' );
fprintf( fid, '        %s_CTRL_REG,\n'         , Dvcc );
fprintf( fid, '        %s_INFO_REG,\n'         , Dvcc );
fprintf( fid, '        %s_STAT_REG,\n'         , Dvcc );
fprintf( fid, '        %s_RESET,\n'            , Dvcc );
fprintf( fid, '        %s_INT_ACK,\n'          , Dvcc );
if hasRxStats == 1
    fprintf( fid, '        %s_RX_DATA_CTR_REG,\n'  , Dvcc );
    fprintf( fid, '        %s_RX_SYMB_CTR_REG,\n'  , Dvcc );
    fprintf( fid, '        %s_RX_FRAME_CTR_REG,\n' , Dvcc );
    fprintf( fid, '        %s_RX_BLOCK_CTR_REG,\n' , Dvcc );
else
    fprintf( fid, '        0,\n' );
    fprintf( fid, '        0,\n' );
    fprintf( fid, '        0,\n' );
    fprintf( fid, '        0,\n' );
end
if hasTxStats == 1
    fprintf( fid, '        %s_TX_DATA_CTR_REG,\n'  , Dvcc );
    fprintf( fid, '        %s_TX_SYMB_CTR_REG,\n'  , Dvcc );
    fprintf( fid, '        %s_TX_FRAME_CTR_REG,\n' , Dvcc );
    fprintf( fid, '        %s_TX_BLOCK_CTR_REG\n'  , Dvcc );
else if hasWrStats == 1
        fprintf( fid, '        %s_WR_DATA_CTR_REG,\n'  , Dvcc );
        fprintf( fid, '        %s_WR_SYMB_CTR_REG,\n'  , Dvcc );
        fprintf( fid, '        %s_WR_FRAME_CTR_REG,\n' , Dvcc );
        fprintf( fid, '        %s_WR_BLOCK_CTR_REG\n'  , Dvcc );
    else
        fprintf( fid, '        0,\n' );
        fprintf( fid, '        0,\n' );
        fprintf( fid, '        0,\n' );
        fprintf( fid, '        0,\n' );
    end
end
fprintf( fid, '        );\n' );
fprintf( fid, '    pd->pDvcDesc  = pDvcDesc;\n' );
fprintf( fid, '    pd->pDvcData  = pDvcData;\n' );
fprintf( fid, '    DvcDataInit( pd );\n' );
if hasBram == 1
    fprintf( fid, '    ( void ) pd->TestBram( pd );' );
end
fprintf( fid, '    SYSRESET( pd );\n' );
fprintf( fid, '    SetParams( pd );\n' );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, '//========================\n' );
fprintf( fid, '// Dump Device to Console\n' );
fprintf( fid, '//========================\n' );
fprintf( fid, 'static void Dump( %s *pd ) {\n', Dvc );
fprintf( fid, '    cprintf( "\\n" );\n' );
fprintf( fid, '    SysDvceDump( pd );\n' );
fprintf( fid, '    SysDescDump( pd );\n' );
fprintf( fid, '    DvcDescDump( pd );\n' );
fprintf( fid, '    SysDataDump( pd );\n' );
fprintf( fid, '    DvcDataDump( pd );\n' );
fprintf( fid, '    cprintf( "\\n" );\n' );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, '// End of boilerplate code\n' );
fprintf( fid, '//========================\n' );
fprintf( fid, '// Device-specific code\n' );
fprintf( fid, '//========================\n' );
fprintf( fid, 'static void SetParams( %s *pd )\n', Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '// Set PL device slave regs here\n' );
fprintf( fid, '// Example SYSWRSLVREG( pd, %s_BOB_REG,    SYSPAR( Bob   ));\n', upper( Dvc ) );
fprintf( fid, '// Example SYSWRSLVREG( pd, %s_ALICE_REG , SYSPAR( Alice ));\n', upper( Dvc ) );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, 'static void DvcDataInit( %s *pd )\n', Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '// Initialise DvcData members here\n' );
fprintf( fid, '// Example: DVCDAT( Bob ) = 0;\n' );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, 'static void DvcDataUpd( %s *pd )\n', Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '// Update DvcData members here\n' );
fprintf( fid, '// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, %s_BOB_REG );\n', upper( Dvc ) );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, 'static void DvcDataDump( %s *pd )\n', Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '    DvcDataUpd( pd );\n' );
fprintf( fid, '// Insert device-specific SysDesc members here\n' );
fprintf( fid, '// Example: cprintf("\\nBob  : %%u", toUint( DVCDAT( Bob )) );\n' );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, 'static void DvcDescDump( %s *pd )\n', Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '// Insert device-specific %sDesc members here\n', Dvc );
fprintf( fid, '// Example: cprintf("\\nAlice: %%u", toUint( SYSPAR( Alice )) );\n' );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, 'static void SysDvceDump( %s *pd )\n', Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '    SYSDVCEDUMP( pd );\n' );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, 'static void SysDataDump( %s *pd )\n', Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '    SYSDATADUMP( pd );\n' );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, 'static void SysDescDump( %s *pd )\n', Dvc );
fprintf( fid, '{\n' );
fprintf( fid, '// Insert device-specific %sDesc members here\n', Dvc );
fprintf( fid, '// Example: cprintf("\\nAlice: %%u", toUint( SYSPAR( Alice )) );\n' );
fprintf( fid, '}\n' );
fprintf( fid, '\n' );
fprintf( fid, '\n' );
fprintf( fid, '// Insert device-specific code here\n' );
fprintf( fid, '//======================================\n' );
fprintf( fid, '// Device-specific non member functions\n' );
fprintf( fid, '//======================================\n' );
if hasBram == 1
    fprintf( fid, 'static inline void EnterAdmin        ( %s *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), %s_CTRL_REG << 2, %s_ENTER_ADMIN ); }\n', Dvc, Dvcc, Dvcc );
    fprintf( fid, 'static inline void ExitAdmin         ( %s *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), %s_CTRL_REG << 2, %s_EXIT_ADMIN  ); }\n', Dvc, Dvcc, Dvcc );
end
fprintf( fid, '// Example: static inline void EnterAdmin    ( %s *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), %s_CTRL_REG << 2, %s_ENTER_ADMIN ); }\n', Dvc, upper( Dvc ), upper( Dvc ) );
fprintf( fid, '\n' );
fprintf( fid, '//=================================\n' );
fprintf( fid, '// Device-specific member functions\n' );
fprintf( fid, '//=================================\n' );
fprintf( fid, '\n' );
fprintf( fid, '// Example:\n' );
fprintf( fid, '// static u32 ReadBuf( %s *pd, u32 addr )\n', Dvc );
fprintf( fid, '// {\n' );
fprintf( fid, '//     return ( SYSPTR( pBuf[ addr ] ));\n' );
fprintf( fid, '// }\n' );
if hasBram == 1
    fprintf( fid, '\n' );
    fprintf( fid, '// BRAM Access from PS\n' );
    fprintf( fid, '\n' );
    fprintf( fid, 'static void DumpBram( %s *pd, u32 addr, u32 nbits )\n', Dvc );
    fprintf( fid, '{\n' );
    fprintf( fid, '    char s[ 2 * SYS_MAX_OBJ_NAME_LEN + 1 ]; strcpy( s, SYSDVC( Name ) );\n' );
    fprintf( fid, '    strcat( s, " Bram" );\n' );
    fprintf( fid, '    dmpSelector dsel = DUMP_SEL_%s_BRAM;\n', Dvcc );
    fprintf( fid, '\n' );
    fprintf( fid, '    if ( nbits == 0 )\n' );
    fprintf( fid, '        utilScreenDumpData( dsel, DUMP_FMT_HEX,       DUMP_TYP_MEMORY, addr, 4,     0, ( u32 )pd, s );\n' );
    fprintf( fid, '    else if(( nbits >= 8 ) && ( nbits <= 16 ))\n' );
    fprintf( fid, '        utilScreenDumpData( dsel, DUMP_FMT_IQ_SIGNED, DUMP_TYP_MEMORY, addr, nbits, 0, ( u32 )pd, s );\n' );
    fprintf( fid, '    else\n' );
    fprintf( fid, '        cprintf( "Format must be 0 (hex) or 8-16 (decimal Q:I)\\n" );\n' );
    fprintf( fid, '}\n' );
    fprintf( fid, '\n' );
    fprintf( fid, 'static u32 ReadBram( %s *pd, u32 addr )\n', Dvc );
    fprintf( fid, '{\n' );
    fprintf( fid, '    EnterAdmin( pd );\n' );
    fprintf( fid, '    u32 u = hwReadData( SYSDVC( BaseAddr ),\n' );
    fprintf( fid, '                   %s_CTRL_REG << 2, %s_AD_RD_BRAM, %s_AD_RD_ACK,\n', Dvcc, Dvcc, Dvcc );
    fprintf( fid, '                   %s_STAT_REG << 2, %s_AD_RD_RDY,\n', Dvcc, Dvcc );
    fprintf( fid, '                   %s_AD_RD_WR_ADDR_REG << 2, addr,\n', Dvcc );
    fprintf( fid, '                   %s_AD_RD_DATA_REG << 2\n', Dvcc );
    fprintf( fid, '                   );\n' );
    fprintf( fid, '    ExitAdmin( pd );\n' );
    fprintf( fid, '    return( u );\n' );
    fprintf( fid, '}\n' );
    fprintf( fid, '\n' );
    fprintf( fid, 'static void WriteBram( %s *pd, u32 addr, u32 data )\n', Dvc );
    fprintf( fid, '{\n' );
    fprintf( fid, '    EnterAdmin( pd );\n' );
    fprintf( fid, '    hwWriteData( SYSDVC( BaseAddr ),\n' );
    fprintf( fid, '                %s_CTRL_REG << 2, %s_AD_WR_BRAM,\n', Dvcc, Dvcc );
    fprintf( fid, '                %s_AD_RD_WR_ADDR_REG << 2, addr,\n', Dvcc );
    fprintf( fid, '                %s_AD_WR_DATA_REG << 2, data\n', Dvcc );
    fprintf( fid, '                );\n' );
    fprintf( fid, '    ExitAdmin( pd );\n' );
    fprintf( fid, '}\n' );
    fprintf( fid, '\n' );
    fprintf( fid, 'static void InitBram( %s *pd, u32 addr, u32 count, u32 val )\n', Dvc );
    fprintf( fid, '{\n' );
    fprintf( fid, '    EnterAdmin( pd );\n' );
    fprintf( fid, '    for( int i = 0; i < count; i++ )\n' );
    fprintf( fid, '    {\n' );
    fprintf( fid, '        hwWriteData( SYSDVC( BaseAddr ),\n' );
    fprintf( fid, '                    %s_CTRL_REG << 2, %s_AD_WR_BRAM,\n', Dvcc, Dvcc );
    fprintf( fid, '                    %s_AD_RD_WR_ADDR_REG << 2, addr + i,\n', Dvcc );
    fprintf( fid, '                    %s_AD_WR_DATA_REG << 2, val\n', Dvcc );
    fprintf( fid, '                    );\n' );
    fprintf( fid, '    }\n' );
    fprintf( fid, '    ExitAdmin( pd );\n' );
    fprintf( fid, '}\n' );
    fprintf( fid, '\n' );
    fprintf( fid, '//static void LoadBram( %s *pd )\n', Dvc );
    fprintf( fid, '//{\n' );
    fprintf( fid, '//    EnterAdmin( pd );\n' );
    fprintf( fid, '//    for ( int i = 0; i < LENGTH; i++ )\n' );
    fprintf( fid, '//    {\n' );
    fprintf( fid, '//        hwWriteData( SYSDVC( BaseAddr ),\n' );
    fprintf( fid, '//                %s_CTRL_REG << 2, %s_AD_WR_BRAM,\n', Dvcc, Dvcc );
    fprintf( fid, '//                %s_AD_RD_WR_ADDR_REG << 2, i,\n', Dvcc );
    fprintf( fid, '//                %s_AD_WR_DATA_REG << 2, SYSPTR( pBuf[ i ] )\n', Dvcc );
    fprintf( fid, '//        );\n' );
    fprintf( fid, '//    }\n' );
    fprintf( fid, '//    ExitAdmin( pd );\n' );
    fprintf( fid, '//}\n' );
    fprintf( fid, '\n' );
    fprintf( fid, '\n' );
    fprintf( fid, '\n' );
    fprintf( fid, '// BRAM Test Code\n' );
    fprintf( fid, 'static u32 ReadBR( u32 addr )\n' );
    fprintf( fid, '{\n' );
    fprintf( fid, '    static %s *pd = NULL;\n', Dvc );
    fprintf( fid, '    if ( addr & 0x80000000 ) { pd = ( %s * ) ( addr & 0x7FFFFFFF ); }\n', Dvc );
    fprintf( fid, '    else if ( pd != NULL ) { return ( pd->ReadBram( pd, ( u32 )addr )); }\n' );
    fprintf( fid, '    return( 0 );\n' );
    fprintf( fid, '}\n' );
    fprintf( fid, '\n' );
    fprintf( fid, 'static void WriteBR( u32 addr, u32 data )\n' );
    fprintf( fid, '{\n' );
    fprintf( fid, '    static %s *pd = NULL;\n', Dvc );
    fprintf( fid, '    if ( addr & 0x80000000 ) { pd = ( %s * )( addr & 0x7FFFFFFF ); }\n', Dvc );
    fprintf( fid, '    else if ( pd != NULL ) { pd->WriteBram( pd, ( u32 )addr, data ); }\n' );
    fprintf( fid, '}\n' );
    fprintf( fid, '\n' );
    fprintf( fid, '\n' );
    fprintf( fid, 'static u32 TestBram( %s *pd )\n', Dvc );
    fprintf( fid, '{\n' );
    fprintf( fid, '    char Name[ 2 * SYS_MAX_OBJ_NAME_LEN + 1]; strcpy( Name, SYSDVC( Name ) );\n' );
    fprintf( fid, '    ( void ) ReadBR( ( u32 ) pd | 0x80000000 );\n' );
    fprintf( fid, '    WriteBR( ( u32 ) pd | 0x80000000, 0 );\n' );
    fprintf( fid, '    return ( UtilTestBram( ReadBR, WriteBR, DVCPAR( BramSize ), 0xFFFFFFFF, strcat( Name, " BRAM" ) ));\n' );
    fprintf( fid, '}\n' );
end
fprintf( fid, '\n' );
fprintf( fid, '\n' );
fprintf( fid, '\n' );
fprintf( fid, '//////////////////////////////////////////////////////\n' );
fprintf( fid, '// Insert this code in <device>.h\n' );
fprintf( fid, '//////////////////////////////////////////////////////\n' );
fprintf( fid, '#define %sPAR( Param ) DEVICE_LOC_PAR( pd, %s, Param )\n', Dvcm, Dvcc );
fprintf( fid, '#define %sDAT( Param ) DEVICE_LOC_DAT( pd, %s, Param )\n', Dvcm, Dvcc );
fprintf( fid, '#define %s_%-27s(   )\n',  Dvcc, 'N_SLV_REGS' );
fprintf( fid, '\n' );
fprintf( fid, '#define %s_%-27s(  0 )\n', Dvcc, 'CTRL_REG'            );
fprintf( fid, '#define %s_%-27s(  2 )\n', Dvcc, 'N_FFT_REG'           );
fprintf( fid, '#define %s_%-27s(  3 )\n', Dvcc, 'N_SYMB_FRAME_REG'    );
fprintf( fid, '#define %s_%-27s(  4 )\n', Dvcc, 'N_FRAME_BLOCK_REG'   );
if hasBram == 1
    fprintf( fid, '#define %s_%-27s(  8 )\n', Dvcc, 'AD_RD_WR_ADDR_REG'   );
    fprintf( fid, '#define %s_%-27s(  9 )\n', Dvcc, 'AD_WR_DATA_REG'      );
end
fprintf( fid, '\n' );
fprintf( fid, '#define %s_%-27s(  1 )\n', Dvcc, 'INFO_REG'            );
fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'STAT_REG'            );
fprintf( fid, '\n' );
if hasRxStats == 1
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'RX_DATA_CTR_REG'     );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'RX_SYMB_CTR_REG'     );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'RX_FRAME_CTR_REG'    );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'RX_BLOCK_CTR_REG'    );
end
if hasTxStats == 1
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'TX_DATA_CTR_REG'     );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'TX_SYMB_CTR_REG'     );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'TX_FRAME_CTR_REG'    );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'TX_BLOCK_CTR_REG'    );
end
if hasWrStats == 1
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'WR_DATA_CTR_REG'     );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'WR_SYMB_CTR_REG'     );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'WR_FRAME_CTR_REG'    );
    fprintf( fid, '#define %s_%-27s(    )\n', Dvcc, 'WR_BLOCK_CTR_REG'    );
end
fprintf( fid, '\n' );
fprintf( fid, '// Control register bits\n' );
fprintf( fid, '#define %s_%-27s( 0x00000001 )\n', Dvcc, 'RESET'   );
fprintf( fid, '#define %s_%-27s( 0x00000002 )\n', Dvcc, 'INT_ACK' );
if hasBram == 1
    fprintf( fid, '#define %s_%-27s( 0x00000010 )\n', Dvcc, 'ENTER_ADMIN' );
    fprintf( fid, '#define %s_%-27s( 0x00000020 )\n', Dvcc, 'EXIT_ADMIN'  );
    fprintf( fid, '#define %s_%-27s( 0x00000040 )\n', Dvcc, 'AD_WR_BRAM'  );
    fprintf( fid, '#define %s_%-27s( 0x00000080 )\n', Dvcc, 'AD_RD_BRAM'  );
    fprintf( fid, '#define %s_%-27s( 0x00000100 )\n', Dvcc, 'AD_RD_ACK'   );
end
fprintf( fid, '\n' );
fprintf( fid, '\n' );
fprintf( fid, '//////////////////////////////////////////////////////\n' );
fprintf( fid, '// Insert this code in SystemControl.h\n' );
fprintf( fid, '//////////////////////////////////////////////////////\n' );
fprintf( fid, '\n' );
fprintf( fid, 'typedef struct s%sDesc %sDesc;\n', Dvc, Dvc );
fprintf( fid, 'struct s%sDesc {\n', Dvc );
if hasBram == 1
    fprintf( fid, '    u32 BramSize;\n' );
end
fprintf( fid, '};\n' );
fprintf( fid, '\n' );
fprintf( fid, 'typedef struct s%sData %sData;\n', Dvc, Dvc );
fprintf( fid, 'struct s%sData {\n', Dvc );
if hasRxStats == 1
    fprintf( fid, '    u32 RxDataCtr;\n' );
    fprintf( fid, '    u32 RxSymbCtr;\n' );
    fprintf( fid, '    u32 RxFrameCtr;\n' );
    fprintf( fid, '    u32 RxBlockCtr;\n' );
end
if hasTxStats == 1
    fprintf( fid, '    u32 TxDataCtr;\n' );
    fprintf( fid, '    u32 TxSymbCtr;\n' );
    fprintf( fid, '    u32 TxFrameCtr;\n' );
    fprintf( fid, '    u32 TxBlockCtr;\n' );
end
if hasWrStats == 1
    fprintf( fid, '    u32 WrDataCtr;\n' );
    fprintf( fid, '    u32 WrSymbCtr;\n' );
    fprintf( fid, '    u32 WrFrameCtr;\n' );
    fprintf( fid, '    u32 WrBlockCtr;\n' );
end
fprintf( fid, '};\n' );
fprintf( fid, '\n' );
fprintf( fid, 'typedef struct s%s %s;\n', Dvc, Dvc );
fprintf( fid, 'struct s%s {\n', Dvc );
fprintf( fid, '    %-15s*pSysDvce;\n', 'SysDvce' );
fprintf( fid, '    %-15s*pDvcDesc;\n', sprintf( '%sDesc', Dvc ) );
fprintf( fid, '    %-15s*pDvcData;\n', sprintf( '%sData', Dvc ) );
if hasBram == 1
    fprintf( fid, '    u32  (* %-16s ) ( %s *pd );\n', 'TestBram', Dvc );
    fprintf( fid, '    u32  (* %-16s ) ( %s *pd, u32 addr );\n', 'ReadBram', Dvc );
    fprintf( fid, '    void (* %-16s ) ( %s *pd, u32 addr, u32 data );\n', 'WriteBram', Dvc );
    fprintf( fid, '    void (* %-16s ) ( %s *pd, u32 addr, u32 count, u32 data );\n', 'InitBram', Dvc );
    fprintf( fid, '    void (* %-16s ) ( %s *pd, u32 addr, u32 nBits );\n', 'DumpBram', Dvc );
end
fprintf( fid, '    void (* %-16s ) ( %s *pd );\n', 'Dump', Dvc );
fprintf( fid, '};\n' );
fprintf( fid, '\n' );
fclose( fid );
