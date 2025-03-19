% Sigmoid function with the parameters x0 and K
% Input:
%   x : values
%   x0 : axis-shift parameter
%   K : axis-shift parameter
% Output:
%   res: result of sigmoid function
function [res] = monoid(x, x0, K)
    % Specifying the numerator
    numerator = 1;

    % Specifying the denominator
    denominator = (1 + exp(K * (x - x0)));
    
    % Resulting sigmoid function
    res = numerator / denominator;
    
end