clc;
clear all;
close all;

I = imread('cameraman.tif');

b = imnoise(I, 'gaussian');    % Add Gaussian noise

% Define the 3x3 Harmonic Mean Filter Mask
[m, n] = size(b);
kernel_size = 3;  % Size of the kernel (e.g., 3x3)

% Create the harmonic mean filter mask
w = ones(kernel_size) / (kernel_size * kernel_size);

% Get the dimensions of the input image
[Mi, Ni] = size(b);

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

% Apply the Harmonic Mean Filter
% Apply the Contraharmonic Mean Filter
for i = sM:M-eM
    for j = sN:N-eN
        upper = 0;
        lower = 0;
        Q=1.5;
        for ii = i-eM:i+eM
            for jj = j-eN:j+eN
                pixel_value = double(f(ii, jj));
                upper = upper + pixel_value^(Q + 1);
                lower = lower + pixel_value^Q;
            end
        end
       
            filtered_img(i, j) = upper / lower;
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
title('After Filtering (Harmonic Mean Filter)');
