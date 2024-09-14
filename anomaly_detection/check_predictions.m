function [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths)

    m = size(predictions, 1);
    false_pozitives = zeros(m, 1);
    false_negatives = zeros(m, 1);
    true_pozitives = zeros(m, 1);
    for i = 1:m
      if truths(i) == 1 && predictions(i) == 1 %e buna predictia
        true_pozitives(i) = 1;
      elseif truths(i) == 1 && predictions(i) == 0 %nu e buna predictia
        false_negatives(i) = 1;
      elseif truths(i) == 0 && predictions(i) == 1 %nu e buna predictia
        false_pozitives(i) = 1;
      endif
    endfor
endfunction
