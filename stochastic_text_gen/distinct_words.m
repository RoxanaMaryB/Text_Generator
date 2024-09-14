
function retval = distinct_words (tokens)
  % TODO: Find unique strings HINT: unique
  uni = unique(tokens);
  retval = sort(uni);
endfunction
