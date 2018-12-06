function [ fn, fc ] = ScanFileSpec( fs )
%Scan file spec for SerTerm
%fs should be <filename> <lines>
%i.e. ' pippo.txt 1024 '
%< lines > = lines to dump into file
fn = [];
fc = [];
i  = 1;
while ( uint8( fs( i ) == 32 )) && ( i < length( fs ))
    i = i + 1;
end
if i == length( fs )
    return;
end
fss = fs( i : length( fs ));
f = find( uint8( fss ) == 32 );
if NotEmpty( f ) 
    fn = fss( 1 : f( 1 ) - 1 );
    fc = sscanf( fss( f( 1 ) : length( fss )), '%i' );
    if length( fc ) ~= 1
        fc = [];
        fn = [];
    end
end

