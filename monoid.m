% Function that resemebles sigmoid
% MONOID - My sigOID
function [res] = monoid(x, x0, K)
    numerator = 1;
    denominator = (1 + exp(K * (x - x0)));

    res = numerator / denominator;
    
end