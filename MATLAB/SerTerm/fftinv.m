NFFT = 32;
T = 0 : (NFFT - 1);
f1 = NFFT * 0.12345;
f2 = NFFT * 0.054321;
x = exp( 1i * 2 * pi * f1 * T / NFFT ) + exp( 1i * 2 * pi * f2 * T / NFFT );
h  = fft( x );
hp0 = ifft( h );
hp1 = conj( fft( conj( h )) / NFFT );
hp2 = conj( fft( h ) / NFFT );

figure;
subplot( 2, 2, 1 );
plot( 0:( NFFT - 1 ), real( x ), 'r' );
hold on;
plot( 0:( NFFT - 1 ), imag( x ), 'g' );
grid on;
set( gca, 'xlim', [ 0, ( NFFT - 1 ) ], 'xtick', 0 : NFFT / 8 : ( NFFT - 1 ) );
title( 'x');

subplot( 2, 2, 2 );
plot( 0:( NFFT - 1 ), real( hp0 ), 'r' );
hold on;
plot( 0:( NFFT - 1 ), imag( hp0 ), 'g' );
grid on;
set( gca, 'xlim', [ 0, ( NFFT - 1 ) ], 'xtick', 0 : NFFT / 8 : ( NFFT - 1 ) );
title( 'ifft( fft( x ))');

subplot( 2, 2, 3 );
plot( 0:( NFFT - 1 ), real( hp1 ), 'r' );
hold on;
plot( 0:( NFFT - 1 ), imag( hp1 ), 'g' );
grid on;
set( gca, 'xlim', [ 0, ( NFFT - 1 ) ], 'xtick', 0 : NFFT / 8 : ( NFFT - 1 ) );
title( 'conj( fft( conj( fft( x ))))');

subplot( 2, 2, 4 );
plot( 0:( NFFT - 1 ), real( hp2 ), 'r' );
hold on;
plot( 0:( NFFT - 1 ), imag( hp2 ), 'g' );
grid on;
set( gca, 'xlim', [ 0, ( NFFT - 1 ) ], 'xtick', 0 : NFFT / 8 : ( NFFT - 1 ) );
title( 'conj( fft( fft( x )))');

