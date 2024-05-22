clc;
clear all;
close all;
row = 2;
col = 2;
img = imread('cameraman.tif');

% Define the 3x3 Box Min Mask
w = ones(3,3);  % 3x3 Box Min Mask

% Get the dimensions of the input image
[Mi, Ni] = size(img);

% Get the dimensions of the mask window
[m, n] = size(w);

% Pad the input image
f = padarray(img, [m-1, n-1]);

% Get the dimensions of the padded image
[M, N] = size(f);

% Initialize the output image with the new dimensions
filtered_img = zeros(M, N);

% Calculate starting and ending indices for the mask
sM = (m+1) / 2;
sN = (n+1) / 2;
eM = sM - 1;
eN = sN - 1;

% Convert the weight matrix to a weight vector
w = w';
w1 = w(:);
[r, c] = size(w1);

% Apply the Box Min filter
for i = sM:M-eM
    for j = sN:N-eN
        array = zeros(r, c);
        iw = 1;
        for ii = i-eM:i+eM
            for jj = j-eN:j+eN
                array(iw) = w1(iw) * f(ii, jj);
                iw = iw + 1;
            end
        end
        filtered_img(i, j) = floor(min(array));  % Use 'floor' for the minimum value
    end
end

% Crop the filtered image to the previous dimensions
filtered_img = filtered_img(m:m+Mi-1, n:n+Ni-1);

% Display the images in subplots
subplot(row, col, 1);
imshow(img);
title('Before Filtering');

subplot(row, col, 2);
imshow(uint8(filtered_img))
title('After Filtering (Min Filter)');
