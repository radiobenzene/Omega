function [res] = checkSign(delta_val, Q_restored, Q_original)
    if(Q_restored > Q_original)
        res = -1 * delta_val;
    else
        res = delta_val;
    end
end