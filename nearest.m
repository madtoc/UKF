function [point] = nearest(room,x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    theta=mod(x(3),360);
    if theta > 90 & theta <= 270
        limx=0;
    else
        limx=room(1);
    end
    
    if theta > 180 & theta <= 360
        limy=0;
    else
        limy=room(2);
    end
    
    if theta == 0 | theta == 180
        s=0;
    else
        s=sin(theta*pi/180);
    end
    
    if theta == 90 | theta == 270
        c=0;
    else
        c=cos(theta*pi/180);
    end
    if s == 0
        a=(limx-x(1))/c;
    elseif c ==0
        a=(limy-x(2))/s;
    else
        a=min((limx-x(1))/c,(limy-x(2))/s);
    end
    point=[x(1)+a*c,x(2)+a*s];
end

