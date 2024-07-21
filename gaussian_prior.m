function x = gaussian_prior(sigma, p)
    x = normrnd(0, sigma, p, 1);
end
