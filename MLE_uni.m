function [ theta_est ] = MLE_uni(data, theta_adap)

global theta_0

x0 = theta_0*(0.5+rand(1));
A = [];
b = [];
Aeq = [];
beq = [];
lb = theta_0*0.2;
ub = theta_0*1.8;
theta_est = patternsearch(@(x) loglikelihood_qec(data, x, theta_adap), x0, A, b, Aeq, beq, lb, ub);

end
