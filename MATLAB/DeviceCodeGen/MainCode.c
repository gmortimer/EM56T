//===========================================
//// Script-generated code - do not edit ////
//===========================================
//=============
// TxAXISource
//=============
void mainReadTxAXISourceBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pTxAXISource->ReadBram( pEMMSysCtrl->pTxAXISource, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteTxAXISourceBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pTxAXISource->WriteBram( pEMMSysCtrl->pTxAXISource, addr, data );
}

void mainInitTxAXISourceBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pTxAXISource->InitBram( pEMMSysCtrl->pTxAXISource, addr, nwds, data ), nwds, 4 );
}

void mainLoadTxAXISourceBram( shell *psh )
{
	TIME_TFR( pEMMSysCtrl->pTxAXISource->LoadBram( pEMMSysCtrl->pTxAXISource ), DVC_PAR( pEMMSysCtrl->pTxAXISource, BramSize ), 4 );
}

void mainDumpTxAXISourceBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pTxAXISource->DumpBram( pEMMSysCtrl->pTxAXISource, addr, nbits );
}

void mainReadTxAXISourceSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pTxAXISource, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteTxAXISourceSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pTxAXISource, reg, val );
	cprintf( "\n" );
}

void mainDumpTxAXISourceSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pTxAXISource, bBin );
}

void mainDumpTxAXISource( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pTxAXISource );
}

void mainResetTxAXISource( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pTxAXISource );
	cprintf( "Device TxAXISource Reset\n" );
}

//===============
// TxSourceBramC
//===============
void mainReadTxSourceAXIBramCBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pTxSourceAXIBramC->ReadBram( pEMMSysCtrl->pTxSourceAXIBramC, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteTxSourceAXIBramCBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pTxSourceAXIBramC->WriteBram( pEMMSysCtrl->pTxSourceAXIBramC, addr, data );
}

void mainInitTxSourceAXIBramCBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pTxSourceAXIBramC->InitBram( pEMMSysCtrl->pTxSourceAXIBramC, addr, nwds, data ), nwds, 4 );
}

void mainLoadTxSourceAXIBramCBram( shell *psh )
{
	TIME_TFR( pEMMSysCtrl->pTxSourceAXIBramC->LoadBram( pEMMSysCtrl->pTxSourceAXIBramC ), DVC_PAR( pEMMSysCtrl->pTxSourceAXIBramC, BramSize ), 4 );
}

void mainReadTxSourceAXIBramCSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pTxSourceAXIBramC, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteTxSourceAXIBramCSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pTxSourceAXIBramC, reg, val );
	cprintf( "\n" );
}

void mainDumpTxSourceAXIBramCSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pTxSourceAXIBramC, bBin );
}

void mainDumpTxSourceAXIBramC( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pTxSourceAXIBramC );
}

void mainResetTxSourceAXIBramC( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pTxSourceAXIBramC );
	cprintf( "Device TxSourceAXIBramC Reset\n" );
}

//========
// TxFFTC
//========
void mainReadTxFFTCSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pTxFFTC, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteTxFFTCSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pTxFFTC, reg, val );
	cprintf( "\n" );
}

void mainDumpTxFFTCSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pTxFFTC, bBin );
}

void mainDumpTxFFTC( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pTxFFTC );
}

void mainResetTxFFTC( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pTxFFTC );
	cprintf( "Device TxFFTC Reset\n" );
}

//===========
// RxNsdFFTC
//===========
void mainReadRxNsdFFTCSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdFFTC, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdFFTCSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdFFTC, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdFFTCSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdFFTC, bBin );
}

void mainDumpRxNsdFFTC( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdFFTC );
}

void mainResetRxNsdFFTC( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdFFTC );
	cprintf( "Device RxNsdFFTC Reset\n" );
}

//=========
// TxTSInj
//=========
void mainReadTxTSInjTsBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pTxTSInj->ReadTsBuf( pEMMSysCtrl->pTxTSInj, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteTxTSInjTsBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pTxTSInj->WriteTsBuf( pEMMSysCtrl->pTxTSInj, addr, data );
}

void mainInitTxTSInjTsBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pTxTSInj->InitTsBuf( pEMMSysCtrl->pTxTSInj, addr, nwds, data ), nwds, 4 );
}

void mainLoadTxTSInjTsBuf( shell *psh )
{
	TIME_TFR( pEMMSysCtrl->pTxTSInj->LoadTsBuf( pEMMSysCtrl->pTxTSInj ), DVC_PAR( pEMMSysCtrl->pTxTSInj, TsBufSize ), 4 );
}

void mainDumpTxTSInjTsBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pTxTSInj->DumpTsBuf( pEMMSysCtrl->pTxTSInj, addr, nbits );
}

void mainReadTxTSInjTxBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pTxTSInj->ReadTxBuf( pEMMSysCtrl->pTxTSInj, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainDumpTxTSInjTxBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pTxTSInj->DumpTxBuf( pEMMSysCtrl->pTxTSInj, addr, nbits );
}

void mainWriteTxTSInjRxBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pTxTSInj->WriteRxBuf( pEMMSysCtrl->pTxTSInj, addr, data );
}

void mainInitTxTSInjRxBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pTxTSInj->InitRxBuf( pEMMSysCtrl->pTxTSInj, addr, nwds, data ), nwds, 4 );
}

void mainReadTxTSInjPsBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pTxTSInj->ReadPsBuf( pEMMSysCtrl->pTxTSInj, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainDumpTxTSInjPsBuf( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pTxTSInj->DumpPsBuf( pEMMSysCtrl->pTxTSInj, addr, nbits );
}

void mainReadTxTSInjSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pTxTSInj, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteTxTSInjSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pTxTSInj, reg, val );
	cprintf( "\n" );
}

void mainDumpTxTSInjSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pTxTSInj, bBin );
}

void mainDumpTxTSInj( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pTxTSInj );
}

void mainResetTxTSInj( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pTxTSInj );
	cprintf( "Device TxTSInj Reset\n" );
}

//==============
// RFChanTREmul
//==============
void mainReadRFChanTREmulPsLUT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRFChanTREmul->ReadPsLUT( pEMMSysCtrl->pRFChanTREmul, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRFChanTREmulPsLUT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRFChanTREmul->WritePsLUT( pEMMSysCtrl->pRFChanTREmul, addr, data );
}

void mainInitRFChanTREmulPsLUT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRFChanTREmul->InitPsLUT( pEMMSysCtrl->pRFChanTREmul, addr, nwds, data ), nwds, 4 );
}

void mainLoadRFChanTREmulPsLUT( shell *psh )
{
	TIME_TFR( pEMMSysCtrl->pRFChanTREmul->LoadPsLUT( pEMMSysCtrl->pRFChanTREmul ), DVC_PAR( pEMMSysCtrl->pRFChanTREmul, PsLUTSize ), 4 );
}

void mainDumpRFChanTREmulPsLUT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRFChanTREmul->DumpPsLUT( pEMMSysCtrl->pRFChanTREmul, addr, nbits );
}

void mainReadRFChanTREmulHwLUT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRFChanTREmul->ReadHwLUT( pEMMSysCtrl->pRFChanTREmul, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRFChanTREmulHwLUT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRFChanTREmul->WriteHwLUT( pEMMSysCtrl->pRFChanTREmul, addr, data );
}

void mainInitRFChanTREmulHwLUT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRFChanTREmul->InitHwLUT( pEMMSysCtrl->pRFChanTREmul, addr, nwds, data ), nwds, 4 );
}

void mainLoadRFChanTREmulHwLUT( shell *psh )
{
	TIME_TFR( pEMMSysCtrl->pRFChanTREmul->LoadHwLUT( pEMMSysCtrl->pRFChanTREmul ), DVC_PAR( pEMMSysCtrl->pRFChanTREmul, HwLUTSize ), 4 );
}

void mainDumpRFChanTREmulHwLUT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRFChanTREmul->DumpHwLUT( pEMMSysCtrl->pRFChanTREmul, addr, nbits );
}

void mainReadRFChanTREmulSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRFChanTREmul, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRFChanTREmulSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRFChanTREmul, reg, val );
	cprintf( "\n" );
}

void mainDumpRFChanTREmulSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRFChanTREmul, bBin );
}

void mainDumpRFChanTREmul( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRFChanTREmul );
}

void mainResetRFChanTREmul( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRFChanTREmul );
	cprintf( "Device RFChanTREmul Reset\n" );
}

//================
// RFChanTREmulSw
//================
void mainReadRFChanTREmulSwSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRFChanTREmulSw, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRFChanTREmulSwSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRFChanTREmulSw, reg, val );
	cprintf( "\n" );
}

void mainDumpRFChanTREmulSwSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRFChanTREmulSw, bBin );
}

void mainDumpRFChanTREmulSw( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRFChanTREmulSw );
}

void mainResetRFChanTREmulSw( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRFChanTREmulSw );
	cprintf( "Device RFChanTREmulSw Reset\n" );
}

//=====================
// RFChanTREmulFreqCtr
//=====================
void mainReadRFChanTREmulFreqCtrSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRFChanTREmulFreqCtr, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRFChanTREmulFreqCtrSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRFChanTREmulFreqCtr, reg, val );
	cprintf( "\n" );
}

void mainDumpRFChanTREmulFreqCtrSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRFChanTREmulFreqCtr, bBin );
}

void mainDumpRFChanTREmulFreqCtr( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRFChanTREmulFreqCtr );
}

void mainResetRFChanTREmulFreqCtr( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRFChanTREmulFreqCtr );
	cprintf( "Device RFChanTREmulFreqCtr Reset\n" );
}

void mainReadRFChanTREmulFreqCtr( shell *psh )
{
	double g = DVC_FUNC( pEMMSysCtrl->pRFChanTREmulFreqCtr, ReadFreqCtr );
	cprintf( "Frequency: %.6f Mhz\n", g );
}

//==================
// AD9364ClkFreqCtr
//==================
void mainReadAD9364ClkFreqCtrSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pAD9364ClkFreqCtr, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteAD9364ClkFreqCtrSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pAD9364ClkFreqCtr, reg, val );
	cprintf( "\n" );
}

void mainDumpAD9364ClkFreqCtrSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pAD9364ClkFreqCtr, bBin );
}

void mainDumpAD9364ClkFreqCtr( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pAD9364ClkFreqCtr );
}

void mainResetAD9364ClkFreqCtr( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pAD9364ClkFreqCtr );
	cprintf( "Device AD9364ClkFreqCtr Reset\n" );
}

void mainReadAD9364ClkFreqCtr( shell *psh )
{
	double g = DVC_FUNC( pEMMSysCtrl->pAD9364ClkFreqCtr, ReadFreqCtr );
	cprintf( "Frequency: %.6f Mhz\n", g );
}

//==================
// AD9364DACFreqCtr
//==================
void mainReadAD9364DACFreqCtrSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pAD9364DACFreqCtr, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteAD9364DACFreqCtrSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pAD9364DACFreqCtr, reg, val );
	cprintf( "\n" );
}

void mainDumpAD9364DACFreqCtrSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pAD9364DACFreqCtr, bBin );
}

void mainDumpAD9364DACFreqCtr( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pAD9364DACFreqCtr );
}

void mainResetAD9364DACFreqCtr( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pAD9364DACFreqCtr );
	cprintf( "Device AD9364DACFreqCtr Reset\n" );
}

void mainReadAD9364DACFreqCtr( shell *psh )
{
	double g = DVC_FUNC( pEMMSysCtrl->pAD9364DACFreqCtr, ReadFreqCtr );
	cprintf( "Frequency: %.6f Mhz\n", g );
}

//==================
// AD9364ADCFreqCtr
//==================
void mainReadAD9364ADCFreqCtrSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pAD9364ADCFreqCtr, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteAD9364ADCFreqCtrSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pAD9364ADCFreqCtr, reg, val );
	cprintf( "\n" );
}

void mainDumpAD9364ADCFreqCtrSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pAD9364ADCFreqCtr, bBin );
}

void mainDumpAD9364ADCFreqCtr( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pAD9364ADCFreqCtr );
}

void mainResetAD9364ADCFreqCtr( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pAD9364ADCFreqCtr );
	cprintf( "Device AD9364ADCFreqCtr Reset\n" );
}

void mainReadAD9364ADCFreqCtr( shell *psh )
{
	double g = DVC_FUNC( pEMMSysCtrl->pAD9364ADCFreqCtr, ReadFreqCtr );
	cprintf( "Frequency: %.6f Mhz\n", g );
}

//=============
// RxNSDet    
//=============
void mainReadRxNSDetSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNSDet, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNSDetSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNSDet, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNSDetSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNSDet, bBin );
}

void mainDumpRxNSDet( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNSDet );
}

void mainResetRxNSDet( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNSDet );
	cprintf( "Device RxNSDet Reset\n" );
}

//==============
// RxTddAxiSink
//==============
void mainReadRxTddAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxTddAXISink->ReadBram( pEMMSysCtrl->pRxTddAXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxTddAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxTddAXISink->WriteBram( pEMMSysCtrl->pRxTddAXISink, addr, data );
}

void mainInitRxTddAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxTddAXISink->InitBram( pEMMSysCtrl->pRxTddAXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxTddAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxTddAXISink->DumpBram( pEMMSysCtrl->pRxTddAXISink, addr, nbits );
}

void mainReadRxTddAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxTddAXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxTddAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxTddAXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxTddAXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxTddAXISink, bBin );
}

void mainDumpRxTddAXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxTddAXISink );
}

void mainResetRxTddAXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxTddAXISink );
	cprintf( "Device RxTddAXISink Reset\n" );
}

//==============
// RxPrsAxiSink
//==============
void mainReadRxPrsAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxPrsAXISink->ReadBram( pEMMSysCtrl->pRxPrsAXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxPrsAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxPrsAXISink->WriteBram( pEMMSysCtrl->pRxPrsAXISink, addr, data );
}

void mainInitRxPrsAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxPrsAXISink->InitBram( pEMMSysCtrl->pRxPrsAXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxPrsAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxPrsAXISink->DumpBram( pEMMSysCtrl->pRxPrsAXISink, addr, nbits );
}

void mainReadRxPrsAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxPrsAXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxPrsAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxPrsAXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxPrsAXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxPrsAXISink, bBin );
}

void mainDumpRxPrsAXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxPrsAXISink );
}

void mainResetRxPrsAXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxPrsAXISink );
	cprintf( "Device RxPrsAXISink Reset\n" );
}

//==============
// RxDtaAxiSink
//==============
void mainReadRxDtaAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxDtaAXISink->ReadBram( pEMMSysCtrl->pRxDtaAXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxDtaAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxDtaAXISink->WriteBram( pEMMSysCtrl->pRxDtaAXISink, addr, data );
}

void mainInitRxDtaAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxDtaAXISink->InitBram( pEMMSysCtrl->pRxDtaAXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxDtaAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxDtaAXISink->DumpBram( pEMMSysCtrl->pRxDtaAXISink, addr, nbits );
}

void mainReadRxDtaAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxDtaAXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxDtaAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxDtaAXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxDtaAXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxDtaAXISink, bBin );
}

void mainDumpRxDtaAXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxDtaAXISink );
}

void mainResetRxDtaAXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxDtaAXISink );
	cprintf( "Device RxDtaAXISink Reset\n" );
}

//=================
// RxNsdA00AxiSink
//=================
void mainReadRxNsdA00AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxNsdA00AXISink->ReadBram( pEMMSysCtrl->pRxNsdA00AXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxNsdA00AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxNsdA00AXISink->WriteBram( pEMMSysCtrl->pRxNsdA00AXISink, addr, data );
}

void mainInitRxNsdA00AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxNsdA00AXISink->InitBram( pEMMSysCtrl->pRxNsdA00AXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxNsdA00AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxNsdA00AXISink->DumpBram( pEMMSysCtrl->pRxNsdA00AXISink, addr, nbits );
}

void mainReadRxNsdA00AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdA00AXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdA00AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdA00AXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdA00AXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdA00AXISink, bBin );
}

void mainDumpRxNsdA00AXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdA00AXISink );
}

void mainResetRxNsdA00AXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdA00AXISink );
	cprintf( "Device RxNsdA00AXISink Reset\n" );
}

//=================
// RxNsdA01AxiSink
//=================
void mainReadRxNsdA01AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxNsdA01AXISink->ReadBram( pEMMSysCtrl->pRxNsdA01AXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxNsdA01AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxNsdA01AXISink->WriteBram( pEMMSysCtrl->pRxNsdA01AXISink, addr, data );
}

void mainInitRxNsdA01AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxNsdA01AXISink->InitBram( pEMMSysCtrl->pRxNsdA01AXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxNsdA01AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxNsdA01AXISink->DumpBram( pEMMSysCtrl->pRxNsdA01AXISink, addr, nbits );
}

void mainReadRxNsdA01AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdA01AXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdA01AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdA01AXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdA01AXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdA01AXISink, bBin );
}

void mainDumpRxNsdA01AXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdA01AXISink );
}

void mainResetRxNsdA01AXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdA01AXISink );
	cprintf( "Device RxNsdA01AXISink Reset\n" );
}

//=================
// RxNsdA15AxiSink
//=================
void mainReadRxNsdA15AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxNsdA15AXISink->ReadBram( pEMMSysCtrl->pRxNsdA15AXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxNsdA15AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxNsdA15AXISink->WriteBram( pEMMSysCtrl->pRxNsdA15AXISink, addr, data );
}

void mainInitRxNsdA15AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxNsdA15AXISink->InitBram( pEMMSysCtrl->pRxNsdA15AXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxNsdA15AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxNsdA15AXISink->DumpBram( pEMMSysCtrl->pRxNsdA15AXISink, addr, nbits );
}

void mainReadRxNsdA15AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdA15AXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdA15AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdA15AXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdA15AXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdA15AXISink, bBin );
}

void mainDumpRxNsdA15AXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdA15AXISink );
}

void mainResetRxNsdA15AXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdA15AXISink );
	cprintf( "Device RxNsdA15AXISink Reset\n" );
}

//====================
// RxNsdCordicAXISink
//====================
void mainReadRxNsdCordicAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxNsdCordicAXISink->ReadBram( pEMMSysCtrl->pRxNsdCordicAXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxNsdCordicAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxNsdCordicAXISink->WriteBram( pEMMSysCtrl->pRxNsdCordicAXISink, addr, data );
}

void mainInitRxNsdCordicAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxNsdCordicAXISink->InitBram( pEMMSysCtrl->pRxNsdCordicAXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxNsdCordicAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxNsdCordicAXISink->DumpBram( pEMMSysCtrl->pRxNsdCordicAXISink, addr, nbits );
}

void mainReadRxNsdCordicAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdCordicAXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdCordicAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdCordicAXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdCordicAXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdCordicAXISink, bBin );
}

void mainDumpRxNsdCordicAXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdCordicAXISink );
}

void mainResetRxNsdCordicAXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdCordicAXISink );
	cprintf( "Device RxNsdCordicAXISink Reset\n" );
}

//=================
// RxNsdFFTAXISink
//=================
void mainReadRxNsdFFTAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxNsdFFTAXISink->ReadBram( pEMMSysCtrl->pRxNsdFFTAXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxNsdFFTAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxNsdFFTAXISink->WriteBram( pEMMSysCtrl->pRxNsdFFTAXISink, addr, data );
}

void mainInitRxNsdFFTAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxNsdFFTAXISink->InitBram( pEMMSysCtrl->pRxNsdFFTAXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxNsdFFTAXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxNsdFFTAXISink->DumpBram( pEMMSysCtrl->pRxNsdFFTAXISink, addr, nbits );
}

void mainReadRxNsdFFTAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdFFTAXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdFFTAXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdFFTAXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdFFTAXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdFFTAXISink, bBin );
}

void mainDumpRxNsdFFTAXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdFFTAXISink );
}

void mainResetRxNsdFFTAXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdFFTAXISink );
	cprintf( "Device RxNsdFFTAXISink Reset\n" );
}

//====================
// RxNsdBcast00AXISink
//====================
void mainReadRxNsdB00AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxNsdB00AXISink->ReadBram( pEMMSysCtrl->pRxNsdB00AXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxNsdB00AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxNsdB00AXISink->WriteBram( pEMMSysCtrl->pRxNsdB00AXISink, addr, data );
}

void mainInitRxNsdB00AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxNsdB00AXISink->InitBram( pEMMSysCtrl->pRxNsdB00AXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxNsdB00AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxNsdB00AXISink->DumpBram( pEMMSysCtrl->pRxNsdB00AXISink, addr, nbits );
}

void mainReadRxNsdB00AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdB00AXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdB00AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdB00AXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdB00AXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdB00AXISink, bBin );
}

void mainDumpRxNsdB00AXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdB00AXISink );
}

void mainResetRxNsdB00AXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdB00AXISink );
	cprintf( "Device RxNsdB00AXISink Reset\n" );
}

//====================
// RxNsdBcast01AXISink
//====================
void mainReadRxNsdB01AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxNsdB01AXISink->ReadBram( pEMMSysCtrl->pRxNsdB01AXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxNsdB01AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxNsdB01AXISink->WriteBram( pEMMSysCtrl->pRxNsdB01AXISink, addr, data );
}

void mainInitRxNsdB01AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxNsdB01AXISink->InitBram( pEMMSysCtrl->pRxNsdB01AXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxNsdB01AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxNsdB01AXISink->DumpBram( pEMMSysCtrl->pRxNsdB01AXISink, addr, nbits );
}

void mainReadRxNsdB01AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdB01AXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdB01AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdB01AXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdB01AXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdB01AXISink, bBin );
}

void mainDumpRxNsdB01AXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdB01AXISink );
}

void mainResetRxNsdB01AXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdB01AXISink );
	cprintf( "Device RxNsdB01AXISink Reset\n" );
}

//====================
// RxNsdBcast15AXISink
//====================
void mainReadRxNsdB15AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxNsdB15AXISink->ReadBram( pEMMSysCtrl->pRxNsdB15AXISink, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxNsdB15AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxNsdB15AXISink->WriteBram( pEMMSysCtrl->pRxNsdB15AXISink, addr, data );
}

void mainInitRxNsdB15AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxNsdB15AXISink->InitBram( pEMMSysCtrl->pRxNsdB15AXISink, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxNsdB15AXISinkBram( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxNsdB15AXISink->DumpBram( pEMMSysCtrl->pRxNsdB15AXISink, addr, nbits );
}

void mainReadRxNsdB15AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxNsdB15AXISink, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxNsdB15AXISinkSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxNsdB15AXISink, reg, val );
	cprintf( "\n" );
}

void mainDumpRxNsdB15AXISinkSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxNsdB15AXISink, bBin );
}

void mainDumpRxNsdB15AXISink( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxNsdB15AXISink );
}

void mainResetRxNsdB15AXISink( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxNsdB15AXISink );
	cprintf( "Device RxNsdB15AXISink Reset\n" );
}

//=======
// PrsCIR
//=======
void mainReadRxPrsCIRBramFFT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxPrsCIR->ReadBramFFT( pEMMSysCtrl->pRxPrsCIR, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxPrsCIRBramFFT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxPrsCIR->WriteBramFFT( pEMMSysCtrl->pRxPrsCIR, addr, data );
}

void mainInitRxPrsCIRBramFFT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxPrsCIR->InitBramFFT( pEMMSysCtrl->pRxPrsCIR, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxPrsCIRBramFFT( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxPrsCIR->DumpBramFFT( pEMMSysCtrl->pRxPrsCIR, addr, nbits );
}

void mainReadRxPrsCIRBramABS( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = pEMMSysCtrl->pRxPrsCIR->ReadBramABS( pEMMSysCtrl->pRxPrsCIR, addr );
    cprintf( " data = %u 0x%08x\n", toUint( data ), toUint( data ) );
}

void mainWriteRxPrsCIRBramABS( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 data  = psh->uarg[ 1 ];
	pEMMSysCtrl->pRxPrsCIR->WriteBramABS( pEMMSysCtrl->pRxPrsCIR, addr, data );
}

void mainInitRxPrsCIRBramABS( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nwds  = psh->uarg[ 1 ];
	u32 data  = psh->uarg[ 2 ];
	TIME_TFR( pEMMSysCtrl->pRxPrsCIR->InitBramABS( pEMMSysCtrl->pRxPrsCIR, addr, nwds, data ), nwds, 4 );
}

void mainDumpRxPrsCIRBramABS( shell *psh )
{
	u32 addr  = psh->uarg[ 0 ];
	u32 nbits = psh->uarg[ 1 ];
    pEMMSysCtrl->pRxPrsCIR->DumpBramABS( pEMMSysCtrl->pRxPrsCIR, addr, nbits );
}

void mainReadRxPrsCIRSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxPrsCIR, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxPrsCIRSlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxPrsCIR, reg, val );
	cprintf( "\n" );
}

void mainDumpRxPrsCIRSlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxPrsCIR, bBin );
}

void mainDumpRxPrsCIR( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxPrsCIR );
}

void mainResetRxPrsCIR( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxPrsCIR );
	cprintf( "Device RxPrsCIR Reset\n" );
}

void mainRxPrsCIRCalcDelta( shell *psh )
{
	DVC_FUNC( pEMMSysCtrl->pRxPrsCIR, CalcDeltas );
}

//=======
// PrsBPA
//=======
void mainReadRxPrsBPASlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->pRxPrsBPA, reg );
	cprintf( " data = %u 0x%08x\n", toUint( val ), toUint( val ) );
}

void mainWriteRxPrsBPASlvReg( shell *psh )
{
	u32 reg = psh->uarg[ 0 ];
	u32 val = psh->uarg[ 1 ];
	DVC_WR_SLV_REG( pEMMSysCtrl->pRxPrsBPA, reg, val );
	cprintf( "\n" );
}

void mainDumpRxPrsBPASlvReg( shell *psh )
{
	u32 bBin = psh->uarg[ 0 ];
	DVC_DUMP_SLV_REG( pEMMSysCtrl->pRxPrsBPA, bBin );
}

void mainDumpRxPrsBPA( shell *psh )
{
	DVC_DUMP( pEMMSysCtrl->pRxPrsBPA );
}

void mainResetRxPrsBPA( shell *psh )
{
	DVC_RESET( pEMMSysCtrl->pRxPrsBPA );
	cprintf( "Device RxPrsBPA Reset\n" );
}

void mainRxPrsBPACalcDelta( shell *psh )
{
	DVC_FUNC( pEMMSysCtrl->pRxPrsBPA, CalcDeltas );
}

//===========================================
//////// End of script-generated code ///////
//===========================================
