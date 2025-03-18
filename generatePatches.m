function [patches] = generatePatches(I, PATCH_SIZE)
    % Get image dimensions
    [H, W] = size(I);
    im_dims = [H W];

    % Calculate total chunks
    N_chunks = im_dims ./ PATCH_SIZE;
    
    % Get total rows and columns
    rows = PATCH_SIZE * ones(N_chunks(1), 1);
    cols = PATCH_SIZE* ones(N_chunks(2), 1);

    % Return patches
    patches = mat2cell(I, rows, cols);
end