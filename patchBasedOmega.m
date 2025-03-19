% Function to measure Omega
% Input:
%   I_original : original image
%   I_ref : restored image
%   PATCH_SIZE : patch size for measure Omega
%   ALPHA_0 : axis shift parameter for sigmoid function
%   K : axis shift parameter for sigmoid function
% Output:
%   omega_val : Metric omega value
function [omega_val] = patchBasedOmega(I_original, I_ref, PATCH_SIZE, ALPHA_0, K)
    % Get patches from original image
    [GT_patches] = generatePatches(I_original, PATCH_SIZE);

    % Get patches from reference image
    [ref_patches] = generatePatches(I_ref, PATCH_SIZE);

    % Get total number of patches
    num_patches = size(GT_patches);
    num_patches = num_patches(1);

    % Create a cell for metric Gamma
    metric_omega = zeros(num_patches, num_patches);

    for i = 1 : num_patches
        for j = 1 : num_patches
            metric_omega(i, j) = metricOmega(GT_patches{i, j}, ...
                ref_patches{i, j}, ALPHA_0, K);
        end
    end

    % Get average metric gamma value over rows and columns
    mean_metric_omega = mean(metric_omega(:));

    % Return gamma value
    omega_val = mean_metric_omega;

end
