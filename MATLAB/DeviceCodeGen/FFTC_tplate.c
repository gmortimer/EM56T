#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void FFTCInit(
    FFTC *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    FFTCDesc *pDvcDesc,
    FFTCData *pDvcData
    );
static void SetParams    ( FFTC *pd );
static void SysDvceDump  ( FFTC *pd );
static void SysDescDump  ( FFTC *pd );
static void SysDataDump  ( FFTC *pd );
static void DvcDataInit  ( FFTC *pd );
static void DvcDataUpd   ( FFTC *pd );
static void DvcDescDump  ( FFTC *pd );
static void DvcDataDump  ( FFTC *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( FFTC *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), FFTC_CTRL_REG << 2, FFTC_START ); }
// Example: static void        WriteBuf      ( FFTC *pd, u32 addr, u32 data );

// Declare init structure here with member functions
FFTC FFTCInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void FFTCInit( FFTC *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, FFTCDesc *pDvcDesc, FFTCData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = FFTCInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        FFTC_CTRL_REG,
        FFTC_INFO_REG,
        FFTC_STAT_REG,
        FFTC_RESET,
        FFTC_INT_ACK,
        FFTC_RX_DATA_CTR_REG,
        FFTC_RX_SYMB_CTR_REG,
        FFTC_RX_FRAME_CTR_REG,
        FFTC_RX_BLOCK_CTR_REG,
        FFTC_TX_DATA_CTR_REG,
        FFTC_TX_SYMB_CTR_REG,
        FFTC_TX_FRAME_CTR_REG,
        FFTC_TX_BLOCK_CTR_REG
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
static void Dump( FFTC *pd ) {
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
static void SetParams( FFTC *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, FFTC_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, FFTC_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( FFTC *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( FFTC *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, FFTC_BOB_REG );
}

static void DvcDataDump( FFTC *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( FFTC *pd )
{
// Insert device-specific FFTCDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( FFTC *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( FFTC *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( FFTC *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( FFTC *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), FFTC_CTRL_REG << 2, FFTC_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( FFTC *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


