function [ loglikelihood ] = loglikelihood_uni(data, theta, thetaest)

global N_measurement
N_adap = length(thetaest);
loglikelihood = 0;

for i_adap = 1:N_adap
    count1 = 0;
    count2 = 0;
    count3 = 0;
    pvec = pdf_uni(theta, thetaest(i_adap));
    for s = N_measurement*(i_adap-1)+1:N_measurement*i_adap
        if data(s) == 1
            count1 = count1+1;
        else
            if data(s) == 2
                count2 = count2+1;
            else
                count3 = count3+1;
            end
        end
    end
    loglikelihood = loglikelihood-(count1*log(pvec(1))+count2*log(pvec(2))+count3*log(pvec(3)));
end

end
