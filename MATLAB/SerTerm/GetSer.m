function rv = GetSer( s, cmd )
delay( 1.0 );
n = s.BytesAvailable;
delay( 1.0 );
while s.BytesAvailable > n
    n = s.BytesAvailable;
    delay( 1.0 )
end;
if n == 0
    rv = '';
    return;
end;
rv  = zeros( 1, n );
rv1 = fread( s, n );
j = 0;
for i = 1:length( rv1 )
    if ( rv1( i ) == 13 ) || ( rv1(i) >= 32 ) 
        rv( j + 1 ) = rv1( i );
        j = j + 1;
    end
end
rv = char( rv );
if NotEmpty( cmd )
    f = strfind( rv, cmd );
    if NotEmpty( f )
        i = f( 1 ) + length( cmd );
        rv = rv( i : j );
    else
        rv = rv( 1 : j );
    end
    i = 1;
    while rv( i ) < 32
        if i == length( rv )
            rv = [];
            return;
        else
            i = i + 1;
        end 
    end
    rv = rv( i : length( rv ) );
else
    rv = rv( 1 : j );
end

