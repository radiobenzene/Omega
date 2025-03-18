
function [gamma_val] = patchBasedOmega(I_original, I_ref, PATCH_SIZE, ALPHA0, K)
    % Get patches from original image
    [GT_patches] = generatePatches(I_original, PATCH_SIZE);

    % Get patches from reference image
    [ref_patches] = generatePatches(I_ref, PATCH_SIZE);

    % Get total number of patches
    num_patches = size(GT_patches);
    num_patches = num_patches(1);

    % Create a cell for metric Gamma
    metric_gamma = zeros(num_patches, num_patches);

    for i = 1 : num_patches
        for j = 1 : num_patches
            metric_gamma(i, j) = metricOmega(GT_patches{i, j}, ...
                ref_patches{i, j}, ALPHA0, K);
        end
    end

    % Get average metric gamma value over rows and columns
    mean_metric_gamma = mean(metric_gamma(:));

    % Return gamma value
    gamma_val = mean_metric_gamma;

end
