function x = gaussian_mixture(sigma, mu, p)
    x = zeros(p, 1);
    nof_mix=length(mu);
    prob=1/nof_mix*ones(nof_mix,1);
    for j = 1:p

        for i = 1:nof_mix
            x(j) = x(j) + prob(i) * normrnd(mu(i), sigma, 1, 1);
        end

    end

end
