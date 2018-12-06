load rxdraw.txt -ascii
load txprs.txt -ascii
load txprst.txt -ascii
close all;
tprstr = txprst( :, 3 );
tprsti = txprst( :, 2 );
tprst  = tprstr + 1i * tprsti;
htprst = fft( tprst ) / 2;
figure
subplot( 3, 2, 1 );
plot( real( htprst ), 'r' );
hold on;
grid;
subplot( 3, 2, 2 );
plot( imag( htprst ), 'r' );
hold on;
grid;

rprstr = rxdraw( ( 1025 + 128 ) : ( 2048 + 128 ), 3);
rprsti = rxdraw( ( 1025 + 128 ) : ( 2048 + 128 ), 2);
rprst  = double( rprstr ) + 1i * double ( rprsti );
hrprst = fft( rprst ) / 2;

subplot( 3, 2, 3 );
plot( real( hrprst ), 'g' );
hold on;
grid;
subplot( 3, 2, 4 );
plot( imag( hrprst ), 'g' );
hold on;
grid;

tprsr = txprs( 1:1024, 3 );
tprsi = txprs( 1:1024, 2 );
tprs =  tprsr + 1i * tprsi;

subplot( 3, 2, 5 );
plot( tprsr, 'b' );
hold on;
grid;
subplot( 3, 2, 6 );
plot( tprsi, 'b' );
hold on;
grid;