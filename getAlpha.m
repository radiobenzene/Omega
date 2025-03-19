% Function to measure alpha, i.e how 
% Input:
%   Q_restored : Q for the restored image
%   Q_original : Q for the original image
% Output:
%   del_value : alpha
function [del_value] = getAlpha(Q_restored, Q_original)
    % Taking absolute value
    numerator = abs(Q_restored - Q_original);

    % Specifying denominator
    denominator = Q_original;

    % Getting the alpha value
    del_value = numerator / denominator;
end