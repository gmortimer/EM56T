#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void NSDetInit(
    NSDet *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    NSDetDesc *pDvcDesc,
    NSDetData *pDvcData
    );
static void SetParams    ( NSDet *pd );
static void SysDvceDump  ( NSDet *pd );
static void SysDescDump  ( NSDet *pd );
static void SysDataDump  ( NSDet *pd );
static void DvcDataInit  ( NSDet *pd );
static void DvcDataUpd   ( NSDet *pd );
static void DvcDescDump  ( NSDet *pd );
static void DvcDataDump  ( NSDet *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( NSDet *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), NSDET_CTRL_REG << 2, NSDET_START ); }
// Example: static void        WriteBuf      ( NSDet *pd, u32 addr, u32 data );

// Declare init structure here with member functions
NSDet NSDetInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void NSDetInit( NSDet *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, NSDetDesc *pDvcDesc, NSDetData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = NSDetInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        NSDET_CTRL_REG,
        NSDET_INFO_REG,
        NSDET_STAT_REG,
        NSDET_RESET,
        NSDET_INT_ACK,
        NSDET_RX_DATA_CTR_REG,
        NSDET_RX_SYMB_CTR_REG,
        NSDET_RX_FRAME_CTR_REG,
        NSDET_RX_BLOCK_CTR_REG,
        NSDET_TX_DATA_CTR_REG,
        NSDET_TX_SYMB_CTR_REG,
        NSDET_TX_FRAME_CTR_REG,
        NSDET_TX_BLOCK_CTR_REG
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
static void Dump( NSDet *pd ) {
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
static void SetParams( NSDet *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, NSDET_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, NSDET_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( NSDet *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( NSDet *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, NSDET_BOB_REG );
}

static void DvcDataDump( NSDet *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( NSDet *pd )
{
// Insert device-specific NSDetDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( NSDet *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( NSDet *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( NSDet *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( NSDet *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), NSDET_CTRL_REG << 2, NSDET_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( NSDet *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


