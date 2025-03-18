function [gamma] = metricOmega(I_original, I_restored, ALPHA0, K)
    % Measure PSNR
    PSNR_val = psnr(I_original, I_restored);

    % Check if PSNR is overflowing
    if ((PSNR_val == Inf) || (isnan(PSNR_val)))
        PSNR_val_corr = min(PSNR_val, 50);
    else
        PSNR_val_corr = PSNR_val;
    end

    % Measure Q for original image
    Q_original = calculateQMetric(I_original, 0.001);

    % Measure Q for restored image
    Q_restored = calculateQMetric(I_restored, 0.001);
    
    % Measure delta
    alpha_val = getAlpha(Q_restored, Q_original);

    % Check if alpha_val is 0 / 0
    if (isnan(alpha_val))
        % Return 100% weightage to PSNR
        weight_2 = 0;
        weight_1 = 1 - weight_2;
        gamma = weight_1 * PSNR_val_corr + weight_2 * Q_restored;
        return;
    end

    % Check if Q_restored > Q_original
    % if (Q_restored > Q_original)
    %     alpha_val = -1 * alpha_val;
    % else
    %     alpha_val = alpha_val;
    % end
    % Check if delta > 1 (Extremely sharp)
    % if(alpha_val > 2)
    %     weight_2 = 0;
    %     weight_1 = 1 - weight_2;
    %     gamma = weight_1 * PSNR_val_corr + weight_2 * Q_restored;
    %     return;
    % end

    % Check sign
    % correctedSign_delta  = checkSign(alpha_val, Q_restored, Q_original);
    
    % Get weights
    weight_2 = monoid(alpha_val, ALPHA0, K);
    weight_1 = 1 - weight_2;

    % Calculate gamma
    gamma = weight_1 * PSNR_val_corr + weight_2 * Q_restored;
end
