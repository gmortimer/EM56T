#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void FreqCtrInit(
    FreqCtr *pd,
    const char      *Name,
    u32             BaseAddr,
    SysCtrl         *pSysCtrl,
    SysDvce         *pSysDvce,
    SysDesc         *pSysDesc,
    SysPtrs         *pSysPtrs,
    SysData         *pSysData,
    FreqCtrDesc *pDvcDesc,
    FreqCtrData *pDvcData
    );
static void SetParams    ( FreqCtr *pd );
static void SysDvceDump  ( FreqCtr *pd );
static void SysDescDump  ( FreqCtr *pd );
static void SysDataDump  ( FreqCtr *pd );
static void DvcDataInit  ( FreqCtr *pd );
static void DvcDataUpd   ( FreqCtr *pd );
static void DvcDescDump  ( FreqCtr *pd );
static void DvcDataDump  ( FreqCtr *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( FreqCtr *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), FREQCTR_CTRL_REG << 2, FREQCTR_START ); }
// Example: static void        WriteBuf      ( FreqCtr *pd, u32 addr, u32 data );

// Declare init structure here with member functions
FreqCtr FreqCtrInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void FreqCtrInit( FreqCtr *pd, const char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, FreqCtrDesc *pDvcDesc, FreqCtrData *pDvcData )
{
    if ( BaseAddr == 0 ) return;
    *pd             = FreqCtrInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        FREQCTR_CTRL_REG,
        FREQCTR_INFO_REG,
        FREQCTR_STAT_REG,
        FREQCTR_RESET,
        FREQCTR_INT_ACK,
        FREQCTR_RX_DATA_CTR_REG,
        FREQCTR_RX_SYMB_CTR_REG,
        FREQCTR_RX_FRAME_CTR_REG,
        FREQCTR_RX_BLOCK_CTR_REG,
        FREQCTR_TX_DATA_CTR_REG,
        FREQCTR_TX_SYMB_CTR_REG,
        FREQCTR_TX_FRAME_CTR_REG,
        FREQCTR_TX_BLOCK_CTR_REG
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
static void Dump( FreqCtr *pd ) {
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
static void SetParams( FreqCtr *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, FREQCTR_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, FREQCTR_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( FreqCtr *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( FreqCtr *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, FREQCTR_BOB_REG );
}

static void DvcDataDump( FreqCtr *pd )
{
   DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void DvcDescDump( FreqCtr *pd )
{
// Insert device-specific FreqCtrDesc members here
// Example: printf("\nAlice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}

static void SysDvceDump( FreqCtr *pd )
{
    SYSDEVCDUMP( pd );
}

static void SysDataDump( FreqCtr *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( FreqCtr *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("\nBob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( FreqCtr *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), FREQCTR_CTRL_REG << 2, FREQCTR_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( FreqCtr *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }


