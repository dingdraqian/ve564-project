function res=mixture_mmse_estimator(z, mu, A, noise_sigma, sigma)
    n = size(A, 1);
    p = size(A, 2);
    e = ones(p, 1);
    k=size(mu);
    sigma_i=sigma*ones(k,1);
    for i=1:k
        mu_hat(i)=mu(i)*A*e;
        C(i)=sigma_i(i)^2*A*A'+noise_sigma^2*eye(n);
    end
    for i=1:k
        phi(i)=1/(2*pi)^(n/2)/sqrt(det(C(i)))*exp(-1/2*(z-mu_hat(i))'*inv(C(i))*(z-mu_hat(i)));
    end
    for i=1:k
        beta(i)=phi(i)/sum(phi);
    end
    res=0;
    for i=1:k
        res=res+beta(i)*(mu(i)*e+A'*inv(A*A'+noise_sigma^2/sigma_i(i)^2*eye(p))*(z-mu(i)*A*e));
    end
end