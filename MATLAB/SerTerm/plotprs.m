function hfig = plotprs( hfig, fname, theta0 )
% plot prs
global NFFT;

if IsEmpty( hfig ) || ~isvalid( hfig ) || IsEmpty( hfig.hfig ) || ~isvalid( hfig.hfig )
%     hfigpprs = figure;
%     hfigpprs.Units         ='normalized';
%     hfigpprs.OuterPosition = [ 0 0 1 1 ];
    close all;
    clear hfigpprs*;
    hfig = PlotFigure( 'pippo', Colors, 1 , [ 'Polar Plot of Freq Domain Rx Data       ' ], [[ 1, 1, 1 ]], [ 7 ], [ 3 ], [ 11 ] );
end

eval( sprintf( 'load %s -ascii', fname ) )
f = find( fname == '.' );
if NotEmpty( f )
    dname = fname( 1:f( 1 ) - 1 );
else
    dname = fname;
end
eval( sprintf( 'prs = %s( :,3 ) + 1i * %s( :,2 );', dname, dname ) );
hprs = fft( prs * exp( 1i * theta0 * pi / 180 ));

load txprs.txt -ascii
txprs = txprs( :, 3 ) + 1i * txprs( :, 2 );
f1 =  find( real( txprs ) > 1 );
f2 =  find( imag( txprs ) > 1 );
f3 =  find( real( txprs ) < -1 );
f4 =  find( imag( txprs ) < -1 );
fz =  find( txprs == 0 );
fnz = find( txprs ~= 0 );


%hprs( fnz ) = ( real( hprs( fnz ) ) - mean( real( hprs( fnz ) ))) + 1i * imag( hprs( fnz ));
%hprs( fnz ) = real( hprs( fnz )) + 1i * ( imag( hprs( fnz ) ) - mean( imag( hprs( fnz ) )));

prs1 = hprs( f1 );
prs2 = hprs( f2 );
prs3 = hprs( f3 );
prs4 = hprs( f4 );
prsz = hprs( fz );

set( hfig, 'color', hfig.colors.rbyblue .* hfig.colors.rgbgrey20 );
cols = PRSColors;

lim = 3.0e4;

ha = hfig.haxis( 1 );
set( ha, 'xlim', [ -2 * lim, 2 * lim ], 'xtick', -lim : lim / 6 : lim, 'ylim', [-lim, lim ], 'ytick', -lim : lim / 6 : lim );
set( ha, 'xgrid', 'on', 'ygrid', 'on', 'gridcolor', ha.colors.rgbwhite, 'gridalpha', 1, 'gridlinestyle', ':' );
set( ha, 'xminorgrid', 'on', 'yminorgrid', 'on', 'minorgridcolor', ha.colors.rbyyellow, 'minorgridalpha', 0.5, 'minorgridlinestyle', ':' );
set( ha, 'xcolor', ha.colors.rgbwhite, 'ycolor', ha.colors.rgbwhite );

ha.plot( 1, real( prs1 ), imag( prs1 ), cols( 1, : ) );
hp = ha.gethplot( 1 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 1, : ), 'markeredgecolor', cols( 1, : ) ); 

ha.plot( 2, real( prs2 ), imag( prs2 ), cols( 2, : ) );
hp = ha.gethplot( 2 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 2, : ), 'markeredgecolor', cols( 2, : ) ); 

ha.plot( 3, real( prs3 ), imag( prs3 ), cols( 3, : ) );
hp = ha.gethplot( 3 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 3, : ), 'markeredgecolor', cols( 3, : ) ); 

ha.plot( 4, real( prs4 ), imag( prs4 ), cols( 4, : ) );
hp = ha.gethplot( 4 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 4, : ), 'markeredgecolor', cols( 4, : ) ); 

ha.plot( 5, real( prsz ), imag( prsz ), cols( 5, : ) );
hp = ha.gethplot( 5 );
set( hp, 'linestyle', 'none', 'marker', 'o', 'markersize', 5, 'linewidth', 1, 'markerfacecolor', cols( 5, : ), 'markeredgecolor', cols( 5, : ) ); 

ha.plot( 6, [ -lim, lim ], [ -lim, lim ], ha.colors.rbyyelloworange .* ha.colors.rgbgrey50 );
ha.plot( 7, [ -lim, lim ], [ lim, -lim ], ha.colors.rbyyelloworange .* ha.colors.rgbgrey50 );
hp = ha.gethplot( 6 );
set( hp, 'linewidth', 2, 'linestyle', ':' );
hp = ha.gethplot( 7 );
set( hp, 'linewidth', 2, 'linestyle', ':' );

hftext = ha.gethtext( 1 ).UserData;
hftext.setposition( 0.5, 1.05, 0 );





