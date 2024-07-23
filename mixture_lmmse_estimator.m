function res=mixture_lmmse_estimator(z, mu, A, noise_sigma, sigma)
    n = size(A, 1);
    p = size(A, 2);
    e = ones(p, 1);
    k=size(mu);
    prob=ones(k,1)/k;
    sigma_i=sigma*ones(k,1);
    mu_hat=mu*prob;
 sigma_hat=(sigma_i.^2)'*prob+(mu^2)*prob-(mu_hat^2);
 res=mu_hat*e+A'*inv(A*A'+noise_sigma^2/sigma_hat^2*eye(n))*(z-mu_hat*A*e);    
end