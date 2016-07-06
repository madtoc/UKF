function [z,h,R] = Z_(room,X,zIR)
%Z_ Summary of this function goes here
%   Detailed explanation goes here
    nsensor=5;
    dev=0.025;
    s_range=1.5;
    r=0.115;
    h=[];
    z=[];
    p=[];
    ang=180/(nsensor-1);
    hzinho = @(x,y,p_x,p_y) sqrt( (p_x - x)^2 + (p_y - y)^2);
    
    n=find(zIR<s_range);
    z=zIR+r;
    z=z(n);
    
    for i=1:length(n)
        for j=1:length(X)
            mod(X(j,3)-90+ang*(n(i)-1),360);
            p= nearest(room,[X(j,1);X(j,2);mod(X(j,3)-90+ang*(n(i)-1),360)]);
            h(i,j)= hzinho(X(j,1),X(j,2),p(1),p(2));
        end
    end
h=h';
R=eye(length(z))*dev;
end

