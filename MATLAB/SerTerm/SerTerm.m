try
    so = get( s, 'Status' );
    if strcmp( so, 'open' )
        fclose( s );
    else
        clear s;
    end
catch
end

global NFFT;
s = serial('COM4', 'BaudRate', 115200 );
set( s, 'InputBufferSize', 262144  );
set( s, 'BaudRate'       , 115200 );
fopen( s );
fwrite( s, char( 27 ));
fwrite( s, char( 'h' ));
fwrite( s, char( 13 ));
rv = GetSer(  s, 'h' );
fprintf( '%s', rv );
while 1
    gmode = 0;
    cmd = input( '', 's' );

    if cmd == '$'
        break;
    elseif cmd == '@'
        break;
    elseif cmd == '#'
        fwrite( s, char( 27 ) );
    elseif strfind( cmd, '/' ) > 0
        f = strfind( cmd, '/' );
        script = cmd( f + 1 : length( cmd ));
        if NotEmpty( script )
            try
                eval( script );
            catch
                fprintf( '\n*** Script %s not found ***\n', script );
            end
        end;
        fwrite( s, char( 13 ));    
    else
        f = strfind( cmd, '>' );
        if NotEmpty( f ) && ( f < length( cmd ) )
            scm = cmd( f + 1 : length( cmd ) );
            cmd = cmd( 1 : f - 1 );
            [ fn, nl ] = ScanFileSpec( scm );
            if NotEmpty( nl )
                np = ceil( nl / 32 );
                NFFT = nl;
                fprintf( '\n*** Saving %d lines to text file %s ***\n', nl, fn );
                fwrite( s, char( cmd ) );
                fwrite( s, char( 13 )  );
                delay( 0.1 );
                rv = GetSer( s, cmd );
                for i = 1 : np - 1
                    fwrite( s, char( 13 ) );
                    delay( 0.1 );
                    rv = [ rv, GetSer( s, '' ) ];
                end
                fwrite( s, char( 27 )  );
                rv = WriteFile( fn, rv, nl );
                fprintf( '%s', rv );
            end
        else
            fwrite( s, char( cmd ));
            fwrite( s, char( 13 ));
        end
    end
    rv = GetSer( s, cmd );
    fprintf( '%s', rv );
end
if cmd == '$'
    fclose( s );
end