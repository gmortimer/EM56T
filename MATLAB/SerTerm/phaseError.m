function deltaphi = phaseError( fnameTxPRS, fnameRxPRS )
% phase error
eval( sprintf( 'load %s -ascii', fnameTxPRS ));
eval( sprintf( 'load %s -ascii', fnameRxPRS ));
f = find( fnameTxPRS == '.' );
if IsEmpty( f )
    dnameTxPRS = fnameTxPRS;
else
    dnameTxPRS = fnameTxPRS( 1 : f( 1 ) - 1 );
end
f = find( fnameRxPRS == '.' );
if IsEmpty( f )
    dnameRxPRS = fnameRxPRS;
else
    dnameRxPRS = fnameRxPRS( 1 : f( 1 ) - 1 );
end

eval( sprintf( 'rxprs = %s( :, 3 ) + 1i * %s( :, 2 );', dnameRxPRS, dnameRxPRS ));
eval( sprintf( 'txprs = %s( :, 3 ) + 1i * %s( :, 2 );', dnameTxPRS, dnameTxPRS  ));
rxprs = fft( rxprs );
rxprs = rxprs( abs( txprs ) ~= 0 );
txprs = txprs( abs( txprs ) ~= 0 );

txphi = angle( txprs );
rxphi = angle( rxprs );
errphi = zeros( size( rxphi ));

errphi( 1 ) = txphi( 1 ) - rxphi( 1 );
for i = 2 : length( errphi )
     errphi( i ) = txphi( i ) - rxphi( i );
     deltaerr = errphi( i ) - errphi( i - 1 );
     if deltaerr > pi
         errphi( i ) = errphi( i ) - 2 * pi;
     elseif deltaerr < - pi
         errphi( i ) = errphi( i ) + 2 * pi;
     end
end
hf = figure;
plot( errphi );

% if ( max( erphi ) - min( erphi )) > 2 * pi
%     erphi( erphi < 0 ) = erphi( erphi < 0 ) + 2 * pi;
% end

deltaphi = mean( errphi ) * 180 / pi;

% 
% erphi = rxphi - txphi;
% %erphi( erphi < 0 ) = 2 * pi + erphi( erphi < 0 );
% 
% txprs1 = txprs( real( txprs ) > 1 );
% rxprs1 = rxprs( real( txprs ) > 1 );
% txphi1 = angle( txprs1 );
% rxphi1 = angle( rxprs1 );
% 
% txprs2 = txprs( imag( txprs ) > 1 );
% rxprs2 = rxprs( imag( txprs ) > 1 );
% txphi2 = angle( txprs2 );
% rxphi2 = angle( rxprs2 ) - txphi2;
% 
% txprs3 = txprs( imag( txprs ) > 1 );
% rxprs3 = rxprs( imag( txprs ) > 1 );
% txphi3 = angle( txprs3 );
% rxphi3 = angle( rxprs3 ) - txphi3;
% 
% txprs4 = txprs( imag( txprs ) > 1 );
% rxprs4 = rxprs( imag( txprs ) > 1 );
% txphi4 = angle( txprs3 );
% rxphi4 = angle( rxprs3 ) - txphi3;
% 
% 
% deltaphi = mean( erphi );



% ye0 =  angle( rprs  ) - angle( tprs );
% ye1 = ye0;
% ye1( ye0 >  pi ) = ye1( ye0 >  pi ) - 2 * pi;
% ye1( ye0 < -pi ) = ye1( ye0 < -pi ) + 2 * pi;
% ye2 = ye0;
% ye2( ye0 < 0      ) = ye2( ye0 < 0      ) + 2 * pi;
% ye2( ye0 > 2 * pi ) = ye0( ye0 > 2 * pi ) - 2 * pi;
% 
% es1 = sum( ( ye1 - mean( ye1 ) ).^2 );
% es2 = sum( ( ye2 - mean( ye2 ) ).^2 );
% if es1 < es2 
%     deltaphi = -mean( ye1 );
% else
%     deltaphi = -mean( ye2 );
% end
