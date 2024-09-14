function [x] = conjugate_gradient (A, b, x0, tol, max_iter)
  # Implementati algoritmul pentru metoda gradientului conjugat
  r = b - A * x0;
    v = r;
    x = x0;
    tolsq = tol^2;
    k = 1;

    while k <= max_iter && norm(r)^2 > tolsq
        t = (r' * r) / (v' * A * v);
        x = x + t * v;
        r_next = r - t * A * v;
        s = (r_next' * r_next) / (r' * r);
        v = r_next + s * v;
        r = r_next;
        k = k + 1;
    endwhile
endfunction
