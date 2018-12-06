function rv = WriteFile( fname, s, nl )
%Write ASCII file
     i = 1;
     v = sscanf( s( i : length( s )), '%f' );
     while length( v ) < 10
         i = i + 1;
         v = sscanf( s( i : length( s )), '%f' );
     end
     while uint8( s( i )) <= 32
         i = i + 1;
     end
     while ( i > 0 ) && ( uint8( s( i ) ) >= 32 )
         i = i - 1;
     end
     s = s( i + 1 : length( s ));    
     fid = fopen( fname, 'w' );
     p = 1;
     for i = 1 : nl
         [ sl, p ] = sgetl( s, p );
         fprintf( fid, '%s\r\n', sl );
         if i >= 1022
             p = p;
         end
     end
     fclose( fid );
     rv = s( 1 : max( p - 1, 1 ));
end

