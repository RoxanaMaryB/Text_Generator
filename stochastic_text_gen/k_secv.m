function B = k_secv (A, k)

  n = length(A);
  nrsecv = n-k;
  B = cell(1, nrsecv);

  for i = 1:nrsecv
    startin = i;
    endin = min(i + k - 1, n);
    secv = A(startin:endin);
    concat = strjoin(secv);
    B{i} = concat;
  endfor
  B = B';
endfunction

