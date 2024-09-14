function probability = gaussian_distribution(X, mean_value, variance)
     n = size(variance, 1);
     d = det(variance);
     probability = 1 / ((2 * pi)^(n / 2) * sqrt(d));
     i = inv(variance);
     diff = X - mean_value; %presupun ca X e vector linie
     e = ((-1 / 2) * diff * i * diff');
     probability = probability * exp(e);
endfunction
