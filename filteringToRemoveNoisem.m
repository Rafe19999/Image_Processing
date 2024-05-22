clc; clear all;close all;

I= imread('cameraman.tif');


b=imnoise(I,'gaussian');    %add gaussian noise

%b1=imnoise(I,'salt & pepper',0.02);   %add salt & pepper noise

% Define the 3x3 Mean Filter Mask
[m, n] = size(b);
kernel_size = 3;  % Size of the kernel (e.g., 3x3)

% Create the mean filter mask
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

% Convert the weight matrix to a weight vector
w = w';
w1 = w(:);
[r, c] = size(w1);

% Apply the Mean Filter
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
        filtered_img(i, j) = sum(array);  % Use 'sum' for the average value
    end
end

% Crop the filtered image to the previous dimensions
filtered_img = filtered_img(m:m+Mi-1, n:n+Ni-1);


subplot(3,3,1)
imshow(I)
title('Original Image')


subplot(3,3,2)
imshow(b)
title('Noisy Image using gaussian noise')

subplot(3, 3, 3);
imshow(uint8(filtered_img))
title('After Filtering (Arithmetic Mean Filter)');

