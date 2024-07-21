%% generate observation
% design matrix
n=100;p=200;
nof_ite=300;
tolerance=10^-8;
noise_power=1;
for i=1:n
    for j=1:p
        A(i,j)=0.3^(abs(i-j)); % A is a n by p matrix
    end
end
%noise
epsilon_prior=normrand(0,noise_power,n,1);%epsilon:n by 1
epsilon_mixture=normrand(0,noise_power,n,1);
%x
x_gaussian_prior=gaussian_prior(sigma,mu);
x_gaussian_mixture=gaussian_mixture(sigma,mu);
%z
z_gaussian_prior=A*x_gaussian_prior+epsilon_prior;
z_gaussian_mixture=A*gaussian_mixture+epsilon_mixture;
%estimate
MMSE_prior=prior_estimator(z_gaussian_prior,mu,A,noise_power,sigma);
MMSE_mixture=
LMMSE_mixture=


%% res

%% plot