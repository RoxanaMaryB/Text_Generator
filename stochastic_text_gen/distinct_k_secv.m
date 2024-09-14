function unique_cell_array = distinct_k_secv (cell_array)
  % TODO: Find unique strings HINT: unique
  % K secquences should come joined with strjoin
  % this function will look exactly like distinct_words
  uni = unique(cell_array);
  unique_cell_array = sort(uni);
endfunction
