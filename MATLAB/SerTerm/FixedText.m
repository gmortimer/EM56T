classdef FixedText < handle
    properties
        fixedpos;
        htext;
    end
    
    methods
        function hobj = FixedText( htext, x, y, z )
            %Constructor
            if nargin > 0
                hobj.htext    = htext;
                hobj.setposition( x, y, z );
            end
        end

        function update( hobj )
            htext = hobj.htext;
            haxis = get( htext, 'Parent' );
            
            xscale = get( haxis, 'xscale' );
            yscale = get( haxis, 'yscale' );
            zscale = get( haxis, 'zscale' );
            
     
            xlim  = get( haxis, 'xlim' );
            ylim  = get( haxis, 'ylim' );
            zlim  = get( haxis, 'zlim' );
            pos = hobj.fixedpos;
            x = pos( 1 );
            y = pos( 2 );
            z = pos( 3 );
            
            if strcmp( xscale, 'log' )
                x0 = log( xlim( 1 ) );
                x1 = log( xlim( 2 ) ); 
                xrng = x1 - x0;
                xpos = exp( x0 + x * xrng );
            else
                x0    = xlim( 1 );
                xrng  = xlim( 2 ) - xlim( 1 );
                xpos  = x0 + x * xrng;
            end
            
            if strcmp( yscale, 'log' )
                y0 = log( ylim( 1 ) );
                y1 = log( ylim( 2 ) ); 
                yrng = y1 - y0;
                ypos = exp( y0 + y * yrng );
            else
                y0    = ylim( 1 );
                yrng  = ylim( 2 ) - ylim( 1 );
                ypos  = y0 + y * yrng;
            end
            
            if strcmp( zscale, 'log' )
                z0 = log( zlim( 1 ) );
                z1 = log( zlim( 2 ) ); 
                zrng = z1 - z0;
                zpos = exp( z0 + z * zrng );
            else
                z0    = zlim( 1 );
                zrng  = zlim( 2 ) - zlim( 1 );
                zpos  = z0 + z * zrng;
            end

                
                
            set( htext, 'Position', [ xpos, ypos, zpos ] );
        end
        
        function setposition( hobj, x, y ,z )
            hobj.fixedpos = [ x, y, z ];
            hobj.update;
        end
    end
end
