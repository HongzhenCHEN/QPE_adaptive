global B gamma t theta_0 N_measurement N_adapting N_estimation
B = 0.1;
gamma = 0.05;
t = 5;     %evolution time
theta_0 = pi/4;     %real value of theta
N_measurement = 15;       %measurement times
N_adapting = 10;     %adapting steps
N_estimation = 1000;    %estimation times

%first trial for QEC & unitary
theta_est0 = 0;     %initial estimate

%estimation for QEC
theta_qec_adap_1 = zeros(N_adapting+1, N_estimation);
theta_qec_adap_1(1, :) = theta_est0;
measurement_qec = zeros(N_measurement*N_adapting, N_estimation);

for i_est = 1:N_estimation
    for i_adap = 1:N_adapting
        measurement_qec(N_measurement*(i_adap-1)+1:N_measurement*i_adap,i_est) ...,
            = sample_qec(theta_qec_adap_1(i_adap, i_est));
        theta_qec_adap_1(i_adap+1, i_est) = MLE_qec( ...,
            measurement_qec(1:N_measurement*i_adap,i_est), ...,
            theta_qec_adap_1(1:i_adap, i_est));
    end
end

%data processing for QEC
theta_qec_mean_1 = zeros(N_adapting+1, 1);
cfi_qec_adap_1 = zeros(N_adapting+1, 1);
mse_qec_adap_1 = zeros(N_adapting, 1);

theta_qec_mean_1(1) = mean(theta_qec_adap_1(1, :));
cfi_qec_adap_1(1) = cfi_qec(theta_qec_mean_1(1));

for i_adap = 1:N_adapting
    theta_qec_mean_1(i_adap+1) = mean(theta_qec_adap_1(i_adap+1, :));
    cfi_qec_adap_1(i_adap+1) = cfi_qec(theta_qec_mean_1(i_adap+1));
    mse_qec_adap_1(i_adap) = mse(theta_qec_adap_1(i_adap+1, :));
end

%estimation for unitary with optimal control
theta_uni_adap_1 = zeros(N_adapting+1, N_estimation);
theta_uni_adap_1(1, :) = theta_est0;
measurement_uni = zeros(N_measurement*N_adapting, N_estimation);

for i_est = 1:N_estimation
    for i_adap = 1:N_adapting
        measurement_uni(N_measurement*(i_adap-1)+1:N_measurement*i_adap,i_est) ...,
            = sample_uni(theta_uni_adap_1(i_adap, i_est));
        theta_uni_adap_1(i_adap+1, i_est) = MLE_uni( ...,
            measurement_uni(1:N_measurement*i_adap,i_est), ...,
            theta_uni_adap_1(1:i_adap, i_est));
    end
end

%data processing for unitary with optimal control
theta_uni_mean_1 = zeros(N_adapting+1, 1);
cfi_uni_adap_1 = zeros(N_adapting+1, 1);
mse_uni_adap_1 = zeros(N_adapting, 1);

theta_uni_mean_1(1) = mean(theta_uni_adap_1(1, :));
cfi_uni_adap_1(1) = cfi_uni(theta_uni_mean_1(1));

for i_adap = 1:N_adapting
    theta_uni_mean_1(i_adap+1) = mean(theta_uni_adap_1(i_adap+1, :));
    cfi_uni_adap_1(i_adap+1) = cfi_uni(theta_uni_mean_1(i_adap+1));
    mse_uni_adap_1(i_adap) = mse(theta_uni_adap_1(i_adap+1, :));
end

save theta_0=pi:8_temp2.mat


