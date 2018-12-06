#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void PrsCIRInit(
    PrsCIR *pd,
    char      *Name,
    u32       BaseAddr,
    SysCtrl   *pSysCtrl,
    SysDvce   *pSysDvce,
    SysDesc   *pSysDesc,
    SysPtrs   *pSysPtrs,
    SysData   *pSysData,
    PrsCIRDesc *pPrsCIRDesc,
    PrsCIRData *pPrsCIRData
    );
static void SetParams    ( PrsCIR *pd );
static void SysDvceDump  ( PrsCIR *pd );
static void SysDescDump  ( PrsCIR *pd );
static void SysDataDump  ( PrsCIR *pd );
static void DvcDataInit  ( PrsCIR *pd );
static void DvcDataUpd   ( PrsCIR *pd );
static void DvcDescDump  ( PrsCIR *pd );
static void DvcDataDump  ( PrsCIR *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( PrsCIR *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), PRSCIR_CTRL_REG << 2, PRSCIR_START ); }
// Example: static void        WriteBuf      ( PrsCIR *pd, u32 addr, u32 data );
static u32  TestBram        ( PrsCIR *pd );
static u32  ReadBram        ( PrsCIR *pd, u32 addr );
static void WriteBram       ( PrsCIR *pd, u32 addr, u32 data );
static void InitBram        ( PrsCIR *pd, u32 addr, u32 count, u32 data );
//static void LoadBram        ( PrsCIR *pd );
static void DumpBram        ( PrsCIR *pd, u32 addr, u32 nBits );
static void Dump            ( PrsCIR *pd );

// Declare init structure here with member functions
PrsCIR PrsCIRInitStr = {
    NULL,
    NULL,
    NULL,
    TestBram        ,
    ReadBram        ,
    WriteBram       ,
    InitBram        ,
//    LoadBram        ,
    DumpBram        ,
    Dump
};

//===================
// Initialize Device
//===================
void PrsCIRInit( PrsCIR *pd, char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, PrsCIRDesc *pPrsCIRDesc, PrsCIRData *pPrsCIRData )
{
    *pd             = PrsCIRInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysData,
        pSysPtrs,
        BaseAddr,
        PRSCIR_CTRL_REG,
        PRSCIR_INFO_REG,
        PRSCIR_STAT_REG,
        PRSCIR_RESET,
        PRSCIR_INT_ACK,
        PRSCIR_RX_DATA_CTR_REG,
        PRSCIR_RX_SYMBOL_CTR_REG,
        PRSCIR_RX_FRAME_CTR_REG,
        PRSCIR_RX_BLOCK_CTR_REG,
        PRSCIR_TX_DATA_CTR_REG,
        PRSCIR_TX_SYMBOL_CTR_REG,
        PRSCIR_TX_FRAME_CTR_REG,
        PRSCIR_TX_BLOCK_CTR_REG
        );
    pd->pPrsCIRDesc  = pPrsCIRDesc;
    pd->pPrsCIRData  = pPrsCIRData;
    DvcDataInit( pd );
    ( void ) pd->TestBram( pd );    SYSRESET( pd );
    SetParams( pd );
}

//========================
// Dump Device to Console
//========================
static void Dump( PrsCIR *pd ) {
    cprintf( "\n" );
    SysDvceDump( pd );
    SysDescDump( pd );
    DvcDescDump( pd );
    SysDataDump( pd );
    DvcDataDump( pd );
    cprintf( "\n" );
}

// End of boilerplate code
//========================
// Device-specific code
//========================
static void SetParams( PrsCIR *pd )
{
// Set PL device slave regs here
// Example SYSWRSLVREG( pd, PRSCIR_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, PRSCIR_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( PrsCIR *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( PrsCIR *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, PRSCIR_BOB_REG );
}

static void DvcDataDump( PrsCIR *pd )
{
    DvcDataUpd( pd )// Insert device-specific SysDesc members here
// Example: cprintf("
Bob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void SysDvceDump( PrsCIR *pd )
{
    SYSDVCEDUMP( pd );
}

static void SysDataDump( PrsCIR *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( PrsCIR *pd )
{
// Insert device-specific PrsCIRDesc members here
// Example: cprintf("
Alice: %u", toUint( SYSPAR( Alice )) ); fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
static inline void EnterAdmin        ( PrsCIR *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), CIR_CTRL_REG << 2, CIR_ENTER_ADMIN ); }
static inline void ExitAdmin         ( PrsCIR *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), CIR_CTRL_REG << 2, CIR_EXIT_ADMIN  ); }
// Example: static inline void EnterAdmin    ( PrsCIR *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), PRSCIR_CTRL_REG << 2, PRSCIR_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( PrsCIR *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }

// BRAM Access from PS

static void DumpBram( PrsCIR *pd, u32 addr, u32 nbits )
{
    char s[ 2 * SYS_MAX_OBJ_NAME_LEN + 1 ]; strcpy( s, SYSDVC( Name ) );
    strcat( s, " Bram" );
    dmpSelector dsel = DUMP_SEL_CIR_BRAM;

    if ( nbits == 0 )
        utilScreenDumpData( dsel, DUMP_FMT_HEX,       DUMP_TYP_MEMORY, addr, 4,     0, ( u32 )pd, s );
    else if(( nbits >= 8 ) && ( nbits <= 16 ))
        utilScreenDumpData( dsel, DUMP_FMT_IQ_SIGNED, DUMP_TYP_MEMORY, addr, nbits, 0, ( u32 )pd, s );
    else
        cprintf( "Format must be 0 (hex) or 8-16 (decimal Q:I)
" );
}

static u32 ReadBram( PrsCIR *pd, u32 addr )
{
    EnterAdmin( pd );
    u32 u = hwReadData( SYSDVC( BaseAddr ),
                   CIR_CTRL_REG << 2, CIR_AD_RD_BRAM, CIR_AD_RD_ACK,
                   CIR_STAT_REG << 2, CIR_AD_RD_RDY,
                   CIR_AD_RD_WR_ADDR_REG << 2, addr,
                   CIR_AD_RD_DATA_REG << 2
                   );
    ExitAdmin( pd );
    return( u );
}

static void WriteBram( PrsCIR *pd, u32 addr, u32 data )
{
    EnterAdmin( pd );
    hwWriteData( SYSDVC( BaseAddr ),
                CIR_CTRL_REG << 2, CIR_AD_WR_BRAM,
                CIR_AD_RD_WR_ADDR_REG << 2, addr,
                CIR_AD_WR_DATA_REG << 2, data
                );
    ExitAdmin( pd );
}

static void InitBram( PrsCIR *pd, u32 addr, u32 count, u32 val )
{
    EnterAdmin( pd );
    for( int i = 0; i < count; i++ )
    {
        hwWriteData( SYSDVC( BaseAddr ),
                    CIR_CTRL_REG << 2, CIR_AD_WR_BRAM,
                    CIR_AD_RD_WR_ADDR_REG << 2, addr + i,
                    CIR_AD_WR_DATA_REG << 2, val
                    );
    }
    ExitAdmin( pd );
}

//static void LoadBram( PrsCIR *pd )
//{
//    EnterAdmin( pd );
//    for ( int i = 0; i < LENGTH; i++ )
//    {
//        hwWriteData( SYSDVC( BaseAddr ),
//                CIR_CTRL_REG << 2, CIR_AD_WR_BRAM,
//                CIR_AD_RD_WR_ADDR_REG << 2, i,
//                CIR_AD_WR_DATA_REG << 2, SYSPTR( pBuf[ i ] )
//        );
//    }
//    ExitAdmin( pd );
//}



// BRAM Test Code
static u32 ReadBR( u32 addr )
{
    static PrsCIR *pd = NULL;
    if ( addr & 0x80000000 ) { pd = ( PrsCIR * ) ( addr & 0x7FFFFFFF ); }
    else if ( pd != NULL ) { return ( pd->ReadBram( pd, ( u32 )addr )); }
    return( 0 );
}

static void WriteBR( u32 addr, u32 data )
{
    static PrsCIR *pd = NULL;
    if ( addr & 0x80000000 ) { pd = ( PrsCIR * )( addr & 0x7FFFFFFF ); }
    else if ( pd != NULL ) { pd->WriteBram( pd, ( u32 )addr, data ); }
}


static u32 TestBram( PrsCIR *pd )
{
    char Name[ 2 * SYS_MAX_OBJ_NAME_LEN + 1]; strcpy( Name, SYSDVC( Name ) );
    ( void ) ReadBR( ( u32 ) pd | 0x80000000 );
    WriteBR( ( u32 ) pd | 0x80000000, 0 );
    return ( UtilTestBram( ReadBR, WriteBR, DVCPAR( BramSize ), 0xFFFFFFFF, strcat( Name, " BRAM" ) ));
}



//////////////////////////////////////////////////////
// Insert this code in <device>.h
//////////////////////////////////////////////////////
#define CIRPAR( Param ) DEVICE_LOC_PAR( pd, CIR, Param )
#define CIRDAT( Param ) DEVICE_LOC_DAT( pd, CIR, Param )
#define CIR_N_SLV_REGS                 (   )

#define CIR_CTRL_REG                   (  0 )
#define CIR_N_FFT_REG                  (  2 )
#define CIR_N_SYMB_FRAME_REG           (  3 )
#define CIR_N_FRAME_BLOCK_REG          (  4 )
#define CIR_AD_RD_WR_ADDR_REG          (  8 )
#define CIR_AD_WR_DATA_REG             (  9 )

#define CIR_INFO_REG                   (  1 )
#define CIR_STAT_REG                   (    )

#define CIR_RX_DATA_CTR_REG            (    )
#define CIR_RX_SYMB_CTR_REG            (    )
#define CIR_RX_FRAME_CTR_REG           (    )
#define CIR_RX_BLOCK_CTR_REG           (    )
#define CIR_TX_DATA_CTR_REG            (    )
#define CIR_TX_SYMB_CTR_REG            (    )
#define CIR_TX_FRAME_CTR_REG           (    )
#define CIR_TX_BLOCK_CTR_REG           (    )

// Control register bits
#define CIR_RESET                      ( 0x00000001 )
#define CIR_INT_ACK                    ( 0x00000002 )
#define CIR_ENTER_ADMIN                ( 0x00000010 )
#define CIR_EXIT_ADMIN                 ( 0x00000020 )
#define CIR_AD_WR_BRAM                 ( 0x00000040 )
#define CIR_AD_RD_BRAM                 ( 0x00000080 )
#define CIR_AD_RD_ACK                  ( 0x00000100 )


//////////////////////////////////////////////////////
// Insert this code in SystemControl.h
//////////////////////////////////////////////////////

typedef struct sPrsCIRDesc PrsCIRDesc;
struct sPrsCIRDesc {
    u32 BramSize;
};

typedef struct sPrsCIRData PrsCIRData;
struct sPrsCIRData {
    u32 RxDataCtr;
    u32 RxSymbCtr;
    u32 RxFrameCtr;
    u32 RxBlockCtr;
    u32 TxDataCtr;
    u32 TxSymbCtr;
    u32 TxFrameCtr;
    u32 TxBlockCtr;
};

typedef struct sPrsCIR PrsCIR;
struct sPrsCIR {
    SysDvce        *pSysDvce;
    PrsCIRDesc     *pDvcDesc;
    PrsCIRData     *pDvcData;
    u32  (* TestBram         ) ( PrsCIR *pd );
    u32  (* ReadBram         ) ( PrsCIR *pd, u32 addr );
    void (* WriteBram        ) ( PrsCIR *pd, u32 addr, u32 data );
    void (* InitBram         ) ( PrsCIR *pd, u32 addr, u32 count, u32 data );
    void (* DumpBram         ) ( PrsCIR *pd, u32 addr, u32 nBits );
    void (* Dump             ) ( PrsCIR *pd );
};

