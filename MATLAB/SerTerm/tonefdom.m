load tonetd.txt -ascii
ttd = tonetd( :, 3 ) + 1i * tonetd( :, 2 );
ttd( 769 : 1024 ) = ttd(   1 : 256 );
ttd( 513 :  768 ) = ttd(   1 : 256 );
ttd( 257 :  512 ) = ttd(   1 : 256 );
ht     = fft( ttd ) / 16;
rht    = int32( real( ht ) );
iht    = int32( imag( ht ) );
hti32  = double( rht ) + 1i * double( iht ); 
tti32  = ifft( hti32 ) ;
rhti16 = touint16( int16( real( ht ) ) );
ihti16 = touint16( int16( imag( ht ) ) );
fid    = fopen( 'tonefdom.c', 'w' );
fprintf( fid, 'u32 tonefd1024[ 1024 ] = {\n' );
for i = 1:length( tti32 )
    fprintf( fid, '        0x%04X%04X', ihti16( i ), rhti16( i ) );
    if i == length( tti32 )
        fprintf( fid, '\n' );
    else
        fprintf( fid, ',\n' );
    end
end
fprintf( fid, '};\n' );
fclose( fid );