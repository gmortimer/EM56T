#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void AXISinkInit(
    AXISink *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    AXISinkDesc *pDvcDesc,
    AXISinkData *pDvcData
    );
static void SetParams    ( AXISink *pd );
static void SysDvceDump  ( AXISink *pd );
static void SysDescDump  ( AXISink *pd );
static void SysDataDump  ( AXISink *pd );
static void DvcDataInit  ( AXISink *pd );
static void DvcDataUpd   ( AXISink *pd );
static void DvcDescDump  ( AXISink *pd );
static void DvcDataDump  ( AXISink *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( AXISink *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), AXISINK_CTRL_REG << 2, AXISINK_START ); }
// Example: static void        WriteBuf      ( AXISink *pd, u32 addr, u32 data );

// Declare init structure here with member functions
AXISink AXISinkInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void AXISinkInit( AXISink *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, AXISinkDesc *pDvcDesc, AXISinkData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = AXISinkInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        AXISINK_CTRL_REG,
        AXISINK_INFO_REG,
        AXISINK_STAT_REG,
        AXISINK_RESET,
        AXISINK_INT_ACK,
        AXISINK_RX_DATA_CTR_REG,
        AXISINK_RX_SYMB_CTR_REG,
        AXISINK_RX_FRAME_CTR_REG,
        AXISINK_RX_BLOCK_CTR_REG,
        AXISINK_TX_DATA_CTR_REG,
        AXISINK_TX_SYMB_CTR_REG,
        AXISINK_TX_FRAME_CTR_REG,
        AXISINK_TX_BLOCK_CTR_REG
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
static void Dump( AXISink *pd ) {
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
static void SetParams( AXISink *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, AXISINK_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, AXISINK_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( AXISink *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( AXISink *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, AXISINK_BOB_REG );
}

static void DvcDataDump( AXISink *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( AXISink *pd )
{
// Insert device-specific AXISinkDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( AXISink *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( AXISink *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( AXISink *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( AXISink *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), AXISINK_CTRL_REG << 2, AXISINK_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( AXISink *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


