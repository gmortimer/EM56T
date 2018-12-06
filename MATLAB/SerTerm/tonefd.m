load tonetd.txt - ascii
ttd = tonetd( :,3 ) + 1i * ttd( :,2 );
ht = fft( ttd ) / 512;
rht = int32( real( ht ));
iht = int32( imag( ht ));
hti32 = double( rht ) + 1i * double( iht ); 
tti32 = ifft( hti32 );
