function [ y ] = fixp( x, w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y = sext( int32( x ), w ); 
end

