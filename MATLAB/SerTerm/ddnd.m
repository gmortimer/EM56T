
global NFFT;
global hfigdd;

delete( hfigdd );
close all;

dly  = 0;
ddly = 1;
while 1
    displayDataNew( dly );
    c = input( sprintf( '%i >', ddly ), 's' );
    if length( c ) == 0
        dly = mod( dly + ddly, NFFT );
    elseif c( 1 ) == '-' || c( 1 ) == '+'
        if length( c ) > 1
            n = sscanf( sscanf( c, '%s' ), '%i' );
            if n ~= 0
               ddly = n;
            end
        else
            ddly = sscanf( sscanf( [ c( 1 ), '1' ], '%s' ), '%i' );
        end
        dly = mod( dly + ddly, NFFT );
    elseif c( 1 ) == '='
        if length( c ) > 1
            n = sscanf( sscanf( c( 2 : length( c )), '%s' ), '%i' );
            if NotEmpty( n )
               dly = mod( n, NFFT );
            end
        end
    elseif c( 1 ) == '/'
        if length( c ) > 1 
            eval( c ( 2 : length( c )) );
        end
    elseif strcmp( c, 'x' )
        break;
    end
end

