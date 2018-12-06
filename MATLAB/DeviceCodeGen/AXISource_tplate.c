#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void AXISourceInit(
    AXISource *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    AXISourceDesc *pDvcDesc,
    AXISourceData *pDvcData
    );
static void SetParams    ( AXISource *pd );
static void SysDvceDump  ( AXISource *pd );
static void SysDescDump  ( AXISource *pd );
static void SysDataDump  ( AXISource *pd );
static void DvcDataInit  ( AXISource *pd );
static void DvcDataUpd   ( AXISource *pd );
static void DvcDescDump  ( AXISource *pd );
static void DvcDataDump  ( AXISource *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( AXISource *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), AXISOURCE_CTRL_REG << 2, AXISOURCE_START ); }
// Example: static void        WriteBuf      ( AXISource *pd, u32 addr, u32 data );

// Declare init structure here with member functions
AXISource AXISourceInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void AXISourceInit( AXISource *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, AXISourceDesc *pDvcDesc, AXISourceData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = AXISourceInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        AXISOURCE_CTRL_REG,
        AXISOURCE_INFO_REG,
        AXISOURCE_STAT_REG,
        AXISOURCE_RESET,
        AXISOURCE_INT_ACK,
        AXISOURCE_RX_DATA_CTR_REG,
        AXISOURCE_RX_SYMB_CTR_REG,
        AXISOURCE_RX_FRAME_CTR_REG,
        AXISOURCE_RX_BLOCK_CTR_REG,
        AXISOURCE_TX_DATA_CTR_REG,
        AXISOURCE_TX_SYMB_CTR_REG,
        AXISOURCE_TX_FRAME_CTR_REG,
        AXISOURCE_TX_BLOCK_CTR_REG
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
static void Dump( AXISource *pd ) {
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
static void SetParams( AXISource *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, AXISOURCE_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, AXISOURCE_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( AXISource *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( AXISource *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, AXISOURCE_BOB_REG );
}

static void DvcDataDump( AXISource *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( AXISource *pd )
{
// Insert device-specific AXISourceDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( AXISource *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( AXISource *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( AXISource *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( AXISource *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), AXISOURCE_CTRL_REG << 2, AXISOURCE_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( AXISource *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


