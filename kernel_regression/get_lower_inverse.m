function [P] = get_lower_inverse(L)

    n = size(L, 1);
    I = eye(n);
    L2 = [L, I];

    % Gauss-Jordan
    for pivot = 1:n
        % scalare
        L2(pivot, :) = L2(pivot, :) / L2(pivot, pivot);

        % elimina deasupra si sub pivot
        for curr = 1:n
            if curr ~= pivot
                L2(curr, :) = L2(curr, :) - L2(curr, pivot) * L2(pivot, :);
            end
        end
    end

    P = L2(:, n+1:end);
end

