load rxdraw.txt -ascii
sr = uint16( rxdraw( 1:1024, 3 ));
si = uint16( rxdraw( 1:1024, 2 ));
sr = bitand( sr, 65535-15 );
si = bitand( si, 65535-15 );
signal = double( sr ) + 1j * double( si );
Signal = fft (signal);
index = [0:511 -512:-1];
figure(1)
hold off
plot( si, 'b')
hold on
plot( sr, 'g')
legend('real','imag')
set( gca, 'xtick', 0:16:length( rxdraw ) );
grid on;
figure(2)
subplot (2,1,1)
hold off;
Sa = abs( Signal ) .^ 2;
plot(index( 1:512 ), Sa( 1:512))
hold on;
plot(index( 513:1024 ), Sa( 513:1024 ))
set( gca, 'xlim',   [ -512 511 ] );
set( gca, 'xtick',  -512 : 16 : 511  );
set( gca, 'yscale', 'Log' );
set( gca, 'ylim', [ 1 1e16 ] );
grid on;
title('abs')
subplot (2,1,2)
hold off;
plot(index( 1:512 ),angle(Signal( 1:512)))
hold on;
plot(index( 513:1024 ),angle(Signal( 513:1024)))
set( gca, 'xlim',   [ -512 511 ] );
set( gca, 'xtick',  -512 : 16 : 511  );
grid on;
title('angle')
