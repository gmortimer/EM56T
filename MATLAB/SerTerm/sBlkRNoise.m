function [ rNoiseU32, sBlockRNoise ] = sBlkRNoise( sumBlk, rMean )
% Calculate integer multiplied by RNoise
NSD_SCALE_BITS = 12;
rNoiseMsb = uint32( bitshift( 1, NSD_SCALE_BITS - 1 ) );
rNoiseU32 = rNoise( rMean, NSD_SCALE_BITS );
sBlockU32 = uint32( sumBlk );
sBlockRNoise = 0;
sBlockShr = sBlockU32;
rNoiseMul = rNoiseU32;
for tdShftCtr = 0:NSD_SCALE_BITS - 1
    if bitand( rNoiseMul, rNoiseMsb ) > 0
        sBlockRNoise = sBlockRNoise + sBlockShr;
    end;
    sBlockShr = bitshift( sBlockShr, -1 );
    rNoiseMul = bitshift( rNoiseMul,  1 );
end;
