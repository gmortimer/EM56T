classdef PlotAxis < matlab.mixin.SetGet
    
    properties
        haxis;
        title;
        colors;
        fontsize;
        nplot;
        hplot;
        ntext;
        htext;
        xlim,
        ylim,
        xtick,
        ytick,
        xscale,
        yscale,
        xdata,
        ydata,
        xcolor,
        ycolor,
        linestyle,
        linewidth,
        linecolor,
        marker,
        markersize,
        markeredgecolor,
        markerfacecolor,
        xgrid,
        ygrid,
        gridcolor,
        gridalpha,
        gridlinestyle,
        minorgrid,
        xminorgrid,
        yminorgrid,
        minorgridcolor,
        minorgridalpha,
        minorgridlinestyle
    end

    methods
        % Constructor
        function hobj = PlotAxis( coords, nplot, ntext, title, colors, fontsize )
            if nargin > 0
                hobj.title      = title(~isspace( title ));
                hobj.colors     = colors;
                hobj.fontsize   = fontsize;
                hobj.haxis      = subplot( coords( 1 ), coords( 2 ), coords( 3 ) );
                hobj.nplot      = nplot;
                hplot = gobjects( 1, nplot );
                for i = 1 : nplot
                    hplot( 1, i ) = plot( 1 : 10, ( 1 : 10 ) .* i );
                    hold on;
                    set( hplot( 1, i ), 'Visible', 'on' );
                end
                hobj.hplot           = hplot;
                hobj.ntext           = ntext;
                hobj.htext           = gobjects( 1, ntext );
                for i = 1 : hobj.ntext
                    hobj.htext( 1, i ) = text( 0, 0, 'Anteater' );
                    set( hobj.htext( 1, i ), 'Visible',  'on' );
                    set( hobj.htext( 1, i ), 'UserData', FixedText( hobj.htext( 1, i ), 0, 0, 0 ) );
                end
                hobj.setaxis;
            end
        end
        
        function setaxis( hobj )
            hobj.haxis.Color           = hobj.colors.graphcolor;
            hobj.haxis.XColor          = hobj.colors.axiscolor;
            hobj.haxis.YColor          = hobj.colors.axiscolor;
            hobj.haxis.XGrid           = 'on';
            hobj.haxis.YGrid           = 'on';
            hobj.haxis.XMinorGrid      = 'on';
            hobj.haxis.YMinorGrid      = 'on';
            hobj.haxis.Clipping        = 'on';
            hobj.haxis.GridAlpha       = 1.0;
            hobj.haxis.MinorGridAlpha  = 0.5;
            hobj.haxis.GridColor       = hobj.colors.gridcolor;
            hobj.haxis.MinorGridColor  = hobj.colors.gridcolor;
            hobj.haxis.GridLineStyle   = ':';
            hobj.haxis.FontSize        = hobj.fontsize;
            
            set( hobj.htext( 1, 1 ), 'Color',    hobj.colors.textcolor1 );
            set( hobj.htext( 1, 1 ), 'FontSize', hobj.fontsize );
            set( hobj.htext( 1, 1 ), 'Visible',  'on' );
            set( hobj.htext( 1, 1 ), 'String',   sprintf('%s', hobj.title ) );
            set( hobj.htext( 1, 1 ), 'HorizontalAlignment',  'center' );
            hftext = get( hobj.htext( 1, 1 ), 'UserData' );
            hftext.setposition( 0.5, 1.1, 0 );
            
            for i = 2 : hobj.ntext
                set( hobj.htext( 1, i ), 'Color',    hobj.colors.textcolor1 );
                set( hobj.htext( 1, i ), 'FontSize', hobj.fontsize );
                set( hobj.htext( 1, i ), 'Visible',  'off' );
                hftext = get( hobj.htext( 1, i ),   'UserData' );
                hftext.setposition( 0, 0, 0 );
            end
%            obj.updateftext;
        end

        function h = get.hplot( hobj )
            h = hobj.hplot;
        end
        
        function h = get.htext( hobj )
            h = hobj.htext;
        end
        
        function y = get.xlim( hobj )
            y = get( hobj.haxis, 'XLim' );
        end
        function set.xlim( hobj, lim )
            set( hobj.haxis, 'XLim', lim );
            hobj.updateftext;
        end
        
        function y = get.ylim( hobj )
            y = get( hobj.haxis, 'YLim' );
        end
        function set.ylim( hobj, lim )
            set( hobj.haxis, 'YLim', lim );
            hobj.updateftext;
        end
        
        function y = get.xtick( hobj )
            y = get( hobj.haxis, 'XTick' );
        end
        function set.xtick( hobj, tick )
            set( hobj.haxis, 'XTick', tick );
        end
        
        function y = get.ytick( hobj )
            y = get( hobj.haxis, 'YTick' );
        end
        function set.ytick( hobj, tick )
            set( hobj.haxis, 'YTick', tick );
        end
        
        function y = get.xscale( hobj )
            y = get( hobj.haxis, 'XScale' );
        end
        function set.xscale( hobj, s )
            set( hobj.haxis, 'XScale', s );
            hobj.updateftext;
        end
        
        function y = get.yscale( hobj )
            y = get( hobj.haxis, 'YScale' );
        end
        function set.yscale( hobj, s )
            set( hobj.haxis, 'YScale', s );
            hobj.updateftext;
        end
        
        function y = get.xcolor( hobj )
            y = get( hobj.haxis, 'XColor' );
        end
        function set.xcolor( hobj, c )
            set( hobj.haxis, 'XColor', c );
        end
        
        function y = get.ycolor( hobj )
            y = get( hobj.haxis, 'YColor' );
        end
        function set.ycolor( hobj, c )
            set( hobj.haxis, 'YColor', c );
        end     
        
        
        function y = get.xgrid( hobj )
            y = get( hobj.haxis, 'XGrid' );
        end
        function set.xgrid( hobj, s )
            set( hobj.haxis, 'XGrid' , s );
        end
        
        function y = get.ygrid( hobj )
            y = get( hobj.haxis, 'YGrid' );
        end
        function set.ygrid( hobj, s )
            set( hobj.haxis, 'YGrid' , s );
        end
        
        function y = get.gridcolor( hobj )
            y = get( hobj.haxis, 'GridColor' );
        end
        function set.gridcolor( hobj, s )
            set( hobj.haxis, 'GridColor' , s );
        end
      
        function y = get.gridalpha( hobj )
            y = get( hobj.haxis, 'GridAlpha' );
        end
        function set.gridalpha( hobj, a )
            set( hobj.haxis, 'GridAlpha' , a );
        end
        
        function y = get.gridlinestyle( hobj )
            y = get( hobj.haxis, 'GridLineStyle' );
        end
        function set.gridlinestyle( hobj, l )
            set( hobj.haxis, 'GridLineStyle', l );
        end
                
        function y = get.xminorgrid( hobj )
            y = get( hobj.haxis, 'XMinorGrid' );
        end
        function set.xminorgrid( hobj, s )
            set( hobj.haxis, 'XMinorGrid', s );
        end
        
        function y = get.yminorgrid( hobj )
            y = get( hobj.haxis, 'YMinorGrid' );
        end
        function set.yminorgrid( hobj, s )
            set( hobj.haxis, 'YMinorGrid', s );
        end
        
        function y = get.minorgridcolor( hobj )
            y = get( hobj.haxis, 'MinorGridColor' );
        end
        function set.minorgridcolor( hobj, c )
            set( hobj.haxis, 'MinorGridColor', c );
        end
        
        function y = get.minorgridalpha( hobj )
            y = get( hobj.haxis, 'MinorGridAlpha' );
        end
        function set.minorgridalpha( hobj, a )
            set( hobj.haxis, 'MinorGridAlpha', a );
        end
        
        function y = get.minorgridlinestyle( hobj )
            y = get( hobj.haxis, 'MinorGridLineStyle' );
        end
        function set.minorgridlinestyle( hobj, s )
            set( hobj.haxis, 'MinorGridLineStyle', s );
        end
        
        
        function setxdata( hobj, n, data )
            set( hobj.hplot( n ), 'XData' , data  );
            hobj.updateftext;
        end
        
        function setydata( hobj, n, data )
            set( hobj.hplot( n ), 'YData' , data  );
            hobj.updateftext;
        end
        
        function setlinestyle( hobj, n, linestyle )
            set( hobj.hplot( n ), 'LineStyle' , linestyle  );
        end
        
        function setlinewidth( hobj, n, linewidth )
            set( hobj.hplot( n ), 'LineWidth' , linewidth  );
        end
        
        function setlinecolor( hobj, n, linecolor )
            set( hobj.hplot( n ), 'Color' , linecolor  );
        end
        
        function setmarker( hobj, n, marker )
            set( hobj.hplot( n ), 'Marker' , marker  );
        end
        
        function setmarkersize( hobj, n, markersize )
            set( hobj.hplot( n ), 'MarkerSize' , markersize  );
        end
        
        function setmarkeredgecolor( hobj, n, markeredgecolor )
            set( hobj.hplot( n ), 'MarkerEdgeColor' , markeredgecolor  );
        end
        
        function setmarkerfacecolor( hobj, n, markerfacecolor )
            set( hobj.hplot( n ), 'MarkerFaceColor' , markerfacecolor  );
        end
        
        function plot( hobj, n, xdata, ydata, color )
            set( hobj.hplot( n ), 'XData', xdata, 'YData', ydata, 'Color', color );
            hobj.updateftext;
        end
        
        function setgraph ( hobj, n, linestyle, linewidth, linecolor, marker, markersize, markeredgecolor, markerfacecolor )
            set( hobj.hplot( n ).hplot, 'LineStyle', linestyle, 'LineWidth', linewidth, 'Color', linecolor, 'Marker', marker, 'MarkerSize', markersize, 'MarkerEdgeColor', markeredgecolor, 'MarkerFaceColor', markerfacecolor );
            hobj.updateftext;
        end


        
        function hplot = gethplot( hobj, n )
            hplot = hobj.hplot( n );
        end
        
        function htext = gethtext( hobj, n )
            htext = hobj.htext( n );
        end
        
        function settext( hobj, n, x, y, string )
            htext = hobj.htext( n );
            hftext = get( htext, 'UserData' );
            set( htext, 'String', string );
            hftext.setposition( x, y, 0 );
            set( htext, 'Visible', 'on' );
        end
        
        function updateftext( hobj )
            % x and y are constant from ( 0, 0 ) bottom left to ( 1, 1 )
            % top right.
            for i = 1 : length( hobj.htext )
                hftext = get( hobj.htext( 1, i ), 'UserData' );
                hftext.update;
            end
        end
        
    end
end


