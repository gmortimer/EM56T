#include "include.h"


// =================================
// Boilerplate Function Declarations
// =================================
void PrsBPAInit(
    PrsBPA *pd,
    char      *Name,
    u32       BaseAddr,
    SysCtrl   *pSysCtrl,
    SysDvce   *pSysDvce,
    SysDesc   *pSysDesc,
    SysPtrs   *pSysPtrs,
    SysData   *pSysData,
    PrsBPADesc *pDvcDesc,
    PrsBPAData *pDvcData
    );

static void SetParams    ( PrsBPA *pd );
static void SysDvceDump  ( PrsBPA *pd );
static void SysDescDump  ( PrsBPA *pd );
static void SysDataDump  ( PrsBPA *pd );
static void DvcDataInit  ( PrsBPA *pd );
static void DvcDataUpd   ( PrsBPA *pd );
static void DvcDescDump  ( PrsBPA *pd );
static void DvcDataDump  ( PrsBPA *pd );

// =================================================
// Device Structure Member Functions (public access)
// =================================================
// Insert device-specific member function prototypes here
// Example: static inline void Start         ( PrsBPA *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), PRSBPA_CTRL_REG << 2, PRSBPA_START ); }
// Example: static void        WriteBuf      ( PrsBPA *pd, u32 addr, u32 data );
static void Dump            ( PrsBPA *pd );

// Declare init structure here with member functions
PrsBPA PrsBPAInitStr = {
    NULL,
    NULL,
    NULL,
    Dump
};

//===================
// Initialize Device
//===================
void PrsBPAInit( PrsBPA *pd, char *Name, u32 BaseAddr, SysCtrl *pSysCtrl, SysDvce *pSysDvce, SysDesc *pSysDesc, SysPtrs *pSysPtrs, SysData *pSysData, PrsBPADesc *pDvcDesc, PrsBPAData *pDvcData )
{
    *pd             = PrsBPAInitStr;
    pd->pSysDvce    = pSysDvce;
    SysDvceInit(
        pd->pSysDvce,
        Name,
        pSysCtrl,
        pSysDesc,
        pSysPtrs,
        pSysData,
        BaseAddr,
        BPA_CTRL_REG,
        BPA_INFO_REG,
        BPA_STAT_REG,
        BPA_RESET,
        BPA_INT_ACK,
        0,
        0,
        0,
        0,
        BPA_TX_DATA_CTR_REG,
        BPA_TX_SYMB_CTR_REG,
        BPA_TX_FRAME_CTR_REG,
        BPA_TX_BLOCK_CTR_REG
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
static void Dump( PrsBPA *pd ) {
    cprintf( "\n" );
    SysDvceDump( pd );
    SysDescDump( pd );
    DvcDescDump( pd );
    SysDataDump( pd );
    DvcDataDump( pd );
    cprintf( "\n" );
}

// End of boilerplate code
//========================
// Device-specific code
//========================
static void SetParams( PrsBPA *pd )
{
// Set PL device slave regs here
// Example SYSWRSLVREG( pd, PRSBPA_BOB_REG,    SYSPAR( Bob   ));
// Example SYSWRSLVREG( pd, PRSBPA_ALICE_REG , SYSPAR( Alice ));
}

static void DvcDataInit( PrsBPA *pd )
{
// Initialise DvcData members here
// Example: DVCDAT( Bob ) = 0;
}

static void DvcDataUpd( PrsBPA *pd )
{
// Update DvcData members here
// Example:	DVCDAT( Bob ) = SYSRDSLVREG( pd, PRSBPA_BOB_REG );
}

static void DvcDataDump( PrsBPA *pd )
{
    DvcDataUpd( pd );
// Insert device-specific SysDesc members here
// Example: cprintf("\nBob  : %u", toUint( DVCDAT( Bob )) );
}

static void DvcDescDump( PrsBPA *pd )
{
// Insert device-specific PrsBPADesc members here
// Example: cprintf("\nAlice: %u", toUint( SYSPAR( Alice )) );
}

static void SysDvceDump( PrsBPA *pd )
{
    SYSDVCEDUMP( pd );
}

static void SysDataDump( PrsBPA *pd )
{
    SYSDATADUMP( pd );
}

static void SysDescDump( PrsBPA *pd )
{
// Insert device-specific PrsBPADesc members here
// Example: cprintf("\nAlice: %u", toUint( SYSPAR( Alice )) );
}


// Insert device-specific code here
//======================================
// Device-specific non member functions
//======================================
// Example: static inline void EnterAdmin    ( PrsBPA *pd ) { hwWriteCtrlReg( SYSDVC( BaseAddr ), PRSBPA_CTRL_REG << 2, PRSBPA_ENTER_ADMIN ); }

//=================================
// Device-specific member functions
//=================================

// Example:
// static u32 ReadBuf( PrsBPA *pd, u32 addr )
// {
//     return ( SYSPTR( pBuf[ addr ] ));
// }



//////////////////////////////////////////////////////
// Insert this code in <device>.h
//////////////////////////////////////////////////////
#define BPAPAR( Param ) DEVICE_LOC_PAR( pd, BPA, Param )
#define BPADAT( Param ) DEVICE_LOC_DAT( pd, BPA, Param )
#define BPA_N_SLV_REGS                 (   )

#define BPA_CTRL_REG                   (  0 )
#define BPA_N_FFT_REG                  (  2 )
#define BPA_N_SYMB_FRAME_REG           (  3 )
#define BPA_N_FRAME_BLOCK_REG          (  4 )

#define BPA_INFO_REG                   (  1 )
#define BPA_STAT_REG                   (    )

#define BPA_TX_DATA_CTR_REG            (    )
#define BPA_TX_SYMB_CTR_REG            (    )
#define BPA_TX_FRAME_CTR_REG           (    )
#define BPA_TX_BLOCK_CTR_REG           (    )

// Control register bits
#define BPA_RESET                      ( 0x00000001 )
#define BPA_INT_ACK                    ( 0x00000002 )


//////////////////////////////////////////////////////
// Insert this code in SystemControl.h
//////////////////////////////////////////////////////

typedef struct sPrsBPADesc PrsBPADesc;
struct sPrsBPADesc {
};

typedef struct sPrsBPAData PrsBPAData;
struct sPrsBPAData {
    u32 TxDataCtr;
    u32 TxSymbCtr;
    u32 TxFrameCtr;
    u32 TxBlockCtr;
};

typedef struct sPrsBPA PrsBPA;
struct sPrsBPA {
    SysDvce        *pSysDvce;
    PrsBPADesc     *pDvcDesc;
    PrsBPAData     *pDvcData;
    void (* Dump             ) ( PrsBPA *pd );
};

