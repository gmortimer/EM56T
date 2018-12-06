#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void TREmulInit(
    TREmul *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    TREmulDesc *pDvcDesc,
    TREmulData *pDvcData
    );
static void SetParams    ( TREmul *pd );
static void SysDvceDump  ( TREmul *pd );
static void SysDescDump  ( TREmul *pd );
static void SysDataDump  ( TREmul *pd );
static void DvcDataInit  ( TREmul *pd );
static void DvcDataUpd   ( TREmul *pd );
static void DvcDescDump  ( TREmul *pd );
static void DvcDataDump  ( TREmul *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( TREmul *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), TREMUL_CTRL_REG << 2, TREMUL_START ); }
// Example: static void        WriteBuf      ( TREmul *pd, u32 addr, u32 data );

// Declare init structure here with member functions
TREmul TREmulInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void TREmulInit( TREmul *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, TREmulDesc *pDvcDesc, TREmulData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = TREmulInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        TREMUL_CTRL_REG,
        TREMUL_INFO_REG,
        TREMUL_STAT_REG,
        TREMUL_RESET,
        TREMUL_INT_ACK,
        TREMUL_RX_DATA_CTR_REG,
        TREMUL_RX_SYMB_CTR_REG,
        TREMUL_RX_FRAME_CTR_REG,
        TREMUL_RX_BLOCK_CTR_REG,
        TREMUL_TX_DATA_CTR_REG,
        TREMUL_TX_SYMB_CTR_REG,
        TREMUL_TX_FRAME_CTR_REG,
        TREMUL_TX_BLOCK_CTR_REG
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
static void Dump( TREmul *pd ) {
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
static void SetParams( TREmul *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, TREMUL_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, TREMUL_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( TREmul *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( TREmul *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, TREMUL_BOB_REG );
}

static void DvcDataDump( TREmul *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( TREmul *pd )
{
// Insert device-specific TREmulDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( TREmul *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( TREmul *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( TREmul *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( TREmul *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), TREMUL_CTRL_REG << 2, TREMUL_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( TREmul *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


