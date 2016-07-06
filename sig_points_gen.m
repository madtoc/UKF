function [ sigmas ] = sigma_points_gen(m,P,n,alpha,beta,kappa )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%         Computes the sigma points for an unscented Kalman filter
%         given the mean (x) and covariance(P) of the filter.
%         Returns sigma points and weights.
%         sigma_points (5, 9, 2) # mean 5, covariance 9
        l = alpha^2 * (n +kappa) - n
        sigmas=zeros(2*n,n)
        U = chol((l + n)*P)
        sigmas(1,:)=m
        for i=1:n
            sigmas(i+1,:)   = m+U(i,:)
            sigmas(n+i+1,:) = m-U(i,:)
        end        
end

