clear all
clc
x=[1 1 0];
u=[0;0];
P=[1.82 0 0;0 1.1 0; 0 0 1];
room=[1.82 1.1];
Q=eye(3)*0.0001;
%load data
load('C:\Users\MT\Dropbox\ROBO AUTONOMO\ext\ekf_final\teste\grav1-150f-40esq-tras.mat')
u=data(:,3:4);
u=adjust_u(u);
ir_raw=data(:,10:14);
for i=1:length(u)
%%
% generate sigmapoints and weights
[sigmas,Wc,Wm ] = sig_points(x,P);
%predict
[X] = move(x,u(i,:),sigmas);
x=Wm*X;
Cx=X-repmat(x,length(X),1);
P=Cx'*diag(Wc)*Cx + Q;
%update
zIR = IR_raw2measure(ir_raw(i,:));
[z,h,R] = Z_(room,X,zIR)
zmean=(Wm*h)
Cz=h-repmat(zmean,length(h),1);
Pz=Cz'*diag(Wc)*Cz + R;
y=z-zmean
K=Cx'*diag(Wc)*Cz/(Pz);
x=x+transpose(K*y');
P=P-K*Pz*K';
circle(x(1), x(2),[1.82 1.1])
xlabel('width (m)','fontsize',14)
ylabel('height (m)','fontsize',14)
pause(0.1)
end