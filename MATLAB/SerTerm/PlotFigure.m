classdef PlotFigure < matlab.mixin.SetGet
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        hfig,
        title,
        colors,
        naxis,
        haxis,
        color
    end
    
    methods
        function hobj = PlotFigure( title, colors, naxis, axistitle, axiscoords, axisnplot, axisntext, axisfontsize )
            if nargin > 0
                hobj.hfig         = figure;
                hobj.title        = title;
                hobj.colors       = colors;
                hobj.naxis        = naxis;
                hobj.hfig.Color         = hobj.colors.figurecolor;
                hobj.hfig.Units         ='normalized';
                hobj.hfig.OuterPosition = [ 0 0 1 1 ];
                haxis( 1, naxis ) = PlotAxis( axiscoords( naxis, : ), axisnplot( naxis ), axisntext( naxis ), axistitle( naxis, : ), colors, axisfontsize( naxis ) );
                if naxis > 1
                    for i = 1 : hobj.naxis - 1
                        haxis( 1, i ) = PlotAxis( axiscoords( i, : ), axisnplot( i ), axisntext( i ), axistitle( i, : ), colors, axisfontsize( i ) );
                    end
                end
                hobj.haxis = haxis;
            end
        end
  
        function y = get.hfig( hobj )
            y = hobj.hfig;
        end
        function set.hfig( hobj, hfig )
            hobj.hfig = hfig;
        end
        
        function y = get.title( hobj )
            y = hobj.title;
        end
        function set.title( hobj, title )
            hobj.title = title;
        end
        
        function y = get.colors( hobj )
            y = hobj.colors;
        end
        
        function y = get.naxis( hobj )
            y = hobj.naxis;
        end
        
        function h = get.haxis( hobj )
            h = hobj.haxis;
        end
        
        function y = get.color( hobj )
            y = get( hobj.hfig, 'color' );
        end
        function set.color( hobj, c )
            set( hobj.hfig, 'color', c );
        end
        
        function h = gethaxis( hobj, n )
            h = hobj.haxis( n );
        end
    
    end
end

