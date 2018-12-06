function [ r, g, b ] = hex2color( s )
n = uint32( hex2dec( s ) );
r = bitand( bitshift( n , -16 ) , 255 );
g = bitand( bitshift( n ,  -8 ) , 255 );
b = bitand( n                   , 255 );
end

