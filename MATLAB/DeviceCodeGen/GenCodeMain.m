function GenCodeMain( Dvc, fidc, fidp, fidm, Name, Slvrg, Bram, Read, Write, Init, Load, Dump, Cmd )
if Bram == false && Slvrg == false
    hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', '"' ]; np = 0; sp = ''; hm = ''; fn = '';
    fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
    return;
end
if Bram == true
    if Read == true
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'R', Name, '"' ]; np = 1; sp = '<adr>'; hm = ['Read ', ' ', Dvc, ' ', Name ]; fn = sprintf( 'mainRead%s%s', Dvc, Name );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        fprintf( fidp, 'void mainRead%s%s( shell *psh );\n', Dvc, Name );
        fprintf( fidc, 'void mainRead%s%s( shell *psh )\n', Dvc, Name );
        fprintf( fidc, '{\n' );
        fprintf( fidc, '	u32 addr  = psh->uarg[ 0 ];\n' );
        fprintf( fidc, '	u32 data  = pEMMSysCtrl->p%s->Read%s( pEMMSysCtrl->p%s, addr );\n', Dvc, Name, Dvc );
        fprintf( fidc, '    cprintf( " data = %%u 0x%%08x\\n", toUint( data ), toUint( data ) );\n' );
        fprintf( fidc, '}\n' );
        fprintf( fidc, '\n' );
    end
    
    if Write == true
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'W', Name, '"' ]; np = 2; sp = '<adr val>'; hm = ['Write', ' ', Dvc, ' ', Name ]; fn = sprintf( 'mainWrite%s%s', Dvc, Name );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        fprintf( fidp, 'void mainWrite%s%s( shell *psh );\n', Dvc, Name );
        fprintf( fidc, 'void mainWrite%s%s( shell *psh )\n', Dvc, Name );
        fprintf( fidc, '{\n' );
        fprintf( fidc, '	u32 addr  = psh->uarg[ 0 ];\n' );
        fprintf( fidc, '	u32 data  = psh->uarg[ 1 ];\n' );
        fprintf( fidc, '	pEMMSysCtrl->p%s->Write%s( pEMMSysCtrl->p%s, addr, data );\n', Dvc, Name, Dvc );
        fprintf( fidc, '}\n' );
        fprintf( fidc, '\n' );
    end
    
    if Init == true
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'I', Name, '"' ]; np = 3; sp = '<adr nwd val>'; hm = ['Init ', ' ', Dvc, ' ', Name ]; fn = sprintf( 'mainInit%s%s', Dvc, Name );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        fprintf( fidp, 'void mainInit%s%s( shell *psh );\n', Dvc, Name );
        fprintf( fidc, 'void mainInit%s%s( shell *psh )\n', Dvc, Name );
        fprintf( fidc, '{\n' );
        fprintf( fidc, '	u32 addr  = psh->uarg[ 0 ];\n' );
        fprintf( fidc, '	u32 nwds  = psh->uarg[ 1 ];\n' );
        fprintf( fidc, '	u32 data  = psh->uarg[ 2 ];\n' );
        fprintf( fidc, '	TIME_TFR( pEMMSysCtrl->p%s->Init%s( pEMMSysCtrl->p%s, addr, nwds, data ), nwds, 4 );\n', Dvc, Name, Dvc );
        fprintf( fidc, '}\n' );
        fprintf( fidc, '\n' );
    end
    
    if Load == true
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'L', Name, '"' ]; np = 0; sp = '';  hm = ['Load ', ' ', Dvc, ' ', Name ]; fn = sprintf( 'mainLoad%s%s', Dvc, Name );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        fprintf( fidp, 'void mainLoad%s%s( shell *psh );\n', Dvc, Name );
        fprintf( fidc, 'void mainLoad%s%s( shell *psh )\n', Dvc, Name );
        fprintf( fidc, '{\n' );
        fprintf( fidc, '	TIME_TFR( pEMMSysCtrl->p%s->Load%s( pEMMSysCtrl->p%s ), DVC_PAR( pEMMSysCtrl->p%s, %sSize ), 4 );\n', Dvc, Name, Dvc, Dvc, Name );
        fprintf( fidc, '}\n' );
        fprintf( fidc, '\n' );
    end
    if Dump == true
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'D', Name, '"' ]; np = 0; sp = ''; hm = ''; fn = sprintf( 'mainDump%s%s', Dvc, Name );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'D', Name, '"' ]; np = 1; sp = ''; hm = ''; fn = sprintf( 'mainDump%s%s', Dvc, Name );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'D', Name, '"' ]; np = 2; sp = '[<adr nbit(0, 8-16)>]';   hm = ['Dump ', ' ', Dvc, ' ', Name ]; fn = sprintf( 'mainDump%s%s', Dvc, Name );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        fprintf( fidp, 'void mainDump%s%s( shell *psh );\n', Dvc, Name );
        fprintf( fidc, 'void mainDump%s%s( shell *psh )\n', Dvc, Name );
        fprintf( fidc, '{\n' );
        fprintf( fidc, '	u32 addr  = psh->uarg[ 0 ];\n' );
        fprintf( fidc, '	u32 nbits = psh->uarg[ 1 ];\n' );
        fprintf( fidc, '    pEMMSysCtrl->p%s->Dump%s( pEMMSysCtrl->p%s, addr, nbits );\n', Dvc, Name, Dvc );
        fprintf( fidc, '}\n' );
        fprintf( fidc, '\n' );
    end;
    fprintf( fidp, '\n' );
end
if Slvrg == true
    hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Rslv', '"' ]; np = 1; sp = '<reg>'; hm = ['Read ', ' ', Dvc, ' ', 'Slv Reg' ]; fn = sprintf( 'mainRead%sSlvReg', Dvc );
    fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
    fprintf( fidp, 'void mainRead%sSlvReg( shell *psh );\n', Dvc );
    fprintf( fidc, 'void mainRead%sSlvReg( shell *psh )\n', Dvc );
    fprintf( fidc, '{\n' );
    fprintf( fidc, '	u32 reg = psh->uarg[ 0 ];\n' );
    fprintf( fidc, '	u32 val = DVC_RD_SLV_REG( pEMMSysCtrl->p%s, reg );\n', Dvc );
    fprintf( fidc, '	cprintf( " data = %%u 0x%%08x\\n", toUint( val ), toUint( val ) );\n' );
    fprintf( fidc, '}\n' );
    fprintf( fidc, '\n' );
    
    hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Wslv', '"' ]; np = 2; sp = '<reg val>'; hm = ['Write', ' ', Dvc, ' ', 'Slv Reg' ]; fn = sprintf( 'mainWrite%sSlvReg', Dvc );
    fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
    fprintf( fidp, 'void mainWrite%sSlvReg( shell *psh );\n', Dvc );
    fprintf( fidc, 'void mainWrite%sSlvReg( shell *psh )\n', Dvc );
    fprintf( fidc, '{\n' );
    fprintf( fidc, '	u32 reg = psh->uarg[ 0 ];\n' );
    fprintf( fidc, '	u32 val = psh->uarg[ 1 ];\n' );
    fprintf( fidc, '	DVC_WR_SLV_REG( pEMMSysCtrl->p%s, reg, val );\n', Dvc );
    fprintf( fidc, '	cprintf( "\\n" );\n' );
    fprintf( fidc, '}\n' );
    fprintf( fidc, '\n' );

    hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Dslv', '"' ]; np = 0; sp = ''; hm = ''; fn = sprintf( 'mainDump%sSlvReg', Dvc );
    fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
    hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Dslv', '"' ]; np = 1; sp = '[<fmt(0=hex 1=bin)>]'; hm = ['Dump ', ' ', Dvc, ' ', 'Slv Reg' ]; fn = sprintf( 'mainDump%sSlvReg', Dvc );
    fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
    fprintf( fidp, 'void mainDump%sSlvReg( shell *psh );\n', Dvc );
    fprintf( fidc, 'void mainDump%sSlvReg( shell *psh )\n', Dvc );
    fprintf( fidc, '{\n' );
    fprintf( fidc, '	u32 bBin = psh->uarg[ 0 ];\n' );
    fprintf( fidc, '	DVC_DUMP_SLV_REG( pEMMSysCtrl->p%s, bBin );\n', Dvc );
    fprintf( fidc, '}\n' );
    fprintf( fidc, '\n' );
    fprintf( fidp, '\n' );
    hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Dmp', '"' ]; np = 0; sp = ''; hm = ['Dump ', ' ', Dvc, ' ', 'State' ]; fn = sprintf( 'mainDump%s', Dvc );
    fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
    fprintf( fidp, 'void mainDump%s( shell *psh );\n', Dvc );
    fprintf( fidc, 'void mainDump%s( shell *psh )\n', Dvc );
    fprintf( fidc, '{\n' );
    fprintf( fidc, '	DVC_DUMP( pEMMSysCtrl->p%s );\n', Dvc );
    fprintf( fidc, '}\n' );
    fprintf( fidc, '\n' );
    hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Rst', '"' ]; np = 0; sp = ''; hm = ['Reset', ' ', Dvc ]; fn = sprintf( 'mainReset%s', Dvc );
    fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
    fprintf( fidp, 'void mainReset%s( shell *psh );\n', Dvc );
    fprintf( fidc, 'void mainReset%s( shell *psh )\n', Dvc );
    fprintf( fidc, '{\n' );
    fprintf( fidc, '	DVC_RESET( pEMMSysCtrl->p%s );\n', Dvc );
    fprintf( fidc, '	cprintf( "Device %s Reset\\n" );\n', Dvc );
    fprintf( fidc, '}\n' );
    fprintf( fidc, '\n' );
    if ~isempty( strfind( Dvc, 'FreqCtr' ))
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Read', '"' ]; np = 0; sp = ''; hm = ['Read ', ' ', Dvc ]; fn = sprintf( 'mainRead%s', Dvc );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        fprintf( fidp, 'void mainRead%s( shell *psh );\n', Dvc );
        fprintf( fidc, 'void mainRead%s( shell *psh )\n', Dvc );
        fprintf( fidc, '{\n' );
        fprintf( fidc, '	double g = DVC_FUNC( pEMMSysCtrl->p%s, ReadFreqCtr );\n', Dvc );
        fprintf( fidc, '	cprintf( "Frequency: %%.6f Mhz\\n", g );\n' );
        fprintf( fidc, '}\n' );
        fprintf( fidc, '\n' );
    end
    if ~isempty( strfind( Dvc, 'PrsCIR' ))
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Delta', '"' ]; np = 0; sp = ''; hm = [ Dvc, ' ', 'Calc Deltas' ]; fn = sprintf( 'main%sCalcDelta', Dvc );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        fprintf( fidp, 'void main%sCalcDelta( shell *psh );\n', Dvc );
        fprintf( fidc, 'void main%sCalcDelta( shell *psh )\n', Dvc );
        fprintf( fidc, '{\n' );
        fprintf( fidc, '	DVC_FUNC( pEMMSysCtrl->p%s, CalcDeltas );\n', Dvc ); 
        fprintf( fidc, '}\n' );
        fprintf( fidc, '\n' );
    end
    if ~isempty( strfind( Dvc, 'PrsBPA' ))
        hc = [ '"', upper( Cmd ), '"' ]; cm = [ '"', Cmd, 'Delta', '"' ]; np = 0; sp = ''; hm = [ Dvc, ' ', 'Calc Deltas' ]; fn = sprintf( 'main%sCalcDelta', Dvc );
        fprintf( fidm, '%s\n', GenCodeMenuItem( hc, cm, np, sp, hm, fn ) );
        fprintf( fidp, 'void main%sCalcDelta( shell *psh );\n', Dvc );
        fprintf( fidc, 'void main%sCalcDelta( shell *psh )\n', Dvc );
        fprintf( fidc, '{\n' );
        fprintf( fidc, '	DVC_FUNC( pEMMSysCtrl->p%s, CalcDeltas );\n', Dvc ); 
        fprintf( fidc, '}\n' );
        fprintf( fidc, '\n' );
    end
    
    fprintf( fidp, '\n' );
end