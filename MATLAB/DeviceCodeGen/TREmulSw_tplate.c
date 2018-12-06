#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void TREmulSwInit(
    TREmulSw *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    TREmulSwDesc *pDvcDesc,
    TREmulSwData *pDvcData
    );
static void SetParams    ( TREmulSw *pd );
static void SysDvceDump  ( TREmulSw *pd );
static void SysDescDump  ( TREmulSw *pd );
static void SysDataDump  ( TREmulSw *pd );
static void DvcDataInit  ( TREmulSw *pd );
static void DvcDataUpd   ( TREmulSw *pd );
static void DvcDescDump  ( TREmulSw *pd );
static void DvcDataDump  ( TREmulSw *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( TREmulSw *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), TREMULSW_CTRL_REG << 2, TREMULSW_START ); }
// Example: static void        WriteBuf      ( TREmulSw *pd, u32 addr, u32 data );

// Declare init structure here with member functions
TREmulSw TREmulSwInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void TREmulSwInit( TREmulSw *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, TREmulSwDesc *pDvcDesc, TREmulSwData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = TREmulSwInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        TREMULSW_CTRL_REG,
        TREMULSW_INFO_REG,
        TREMULSW_STAT_REG,
        TREMULSW_RESET,
        TREMULSW_INT_ACK,
        TREMULSW_RX_DATA_CTR_REG,
        TREMULSW_RX_SYMB_CTR_REG,
        TREMULSW_RX_FRAME_CTR_REG,
        TREMULSW_RX_BLOCK_CTR_REG,
        TREMULSW_TX_DATA_CTR_REG,
        TREMULSW_TX_SYMB_CTR_REG,
        TREMULSW_TX_FRAME_CTR_REG,
        TREMULSW_TX_BLOCK_CTR_REG
        );
    pd->pDvcDesc  = pDvcDesc;
    pd->pDvcData  = pDvcData;
    DvcDataInit( pd );
    SYSRESET( pd );
    SetParams( pd );
}

//========================
// Dump Device to Console
//========================
static void Dump( TREmulSw *pd ) {
    printf("\n"); fflush( stdout );
    SysDvceDump( pd );
    SysDescDump( pd );
    DvcDescDump( pd );
    SysDataDump( pd );
    DvcDataDump( pd );
}

// End of boilerplate code
//========================
// Device-specific code
//========================
static void SetParams( TREmulSw *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, TREMULSW_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, TREMULSW_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( TREmulSw *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( TREmulSw *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, TREMULSW_BOB_REG );
}

static void DvcDataDump( TREmulSw *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( TREmulSw *pd )
{
// Insert device-specific TREmulSwDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( TREmulSw *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( TREmulSw *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( TREmulSw *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( TREmulSw *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), TREMULSW_CTRL_REG << 2, TREMULSW_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( TREmulSw *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


