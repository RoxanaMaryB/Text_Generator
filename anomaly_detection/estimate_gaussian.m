% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values, variances] = estimate_gaussian(X)

    X = X'; %transpusa pentru ca asa verifica checkerul
    [m, n] = size(X);
    mean_values = zeros(m, 1);
    sum = zeros(m, m);
    help = zeros(m, m);
    variances = (1/n) * ones(m, m);

    % vector medie
    for i = 1:m
        mean_values(i, 1) = mean(X(i, :));
    endfor

    % matrice covarianta

    for i = 1:n
      diff = X(:, i) - mean_values; %vector coloana
      help = diff * diff'; %matrice m*m pe care o adaug la suma
      sum = sum + help;
    endfor

    for i = 1:m
      for j = 1:m
        variances(i, j) = variances(i, j) * sum(i, j);
      endfor
    endfor

    mean_values = mean_values';

endfunction

