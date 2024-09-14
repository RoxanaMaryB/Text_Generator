
function [precision recall F1] = metrics(true_pozitives, false_pozitives, false_negatives)
    % precision = 0;
    % recall = 0;
    % F1 = 0;
    precision = sum(true_pozitives) / (sum(true_pozitives) + sum(false_pozitives));
    recall = sum(true_pozitives) / (sum(true_pozitives) + sum(false_negatives));
    F1 = (2 * precision * recall) / (precision + recall);
endfunction
