% Read image
I = imread("kodim19.png");
I_sharpened = imsharpen(I, "Amount",1.2);

% Set parameters
ALPHA_0 = 0.8;
K = 2.0;
PATCH_SIZE = 16;

% Calculate Omega Value
omega_val = patchBasedOmega(I, I_sharpened, PATCH_SIZE, ALPHA_0, K);
