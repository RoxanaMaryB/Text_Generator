function [a] = get_prediction_params_iterative (K, y, lambda)
  # TO DO: folosind metode iterative, implementati logica
  # pentru a obtine vectorul coloana a, asa cum este descris in enuntul temei

    m = size(K, 1);
    A = lambda * eye(m) + K;
    x0 = zeros(m, 1);
    tol = 1e-6;
    max_iter = 1000;
    a = conjugate_gradient(A, y, x0, tol, max_iter);
endfunction
