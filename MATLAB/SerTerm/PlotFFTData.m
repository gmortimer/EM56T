close all;
clear all;
load rxdfft.txt -ascii;
load rxdcor.txt -ascii;

fftdat = rxdfft( :, 3 ) + 1i * rxdfft( :, 2 );
fftabs = abs( fftdat );
fftphs = angle( fftdat );

corabs = rxdcor( :, 3 );
corphs = rxdcor( :, 2 );

corabsc = corabs * max( fftabs ) / max( corabs );
corphsc = corphs * max( fftphs ) / max( corphs ); 

figure;
subplot( 2, 1, 1 );
plot( fftabs, 'r' );
hold on;
grid on;
%set( gca, 'xtick', 0:16:length( corabs ) );
plot( corabs, 'b' );

% subplot( 2, 1, 2 );
% plot( fftphs, 'r' );
% hold on;
% grid on;
% set( gca, 'xtick', 0:16:length( corabs ) );
% plot( corphs, 'b' );

s = zeros(size(corabs)-15);
for i = 1:length(corabs)-15
    s(i) = sum(corabs(i:i+15));
end
subplot( 2, 1, 2 );
plot(s);
grid on;
