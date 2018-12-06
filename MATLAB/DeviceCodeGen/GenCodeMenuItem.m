
function s = GenCodeMenuItem( hc, cm, np, sp, hm, fn  )
%Make menu item
if length( fn ) == 0
    s = sprintf('    ( void ) shellRegisterCommand( &mainShell, %-6s , %-12s, %2u, "", NULL );', hc, '""', 0 );
else
    if isempty( hm )
        s = sprintf('    ( void ) shellRegisterCommand( &mainShell, %-6s , %-12s, %2u, %-80s, %-36s );', hc, cm, np, '""', fn );
    else
        s = sprintf('    ( void ) shellRegisterCommand( &mainShell, %-6s , %-12s, %2u, "%-40s%-39s, %-36s );', hc, cm, np, sp, [ hm, '"' ], fn );
    end
end
