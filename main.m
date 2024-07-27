%% generate observation
clear
% design matrix
n = 100; p = 200;
nof_ite = 300;
nof_trial = 50;
tolerance = 10 ^ -8;
sigma = 1;
mu = [-1, -0.5, 0, 1, 3];

for i = 1:n

    for j = 1:p
        A(i, j) = 0.3 ^ (abs(i - j)); % A is a n by p matrix
    end

end

%noise
logarithm_noise_var = -5:0.2:1;
idx=1;
for logarithm_noise_var = -5:0.2:1
    for i=1:nof_trial
    noise_sigma = sqrt(10^(logarithm_noise_var));
    epsilon_prior = normrnd(0, noise_sigma, n, 1); %epsilon:n by 1
    epsilon_mixture = normrnd(0, noise_sigma, n, 1);
    %x
    x_gaussian_prior = gaussian_prior(sigma, p); % mean(mu)=0
    x_gaussian_mixture = gaussian_mixture(sigma, mu, p);
    %z
    z_gaussian_prior = A * x_gaussian_prior + epsilon_prior;
    z_gaussian_mixture = A * x_gaussian_mixture + epsilon_mixture;
    %estimate
    MMSE_prior = prior_estimator(z_gaussian_prior, 0, A, noise_sigma, sigma); %mean(mu)=0
    MMSE_mixture = mixture_mmse_estimator(z_gaussian_mixture, mu, A, noise_sigma, sigma);
    LMMSE_mixture = mixture_lmmse_estimator(z_gaussian_mixture, mu, A, noise_sigma, sigma);
    cost_prior_mmse(i)=norm(x_gaussian_prior-MMSE_prior);
    cost_mixture_mmse(i)=norm(x_gaussian_mixture-MMSE_mixture);
    cost_mixture_lmmse(i)=norm(x_gaussian_mixture-LMMSE_mixture);
    end
    res_prior_mmse(idx)=mean(cost_prior_mmse);
    res_mixture_mmse(idx)=mean(cost_mixture_mmse);
    res_mixture_lmmse(idx)=mean(cost_mixture_lmmse);
    idx=idx+1;
end
%% res

%% plot
figure 
plot(res_mixture_mmse);
hold on;
plot(res_mixture_lmmse);