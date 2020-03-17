function [ pvec ] = pdf_uni(theta, thetaest)

global B t

pvec = zeros(3, 1);

pvec(1) = cos(B*t*sqrt(2-2*cos(theta-thetaest)))^2;
pvec(2) = cos((theta+thetaest)/2)^2*sin(B*t*sqrt(2-2*cos(theta-thetaest)))^2;
pvec(3) = sin((theta+thetaest)/2)^2*sin(B*t*sqrt(2-2*cos(theta-thetaest)))^2;


end

