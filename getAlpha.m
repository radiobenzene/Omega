function [del_value] = getAlpha(Q_restored, Q_original)
    % Taking absolute value
    numerator = abs(Q_restored - Q_original);

    % Specifying denominator
    denominator = Q_original;

    % Getting the alpha value
    del_value = numerator / denominator;
end