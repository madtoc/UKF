function [sigmas,Wc,Wm ] = sig_points(m,P)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%         Computes the sigma points for an unscented Kalman filter
%         given the mean (x) and covariance(P) of the filter.
%         Returns sigma points and weights.
%         sigma_points (5, 9, 2) # mean 5, covariance 9
        n=length(m);
        alpha=0.001; 
        beta=2; 
        kappa=n-3;
        l = alpha^2 * (n +kappa) - n;
        sigmas=zeros(2*n,n);
        Wc=zeros(1,2*n+1);
        Wm=Wc;
        U = chol((l + n)*P);
        sigmas(1,:)=m;
        for i=1:n
            sigmas(i+1,:)   = m+U(i,:);
            sigmas(n+i+1,:) = m-U(i,:);
        end
        for i=2:2*n+1
            Wc(i)= 0.5/(n+l);
            Wm(i)=Wc(i);
        end
        Wc(1) = l / (n + l) + (1 - alpha^2 + beta);
        Wm(1) = l / (n + l);
        %sigmas(:,3)=mod(sigmas(:,3),360);
end

