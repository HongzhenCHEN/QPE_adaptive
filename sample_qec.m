function [ S ] = sample_qec(thetaest)

global theta_0 N_measurement

pvec = pdf_qec(theta_0, thetaest);
S = zeros(N_measurement, 1);

for i = 1:N_measurement
    temp = rand(1);
    if temp <= pvec(1)
        S(i) = 1;
    else
        S(i) = 2;
    end
end

end

