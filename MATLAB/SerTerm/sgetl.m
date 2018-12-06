function [ ss, pp ] = sgetl( s, p )
i = p;
while ( uint8( s( i )) ~= 13 ) && ( uint8( s( i )) ~= 10 ) && ( i < length( s ))
    i = i + 1;
end
if i > p
    ss = s( p : i - 1 );
    while ( uint8( s( i )) == 13 ) || ( uint8( s( i )) == 10 )
        i = i + 1;
        if i > length( s )
            break;
        end
    end
    pp = i;
else
    ss = '';
    pp = -1;
end

end