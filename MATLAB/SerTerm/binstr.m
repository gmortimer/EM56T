function s = binstr( ui, nBits )
% binary string from unsigned int
u = uint32( ui );
s = '';
for i = 1 : nBits
    if bitand( u, 1 )
         s = [ '1', s ];
    else
         s = [ '0', s ];
    end;     
    u = bitshift( u, -1 );
end;