function s = GetSerAfter( rv, cmd )
% wait until command echoed, then get serial data
j = 0;
rv1 = zeros( 1, length( rv ) );
for i = 1:length( rv1 )
    if ( rv( i ) == 13 ) || ( rv(i) >= 32 )
       rv1( j + 1 ) = rv( i );
       j = j + 1;
    end
end
sf = strfind( rv1, cmd );
s  = rv1( sf + length( cmd ) : length( rv1 ));

