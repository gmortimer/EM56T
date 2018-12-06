function displayData( data, delay )

global NFFT;
global hfigdd;
%load rxdraw.txt -ascii
if IsEmpty( hfigdd ) || ~isvalid( hfigdd )
    hfigdd = PlotFigure( 'pippo', Colors, 4, ...
       [ 'Abs( FFT( x ))                          '; ...
         'Input Data ( Time Domain )              '; ...
         'Angle( FFT( x ))                        '; ...
         'Polar Plot of Freq Domain Rx Data       ' ], ...
         [[ 2, 2, 1 ]; [ 2, 2, 2 ]; [ 2, 2, 3 ]; [ 2, 2, 4 ]], ...
          [ 2, 2, 2, 7 ], ...
          [ 3, 3, 3, 3 ], ...
          [ 11, 11, 11, 11 ] );
    %hfigdd = PlotFigure( 'pippo', Colors, 4, [ 'AAAAA'; 'BBBBB'; 'CCCCC'; 'DDDDD' ], [[ 2, 2, 1]; [2,2,2]; [2,2,3]; [2,2,4]], [2,2,2,5], [3,3,3,3], [11,11,11,11] )
end

NFFT = length( data );
if ( delay > 0 ) && ( delay < NFFT )
    data = [ data( NFFT - delay + 1 : NFFT, : ) ; data( 1 : NFFT - delay, : ) ];
end


NFFT = length( data );
index = [ 0 : NFFT / 2 - 1, -NFFT / 2 - 1 : -1 ];
signal = data( 1 : NFFT , 3 ) + 1j * data( 1 : NFFT , 2 );
Signal = fft( signal );

Sa = abs( Signal ) .^ 2;
ha = hfigdd.haxis( 1, 1 );
ha.plot( 1, index( 1 : NFFT / 2 - 1 ), Sa( 1 : NFFT / 2 - 1 ), ha.colors.rbyred );
ha.plot( 2, index( NFFT / 2 + 1 : NFFT ), Sa( NFFT / 2 + 1 : NFFT ), ha.colors.rbyyellow );
set( ha, 'xlim'  , [ -NFFT / 2, NFFT / 2 - 1 ] );
set( ha, 'xtick' , -NFFT / 2 : 16 : NFFT / 2 - 1  );
set( ha, 'yscale', 'Log' );
set( ha, 'ylim'  , [ 1 1e16 ] );

ha = hfigdd.haxis( 1, 3 );
ha.plot( 1, index( 1 : NFFT / 2 ), angle( Signal( 1 : NFFT / 2 ) ), ha.colors.rbygreen );
ha.plot( 2, index( NFFT / 2 + 1 : NFFT ), angle(Signal( NFFT / 2 + 1 : NFFT )), ha.colors.rbyorange );
set( ha, 'xlim'  ,  [ -NFFT / 2, NFFT / 2 - 1 ] );
set( ha, 'xtick' ,  -NFFT / 2 : 16 : NFFT / 2  );
set( ha, 'ylim'  ,  [ -5 * pi / 4, 5 * pi / 4 ] );
set( ha, 'ytick' ,  -5 * pi / 4 : pi / 4 : 5 * pi / 4  );

ha = hfigdd.haxis( 1, 2 );
ha.plot( 1, [0 : NFFT - 1 ], data( :, 2 ), ha.colors.rbyyellow );
ha.plot( 2, [0 : NFFT - 1 ], data( :, 3 ), ha.colors.rbyred );
set( ha, 'xlim',  [ 0, NFFT ] );
set( ha, 'xtick', 0 : 16 : NFFT );
set( ha, 'ylim',  [ -( 2048 + 512 ), ( 2048 + 512 ) ] );
set( ha, 'ytick', -( 2048 + 512 ) : 512 : ( 2048 + 512 ) );
ha.settext( 2, 0.05, 0.92, 'Real ---' );
ha.settext( 3, 0.05, 0.85, 'Imag ---' );
ht = ha.gethtext( 2 );
set( ht, 'Color', ha.colors.rbyyellow );
ht = ha.gethtext( 3 );
set( ht, 'Color', ha.colors.rbyred );

load txprs.txt -ascii
txprs = txprs( :, 3 ) + 1i * txprs( :, 2 );
f1 =  find( real( txprs ) > 1 );
f2 =  find( imag( txprs ) > 1 );
f3 =  find( real( txprs ) < -1 );
f4 =  find( imag( txprs ) < -1 );
fz =  find( txprs == 0 );
fnz = find( txprs ~= 0 );


%Signal = Signal * cf;

prs1 = Signal( f1 );
prs2 = Signal( f2 );
prs3 = Signal( f3 );
prs4 = Signal( f4 );
prsz = Signal( fz );

set( hfigdd, 'color', hfigdd.colors.rbyblue .* hfigdd.colors.rgbgrey20 );
cols = PRSColors;

lim = 3.0e4;

ha = hfigdd.haxis( 1, 4 );

ha.plot( 1, real( prs1 ), imag( prs1 ), cols( 1, : ) );
set( ha, 'xlim', [ -lim, lim ], 'xtick', -lim : lim / 6 : lim, 'ylim', [-lim, lim ], 'ytick', -lim : lim / 6 : lim );
set( ha, 'xgrid', 'on', 'ygrid', 'on', 'gridcolor', ha.colors.rgbwhite, 'gridalpha', 1, 'gridlinestyle', ':' );
set( ha, 'xminorgrid', 'on', 'yminorgrid', 'on', 'minorgridcolor', ha.colors.rbyyellow, 'minorgridalpha', 0.5, 'minorgridlinestyle', ':' );
set( ha, 'xcolor', ha.colors.rgbwhite, 'ycolor', ha.colors.rgbwhite );
hp = ha.gethplot( 1 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 1, : ), 'markeredgecolor', cols( 1, : ) ); 

ha.plot( 2, real( prs2 ), imag( prs2 ), cols( 2, : ) );
set( ha, 'xlim', [ -lim, lim ], 'xtick', -lim : lim / 6 : lim, 'ylim', [-lim, lim ], 'ytick', -lim : lim / 6 : lim );
set( ha, 'xgrid', 'on', 'ygrid', 'on', 'gridcolor', ha.colors.rgbwhite, 'gridalpha', 1, 'gridlinestyle', ':' );
set( ha, 'xminorgrid', 'on', 'yminorgrid', 'on', 'minorgridcolor', ha.colors.rbyyellow, 'minorgridalpha', 0.5, 'minorgridlinestyle', ':' );
set( ha, 'xcolor', ha.colors.rgbwhite, 'ycolor', ha.colors.rgbwhite );
hp = ha.gethplot( 2 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 2, : ), 'markeredgecolor', cols( 2, : ) ); 

ha.plot( 3, real( prs3 ), imag( prs3 ), cols( 3, : ) );
set( ha, 'xlim', [ -lim, lim ], 'xtick', -lim : lim / 6 : lim, 'ylim', [-lim, lim ], 'ytick', -lim : lim / 6 : lim );
set( ha, 'xgrid', 'on', 'ygrid', 'on', 'gridcolor', ha.colors.rgbwhite, 'gridalpha', 1, 'gridlinestyle', ':' );
set( ha, 'xminorgrid', 'on', 'yminorgrid', 'on', 'minorgridcolor', ha.colors.rbyyellow, 'minorgridalpha', 0.5, 'minorgridlinestyle', ':' );
set( ha, 'xcolor', ha.colors.rgbwhite, 'ycolor', ha.colors.rgbwhite );
hp = ha.gethplot( 3 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 3, : ), 'markeredgecolor', cols( 3, : ) ); 

ha.plot( 4, real( prs4 ), imag( prs4 ), cols( 4, : ) );
set( ha, 'xlim', [ -lim, lim ], 'xtick', -lim : lim / 6 : lim, 'ylim', [-lim, lim ], 'ytick', -lim : lim / 6 : lim );
set( ha, 'xgrid', 'on', 'ygrid', 'on', 'gridcolor', ha.colors.rgbwhite, 'gridalpha', 1, 'gridlinestyle', ':' );
set( ha, 'xminorgrid', 'on', 'yminorgrid', 'on', 'minorgridcolor', ha.colors.rbyyellow, 'minorgridalpha', 0.5, 'minorgridlinestyle', ':' );
set( ha, 'xcolor', ha.colors.rgbwhite, 'ycolor', ha.colors.rgbwhite );
hp = ha.gethplot( 4 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 4, : ), 'markeredgecolor', cols( 4, : ) ); 

ha.plot( 5, real( prsz ), imag( prsz ), cols( 5, : ) );
set( ha, 'xlim', [ -lim, lim ], 'xtick', -lim : lim / 6 : lim, 'ylim', [-lim, lim ], 'ytick', -lim : lim / 6 : lim );
set( ha, 'xgrid', 'on', 'ygrid', 'on', 'gridcolor', ha.colors.rgbwhite, 'gridalpha', 1, 'gridlinestyle', ':' );
set( ha, 'xminorgrid', 'on', 'yminorgrid', 'on', 'minorgridcolor', ha.colors.rbyyellow, 'minorgridalpha', 0.5, 'minorgridlinestyle', ':' );
set( ha, 'xcolor', ha.colors.rgbwhite, 'ycolor', ha.colors.rgbwhite );
hp = ha.gethplot( 5 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 5, : ), 'markeredgecolor', cols( 5, : ) ); 

ha.plot( 6, [ -lim, lim ], [ -lim, lim ], Colors.rbyyelloworange .* Colors.rgbgrey50 );
ha.plot( 7, [ -lim, lim ], [ lim, -lim ], Colors.rbyyelloworange .* Colors.rgbgrey50 );
hp = ha.gethplot( 6 );
set( hp, 'linewidth', 2, 'linestyle', ':' );
hp = ha.gethplot( 7 );
set( hp, 'linewidth', 2, 'linestyle', ':' );
ha.settext( 2, 0.05, 0.9, sprintf( 'Delay = %d', delay ));


end

