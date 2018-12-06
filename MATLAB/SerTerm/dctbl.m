load cirtbl.txt -ascii
close all;
hfig = figure;
set( hfig, 'color', [ 1.0, 0.9, 0.7 ] );
set( hfig, 'units','normalized')
set( hfig, 'outerposition', [ 0 0 1 1 ] );

ctbl = cirtbl( :, 2:size( cirtbl, 2 ));
xrng = -10:10;
yrng = 0 : NFFT - 1;
hold off;
surf( xrng, yrng, ctbl );
hold on;
set( gca, 'xlim',  [ min( xrng ), max( xrng ) ] );
set( gca, 'ylim',  [ min( yrng ), max( yrng ) ] );
set( gca, 'xtick', min( xrng ) : 1  : max( xrng ) );
set( gca, 'ytick', min( yrng ) : 1  : max( yrng ) );
grid on;

