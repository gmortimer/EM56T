#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void TSInjInit(
    TSInj *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    TSInjDesc *pDvcDesc,
    TSInjData *pDvcData
    );
static void SetParams    ( TSInj *pd );
static void SysDvceDump  ( TSInj *pd );
static void SysDescDump  ( TSInj *pd );
static void SysDataDump  ( TSInj *pd );
static void DvcDataInit  ( TSInj *pd );
static void DvcDataUpd   ( TSInj *pd );
static void DvcDescDump  ( TSInj *pd );
static void DvcDataDump  ( TSInj *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( TSInj *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), TSINJ_CTRL_REG << 2, TSINJ_START ); }
// Example: static void        WriteBuf      ( TSInj *pd, u32 addr, u32 data );

// Declare init structure here with member functions
TSInj TSInjInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void TSInjInit( TSInj *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, TSInjDesc *pDvcDesc, TSInjData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = TSInjInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        TSINJ_CTRL_REG,
        TSINJ_INFO_REG,
        TSINJ_STAT_REG,
        TSINJ_RESET,
        TSINJ_INT_ACK,
        TSINJ_RX_DATA_CTR_REG,
        TSINJ_RX_SYMB_CTR_REG,
        TSINJ_RX_FRAME_CTR_REG,
        TSINJ_RX_BLOCK_CTR_REG,
        TSINJ_TX_DATA_CTR_REG,
        TSINJ_TX_SYMB_CTR_REG,
        TSINJ_TX_FRAME_CTR_REG,
        TSINJ_TX_BLOCK_CTR_REG
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
static void Dump( TSInj *pd ) {
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
static void SetParams( TSInj *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, TSINJ_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, TSINJ_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( TSInj *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( TSInj *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, TSINJ_BOB_REG );
}

static void DvcDataDump( TSInj *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( TSInj *pd )
{
// Insert device-specific TSInjDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( TSInj *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( TSInj *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( TSInj *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( TSInj *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), TSINJ_CTRL_REG << 2, TSINJ_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( TSInj *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


