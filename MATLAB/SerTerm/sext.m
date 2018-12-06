function [ y ] = sext( x, w )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
y  = int32( x );
s  = bitshift( int32( 1 ), w - 1 );
y = bitor( y, -int32( bitand( y, s ) ));
end

