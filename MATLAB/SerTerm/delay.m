function delay( t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global tmo;
tmo = 0;
try
    s = get( sysTimer, 'Type' );
    if strcmp( s, 'timer' ) ~= 1
        clear sysTimer;
        sysTimer = timer;
    end;
catch
    clear sysTimer;
    sysTimer = timer;
end
set( sysTimer, 'StartDelay', t );
set( sysTimer, 'TimerFcn', 'tmrfun' );
start( sysTimer )
while tmo == 0
end


