function [a] = get_prediction_params(K, y, lambda)
    n = size(K, 1);
    A = K + lambda * eye(n);
    L = chol(A); %da timeout daca folosesc functia mea cholesky
    z = forward_subst(L', y);
    a = backward_subst(L, z);
endfunction

function x = backward_subst(A, b)
    n = size(A, 1);
    x = zeros(n, 1);

    x(n) = b(n) / A(n, n);

    for i = n-1:-1:1
      x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    endfor
endfunction

function x = forward_subst(A, b)
    n = size(A, 1);
    x = zeros(n, 1);

    x(1) = b(1) / A(1, 1);

    for i = 2:n
      x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1)) / A(i, i);
    endfor
endfunction
