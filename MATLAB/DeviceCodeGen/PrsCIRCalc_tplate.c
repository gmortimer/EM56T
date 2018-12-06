#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void PrsCIRCalcInit(
    PrsCIRCalc *pd,
    char      *Name,
    u32       BaseAddr,
    SysCtrl   *pSysCtrl,
    SysDvce   *pSysDvce,
    SysDesc   *pSysDesc,
    SysPtrs   *pSysPtrs,
    SysData   *pSysData,
    PrsCIRCalcDesc *pPrsCIRCalcDesc,
    PrsCIRCalcData *pPrsCIRCalcData
    );
static void SetParams    ( PrsCIRCalc *pd );
static void SysDvceDump  ( PrsCIRCalc *pd );
static void SysDescDump  ( PrsCIRCalc *pd );
static void SysDataDump  ( PrsCIRCalc *pd );
static void DvcDataInit  ( PrsCIRCalc *pd );
static void DvcDataUpd   ( PrsCIRCalc *pd );
static void DvcDescDump  ( PrsCIRCalc *pd );
static void DvcDataDump  ( PrsCIRCalc *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( PrsCIRCalc *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), PRSCIRCALC_CTRL_REG << 2, PRSCIRCALC_START ); }
// Example: static void        WriteBuf      ( PrsCIRCalc *pd, u32 addr, u32 data );

// Declare init structure here with member functions
PrsCIRCalc PrsCIRCalcInitStr = {
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void PrsCIRCalcInit( PrsCIRCalc *pd, char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, PrsCIRCalcDesc *pPrsCIRCalcDesc, PrsCIRCalcData *pPrsCIRCalcData )
{
    *pd             = PrsCIRCalcInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysData,
        pSysPtrs,
        BaseAddr,
        PRSCIRCALC_CTRL_REG,
        PRSCIRCALC_INFO_REG,
        PRSCIRCALC_STAT_REG,
        PRSCIRCALC_RESET,
        PRSCIRCALC_INT_ACK,
        PRSCIRCALC_RX_DATA_CTR_REG,
        PRSCIRCALC_RX_SYMBOL_CTR_REG,
        PRSCIRCALC_RX_FRAME_CTR_REG,
        PRSCIRCALC_RX_BLOCK_CTR_REG,
        PRSCIRCALC_TX_DATA_CTR_REG,
        PRSCIRCALC_TX_SYMBOL_CTR_REG,
        PRSCIRCALC_TX_FRAME_CTR_REG,
        PRSCIRCALC_TX_BLOCK_CTR_REG
        );
    pd->pPrsCIRCalcDesc  = pPrsCIRCalcDesc;
    pd->pPrsCIRCalcData  = pPrsCIRCalcData;
    DvcDataInit( pd );
    SYSRESET( pd );
    pd->SetParams( pd );
}

//========================
// Dump Device to Console
//========================
static void Dump( PrsCIRCalc *pd ) {
    cprintf( "\n" );
    SYSDVCEDUMP( pd );
    SysDescDump( pd );
    DvcDescDump( pd );
    SYSDATADUMP( pd );
    DvcDataDump( pd );
}

// End of boilerplate code
//========================
// Device-specific code
//========================
static void SetParams( PrsCIRCalc *pd )
{
// Set PL devive slave regs here
// Example SYSWRSLVREG( pd, PRSCIRCALC_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, PRSCIRCALC_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( PrsCIRCalc *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( PrsCIRCalc *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, PRSCIRCALC_BOB_REG );
}

static void DvcDataDump( PrsCIRCalc *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("
Bob  : %u", toUint( DVCDAT( Bob )) );   fflush( stdout );
}

static void SysDescDump( PrsCIRCalc *pd )
{
// Insert device-specific SysDesc members here
// Example: printf("
Bob  : %u", toUint( SYSPAR( Bob )) );   fflush( stdout );
}

static void DvcDescDump( PrsCIRCalc *pd )
{
// Insert device-specific PrsCIRCalcDesc members here
// Example: printf("
Alice: %u", toUint( DVCPAR( Alice )) ); fflush( stdout );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( PrsCIRCalc *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), PRSCIRCALC_CTRL_REG << 2, PRSCIRCALC_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( PrsCIRCalc *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }

//////////////////////////////////////////////////////
// Insert this code in SystemControl.h
//////////////////////////////////////////////////////
#define CIRPAR( Param ) DEVICE_LOC_PAR( pd, CIR, Param )
#define CIRDAT( Param ) DEVICE_LOC_DAT( pd, CIR, Param )
#define CIR_N_SLV_REGS                 (   )

#define CIR_CTRL_REG                   (  0 )
#define CIR_N_FFT_REG                  (  2 )
#define CIR_N_SYMB_FRAME_REG           (  3 )
#define CIR_N_FRAME_BLOCK_REG          (  4 )

#define CIR_INFO_REG                   (  1 )
#define CIR_STAT_REG                   ( 32 )

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

//////////////////////////////////////////////////////
// Insert this code in SystemControl.h
//////////////////////////////////////////////////////

typedef struct sPrsCIRCalcDesc PrsCIRCalcDesc;
struct sPrsCIRCalcDesc {
};

typedef struct sPrsCIRCalcData PrsCIRCalcData;
struct sPrsCIRCalcData {
    u32 RxDataCtr;
    u32 RxSymbCtr;
    u32 RxFrameCtr;
    u32 RxBlockCtr;
    u32 TxDataCtr;
    u32 TxSymbCtr;
    u32 TxFrameCtr;
    u32 TxBlockCtr;
};

typedef struct sPrsCIRCalc PrsCIRCalc;
struct sPrsCIRCalc {
    SysDvce        *pSysDvce;
    PrsCIRCalcDesc *pDvcDesc;
    PrsCIRCalcData *pDvcData;
    void (* Dump            ) ( PrsCIRCalc *pd );
};

