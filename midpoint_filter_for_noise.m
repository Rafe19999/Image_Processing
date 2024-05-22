clc;
clear all;
close all;

I = imread('cameraman.tif');

b = imnoise(I, 'gaussian');    % Add Gaussian noise

% Define the 3x3 Midpoint Filter Mask
[m, n] = size(b);
kernel_size = 3;  % Size of the kernel (e.g., 3x3)

% Get the dimensions of the input image
[Mi, Ni] = size(b);
w = ones(3,3);  % 3x3 Box Min Mask
% Get the dimensions of the mask window
[m, n] = size(w);

% Pad the input image
f = padarray(b, [m-1, n-1]);

% Get the dimensions of the padded image
[M, N] = size(f);

% Initialize the output image with the new dimensions
filtered_img = zeros(M, N);

% Calculate starting and ending indices for the mask
sM = (m+1) / 2;
sN = (n+1) / 2;
eM = sM - 1;
eN = sN - 1;

% Apply the Midpoint Filter
for i = sM:M-eM
    for j = sN:N-eN
        % Extract the neighborhood
        neighborhood = f(i-eM:i+eM, j-eN:j+eN);
        
        % Apply midpoint filter to the neighborhood
        filtered_img(i, j) = (max(neighborhood(:)) + min(neighborhood(:))) / 2;
    end
end

% Crop the filtered image to the previous dimensions
filtered_img = filtered_img(m:m+Mi-1, n:n+Ni-1);

subplot(3, 3, 1)
imshow(I)
title('Original Image')

subplot(3, 3, 2)
imshow(b)
title('Noisy Image using Gaussian noise')

subplot(3, 3, 3);
imshow(uint8(filtered_img))
title('After Filtering (Midpoint Filter)');
