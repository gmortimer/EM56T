#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void AXIBramCInit(
    AXIBramC *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    AXIBramCDesc *pDvcDesc,
    AXIBramCData *pDvcData
    );
static void SetParams    ( AXIBramC *pd );
static void SysDvceDump  ( AXIBramC *pd );
static void SysDescDump  ( AXIBramC *pd );
static void SysDataDump  ( AXIBramC *pd );
static void DvcDataInit  ( AXIBramC *pd );
static void DvcDataUpd   ( AXIBramC *pd );
static void DvcDescDump  ( AXIBramC *pd );
static void DvcDataDump  ( AXIBramC *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( AXIBramC *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), AXIBRAMC_CTRL_REG << 2, AXIBRAMC_START ); }
// Example: static void        WriteBuf      ( AXIBramC *pd, u32 addr, u32 data );

// Declare init structure here with member functions
AXIBramC AXIBramCInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void AXIBramCInit( AXIBramC *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, AXIBramCDesc *pDvcDesc, AXIBramCData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = AXIBramCInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        AXIBRAMC_CTRL_REG,
        AXIBRAMC_INFO_REG,
        AXIBRAMC_STAT_REG,
        AXIBRAMC_RESET,
        AXIBRAMC_INT_ACK,
        AXIBRAMC_RX_DATA_CTR_REG,
        AXIBRAMC_RX_SYMB_CTR_REG,
        AXIBRAMC_RX_FRAME_CTR_REG,
        AXIBRAMC_RX_BLOCK_CTR_REG,
        AXIBRAMC_TX_DATA_CTR_REG,
        AXIBRAMC_TX_SYMB_CTR_REG,
        AXIBRAMC_TX_FRAME_CTR_REG,
        AXIBRAMC_TX_BLOCK_CTR_REG
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
static void Dump( AXIBramC *pd ) {
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
static void SetParams( AXIBramC *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, AXIBRAMC_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, AXIBRAMC_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( AXIBramC *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( AXIBramC *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, AXIBRAMC_BOB_REG );
}

static void DvcDataDump( AXIBramC *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( AXIBramC *pd )
{
// Insert device-specific AXIBramCDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( AXIBramC *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( AXIBramC *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( AXIBramC *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( AXIBramC *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), AXIBRAMC_CTRL_REG << 2, AXIBRAMC_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( AXIBramC *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


