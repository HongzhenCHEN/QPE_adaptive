function [ pvec ] = pdf_qec(theta, thetaest)

global B gamma t

dtheta = theta-thetaest;
pvec = zeros(2, 1);

pvec(1) = 1/2*( 1+exp(-2*t*gamma*sin(dtheta)^2)*cos(2*B*t*sin(dtheta)) );
pvec(2) = 1/2*( 1-exp(-2*t*gamma*sin(dtheta)^2)*cos(2*B*t*sin(dtheta)) );


end

