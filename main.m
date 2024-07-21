%% generate observation
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

for logarithm_noise_var = -5:0.2:1
    noise_sigma = sqrt(10 ^ logarithm_noise_var);
    epsilon_prior = normrnd(0, noise_sigma, n, 1); %epsilon:n by 1
    epsilon_mixture = normrnd(0, noise_sigma, n, 1);
    %x
    x_gaussian_prior = gaussian_prior(sigma, p); % mean(mu)=0
    x_gaussian_mixture = gaussian_mixture(sigma, mu, p);
    %z
    z_gaussian_prior = A * x_gaussian_prior + epsilon_prior;
    z_gaussian_mixture = A * gaussian_mixture + epsilon_mixture;
    %estimate
    MMSE_prior = prior_estimator(z_gaussian_prior, 0, A, noise_sigma, sigma); %mean(mu)=0

end

%% res

%% plot
