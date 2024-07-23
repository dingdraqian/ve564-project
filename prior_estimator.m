function res = prior_estimator(z, mu, A, noise_sigma, sigma)
    n = size(A, 1);
    p = size(A, 2);
    e = ones(p, 1);
    mu = 0;
    res = mu * e + A' * inv(A * A' + (noise_sigma ^ 2 / sigma ^ 2) * eye(n)) * (z - mu .* A * e); %see example 3.2
end
