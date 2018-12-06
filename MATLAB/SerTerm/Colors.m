classdef Colors
    
    properties ( Constant )
  
        rgbwhite        = [ 1.00, 1.00, 1.00 ];
        rgbgrey95       = [ 0.95, 0.95, 0.95 ];
        rgbgrey90       = [ 0.90, 0.90, 0.90 ];
        rgbgrey85       = [ 0.50, 0.50, 0.50 ];
        rgbgrey80       = [ 0.80, 0.80, 0.80 ];
        rgbgrey75       = [ 0.50, 0.50, 0.50 ];
        rgbgrey70       = [ 0.70, 0.70, 0.70 ];
        rgbgrey65       = [ 0.50, 0.50, 0.50 ];
        rgbgrey60       = [ 0.60, 0.60, 0.60 ];
        rgbgrey55       = [ 0.50, 0.50, 0.50 ];
        rgbgrey50       = [ 0.50, 0.50, 0.50 ];
        rgbgrey45       = [ 0.50, 0.50, 0.50 ];
        rgbgrey40       = [ 0.40, 0.40, 0.40 ];
        rgbgrey35       = [ 0.35, 0.35, 0.35 ];
        rgbgrey30       = [ 0.30, 0.30, 0.30 ];
        rgbgrey25       = [ 0.25, 0.25, 0.25 ];
        rgbgrey20       = [ 0.20, 0.20, 0.20 ];
        rgbgrey15       = [ 0.15, 0.15, 0.15 ];
        rgbgrey10       = [ 0.10, 0.10, 0.10 ];
        rgbgrey5        = [ 0.05, 0.05, 0.05 ];
        rgbblack        = [ 0.00, 0.00, 0.00 ];
        
        rgbred          = [ 1.00, 0.00, 0.00 ];
        rgbgreen        = [ 0.00, 1.00, 0.00 ];
        rgbblue         = [ 0.00, 0.00, 1.00 ];
        rgbyellow       = [ 1.00, 1.00, 0.00 ];
        rgbcyan         = [ 0.00, 1.00, 1.00 ];
        rgbmagenta      = [ 1.00, 0.00, 1.00 ];
        rgborange       = [ 1.00, 0.50, 0.00 ];
        rgblime         = [ 0.50, 1.00, 0.00 ];
        rgbcyangreen    = [ 0.00, 1.00, 0.50 ];
        rgbroyalblue    = [ 0.00, 0.50, 1.00 ];
        rgbpurple       = [ 0.50, 0.00, 1.00 ];
        rgbrose         = [ 1.00, 0.50, 0.00 ];
        
        rbyred          = [ 254, 39 , 18  ] / 255;
        rbyyellow       = [ 254, 254, 51  ] / 255;
        rbyblue         = [ 2  , 71 , 254 ] / 255;
        rbyorange       = [ 251, 153, 2   ] / 255;
        rbygreen        = [ 102, 176, 50  ] / 255;
        rbypurple       = [ 134, 1  , 175 ] / 255;
        rbyredorange    = [ 252, 96 , 10  ] / 255;
        rbyyelloworange = [ 252, 204, 26  ] / 255;
        rbyyellowgreen  = [ 178, 215, 50  ] / 255;
        rbybluegreen    = [ 52 , 124, 152 ] / 255;
        rbybluepurple   = [ 68 , 36 , 214 ] / 255;
        rbyredpurple    = [ 194, 20 , 96  ] / 255;
        
    end
    
    properties
        figurecolor,
        graphcolor,
        axiscolor,
        gridcolor,
        textcolor1,
        textcolor2,
        textcolor3,
        textcolor4,
        plotcolor1,
        plotcolor2,
        plotcolor3,
        plotcolor4
    end
    
    
    methods
        function obj = Colors( )
            obj.figurecolor     = [ 0.30, 0.30, 0.40 ];
            obj.graphcolor      = [ 0.20, 0.20, 0.20 ];
            obj.axiscolor       = [ 1.00, 1.00, 1.00 ];
            obj.gridcolor       = [ 1.00, 1.00, 1.00 ];
            obj.textcolor1      = [ 1.00, 1.00, 1.00 ];
            obj.textcolor2      = [ 1.00, 1.00, 1.00 ];
            obj.textcolor3      = [ 1.00, 1.00, 1.00 ];
            obj.textcolor4      = [ 1.00, 1.00, 1.00 ];
            obj.plotcolor1      = [ 1.00, 1.00, 1.00 ];
            obj.plotcolor2      = [ 1.00, 1.00, 1.00 ];
            obj.plotcolor3      = [ 1.00, 1.00, 1.00 ];
            obj.plotcolor4      = [ 1.00, 1.00, 1.00 ];
        end
    end
end



