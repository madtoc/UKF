function [u] = adjust_u(u)
%ADJUST_U Summary of this function goes here
%   Detailed explanation goes here
for i=length(u):-1:2
u(i,1)=u(i)-u(i-1);
end
u(:,1)=u(:,1)*0.001;
u(:,2)=u(:,2)*-1;
end

