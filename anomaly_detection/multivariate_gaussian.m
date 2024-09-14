% Computes the probability density function of the multivariate gaussian distribution.
function probabilities = multivariate_gaussian(X, mean_values, variances)
    %X = X';
    [m, n] = size(X);
    probabilities = zeros(m, 1);
    for i = 1:m
      x_i = X(i, :);
      probabilities(i, 1) = gaussian_distribution(x_i, mean_values, variances);
    endfor
endfunction
