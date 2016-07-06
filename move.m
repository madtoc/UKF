function [Y] = move(x,u,sigmas)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
    n=length(x);
    Q = [-0.0005;-0.0005;0.000];
    D=u(1);
    T=u(2)*180/pi;
    
    for i=1:2*n+1
    theta = sigmas(i,3)*pi/180;
    a=theta+u(2);
    f=[D*cos(a) D*sin(a) T];
    Y(i,:)=sigmas(i,:) + f;
    %Y(i,3)=mod(Y(i,3),360);
    end
    
end