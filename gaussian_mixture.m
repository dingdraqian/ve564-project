function x = gaussian_mixture(sigma, mu, p)
    x = zeros(p, 1);
    prob(i) = 1 / length(mu);

    for j = 1:p

        for i = 1:length(mu)
            x(j) = x(j) + prob(i) * normrnd(mu(i), sigma, 1, 1);
        end

    end

end
