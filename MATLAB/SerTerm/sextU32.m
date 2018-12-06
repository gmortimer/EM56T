function [ zo ] = sextU32( z )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%zo = bitor( uint32( z ), bitand( bitnot( bitand( uint32( z ), uint32( hex2dec( '08000800' )))) + uint32( hex2dec( '00010001' )) , bitnot( uint32( hex2dec( '00010001' )))));
%zo = bitor( uint32( z ), bitand( bitnot( bitand( uint32( z ), uint32( hex2dec( '08000800' )))) + uint32( hex2dec( '00010001' )) , bitnot( uint32( hex2dec( '00010001' )))));
zo = uint32( bitor( uint64( z ), bitand( bitnot( bitand( uint64( z ), uint64( hex2dec( '08000800' )))) + uint64( hex2dec( '00010001' )), bitnot( uint64( hex2dec( '00010001' ))))));
end

function [ uo ] = bitnot( u ) 
uo = bitxor( uint64( u ), uint64( hex2dec( 'FFFFFFFF' )));
end
