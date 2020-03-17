function [ S ] = sample_uni(thetaest)

global theta_0 N_measurement

pvec = pdf_uni(theta_0, thetaest);
S = zeros(N_measurement, 1);

for i = 1:N_measurement
    temp = rand(1);
    if temp <= pvec(1)
        S(i) = 1;
    else
        if temp <= pvec(1)+pvec(2)
            S(i) = 2;
        else
            S(i) = 3;
        end
    end
end

end

