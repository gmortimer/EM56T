function [ y ] = touint16( x )
% convert a signed 16 bit number to its bit representation in an unsigned
x32 = int32( x ) + 65536;
y = uint16( bitand( x32, 65535 ) );
end

