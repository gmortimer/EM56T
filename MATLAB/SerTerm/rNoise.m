function rNoiseU32 = rNoise( rMean, nBits )
% Calculate RNoise bits;
a  = [ 2.^( 0 : nBits - 1 ) ]';
ra = 1./a;
rm = 0;
rNoiseU32 = uint32( 0 );
for i = 1:nBits
    rNoiseU32 = bitshift( rNoiseU32, 1 );
    if rm + ra( i ) <= 1 / rMean
        rm = rm + ra( i );
        rNoiseU32 = bitor( rNoiseU32, 1 );
    end;
end;
