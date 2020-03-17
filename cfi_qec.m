function [ cfi ] = cfi_qec(thetaest)

global theta_0

dtheta = 1e-3;
pvec1 = pdf_qec(theta_0, thetaest);
pvec2 = pdf_qec(theta_0+dtheta, thetaest);

cfi = 8*(1-sum(sqrt(pvec1.*pvec2)))/(dtheta*dtheta);

end

