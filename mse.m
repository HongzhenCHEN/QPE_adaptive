function [ mse ] = mse(theta_est)
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here
global theta_0
n = length(theta_est);
mse = 0;
for i_n = 1:n
    mse = mse + (theta_est(i_n)-theta_0)^2;
end
mse = mse/n;

end

