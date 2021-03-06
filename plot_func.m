global B gamma t theta_0 N_measurement N_adapting

theta_adap = zeros(N_adapting+1,4);
qfi_adap = zeros(N_adapting+1,4);
mse_adap = zeros(N_adapting,4);

load('theta_0=0');

theta_adap(:,1) = theta_qec_mean_1;
theta_adap(:,3) = theta_uni_mean_1;
qfi_adap(:,1) = cfi_qec_adap_1;
qfi_adap(:,3) = cfi_uni_adap_1;
mse_adap(:,1) = mse_qec_adap_1;
mse_adap(:,3) = mse_uni_adap_1;

load('theta_0=pi:2');

theta_adap(:,2) = theta_qec_mean_1;
theta_adap(:,4) = theta_uni_mean_1;
qfi_adap(:,2) = cfi_qec_adap_1;
qfi_adap(:,4) = cfi_uni_adap_1;
mse_adap(:,2) = mse_qec_adap_1;
mse_adap(:,4) = mse_uni_adap_1;


qfi_uni = 4*B^2*t^2;
qfi_qec = 4*B^2*t^2+4*gamma*t;
mse_qec = zeros(N_adapting, 1);
mse_uni = zeros(N_adapting, 1);

for i_adap = 1:N_adapting
    mse_qec(i_adap) = 1/(i_adap*N_measurement*qfi_qec);
    mse_uni(i_adap) = 1/(i_adap*N_measurement*qfi_uni);
end


figure(1)
subplot(3,1,1);
p1 = plot(0:N_adapting,theta_adap(:,1),'-.o',0:N_adapting,theta_adap(:,2),'-.d', ...,
    0:N_adapting,theta_adap(:,3),'-.p',0:N_adapting,theta_adap(:,4),'-.^', ...,
    [0,N_adapting],[theta_0,theta_0],'--','MarkerSize',10);
xlim([0,N_adapting])
xticks(1:N_adapting-1)
ylim([0,pi/2])
yticks([0 pi/4 pi/2])
yticklabels({'0','\pi/4','\pi/2'});
l2 = legend('$\hat{\theta}_0=0$ (Correlated)','$\hat{\theta}_0=\pi/2$ (Correlated)', ...,
    '$\hat{\theta}_0=0$ (Unitary)','$\hat{\theta}_0=\pi/2$ (Unitary)');
set(gca,'fontsize',18);
xlabel('Adapting steps','FontSize',22);
l3 = ylabel('$\hat{\theta}$','fontweight','bold','FontSize',22);
title('(a)','FontSize',18);
set(p1,'LineWidth',1.2);
%set(l1,'Interpreter','Latex','FontSize',18);
set(l2,'Interpreter','Latex');
set(l3,'Interpreter','Latex');



subplot(3,1,[2 3]);
p2 = plot(1:N_adapting,mse_adap(:,1),'-.o',1:N_adapting,mse_adap(:,2),'-.d', ...,
    1:N_adapting,mse_adap(:,3),'-.p',1:N_adapting,mse_adap(:,4),'-.^','MarkerSize',10);
xlim([0,N_adapting])
xticks(0:1:N_adapting)
ylim([0.007 0.3])
yticks([0.01 0.02 0.05 0.1 0.2])
yticklabels({'0.01','0.02','0.05','0.1','0.2'})
l4 = legend('$\hat{\theta}_0=0$ (Correlated)','$\hat{\theta}_0=\pi/2$ (Correlated)', ...,
    '$\hat{\theta}_0=0$ (Unitary)','$\hat{\theta}_0=\pi/2$ (Unitary)');
set(gca,'fontsize',18,'yscale','log')
xlabel('Adapting steps','FontSize',20);
l5 = ylabel('$E[(\hat{\theta}-\theta_0)^2]$','fontweight','bold','FontSize',22);
title('(b)','FontSize',18);
set(p2,'LineWidth',1.2);
set(l4,'Interpreter','Latex','FontSize',18);
set(l5,'Interpreter','Latex');

