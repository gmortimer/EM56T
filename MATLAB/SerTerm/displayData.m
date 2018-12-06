function displayData( delay )

global NFFT;
global hfigdd;
load rxdraw.txt -ascii

NFFT = length( rxdraw );
if ( delay > 0 ) && ( delay < NFFT )
    rxdraw = [ rxdraw( NFFT - delay + 1 : NFFT, : ) ; rxdraw( 1 : NFFT - delay, : ) ];
end

try
       figure( hfigdd );
catch
       hfigdd = figure;
       set( hfigdd, 'color', [ 1, 0.9, 0.7 ] );
       set( hfigdd, 'units','normalized')
       set( hfigdd, 'outerposition', [ 0 0 1 1 ] );
end

NFFT = length( rxdraw );
index = [ 0 : NFFT / 2 - 1, -NFFT / 2 - 1 : -1 ];
signal = rxdraw( 1 : NFFT , 2 ) + 1j * rxdraw( 1 : NFFT , 3 );
Signal = fft( signal );

subplot ( 2, 2, 1 )
hold off;
Sa = abs( Signal ) .^ 2;
plot( index( 1 : NFFT / 2 - 1 ), Sa( 1 : NFFT / 2 - 1 ))
hold on;
plot( index( NFFT / 2 + 1 : NFFT ), Sa( NFFT / 2 + 1 : NFFT ))
set( gca, 'xlim'  , [ -NFFT / 2, NFFT / 2 - 1 ] );
set( gca, 'xtick' , -NFFT / 2 : 16 : NFFT / 2 - 1  );
set( gca, 'yscale', 'Log' );
set( gca, 'ylim'  , [ 1 1e16 ] );
grid on;
title('Abs( FFT( x ))')

subplot ( 2, 2, 3 )
hold off;
plot(index( 1 : NFFT / 2 ), angle( Signal( 1 : NFFT / 2 ) ))
hold on;
plot( index( NFFT / 2 + 1 : NFFT ), angle(Signal( NFFT / 2 + 1 : NFFT )))
set( gca, 'xlim'  ,  [ -NFFT / 2, NFFT / 2 - 1 ] );
set( gca, 'xtick' ,  -NFFT / 2 : 16 : NFFT / 2  );
set( gca, 'ylim'  ,  [ -5 * pi / 4, 5 * pi / 4 ] );
set( gca, 'ytick' ,  -5 * pi / 4 : pi / 4 : 5 * pi / 4  );
grid on;
title('Angle( FFT( x ))')

subplot( 2, 2, 2 )
hold off
plot( rxdraw( :, 2 ))
hold on
plot( rxdraw( :, 3 ), 'g')
legend( 'real( x )', 'imag( x )' )
set( gca, 'xlim',  [ 0, NFFT ] );
set( gca, 'xtick', 0 : 16 : NFFT );
set( gca, 'ylim',  [ -( 2048 + 512 ), ( 2048 + 512 ) ] );
set( gca, 'ytick', -( 2048 + 512 ) : 512 : ( 2048 + 512 ) );
grid on;
title( 'Input data, time domain' )

subplot( 2, 2, 4 )
hold off
plot( Signal( 2 : NFFT ), 'r*' );
hold on
% set( gca, 'xlim',  [ 0, NFFT ] );
% set( gca, 'xtick', 0 : 16 : NFFT );
% set( gca, 'ylim',  [ -( 2048 + 512 ), ( 2048 + 512 ) ] );
% set( gca, 'ytick', -( 2048 + 512 ) : 512 : ( 2048 + 512 ) );
grid on;
title( 'Polar plot of freq-domain rx data' )

end

