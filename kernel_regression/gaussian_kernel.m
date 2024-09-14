function retval = gaussian_kernel (x, y, sigma)
  # TO DO: implement gaussian kernel function
  diff = x' - y';
  norma = norm(diff);
  patrat = norma * norma
  retval = exp(-patrat / (2 * sigma^2));
endfunction
