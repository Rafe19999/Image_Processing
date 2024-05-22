clc; 
clear; 
close all;
row = 2; 
col = 2;
img = imread('cameraman.tif');

subplot(row, col, 1);
imshow(img);
title('Before Filtering');


[M, N] = size(img);

% Performing FFT to Input Image
f_img = fftshift(fft2(img));

% Creating Butterworth LPF with D0 = Cut Off Frequency
D0 = 60;
n = 2; % Order of the filter

[u, v] = meshgrid(-floor(M/2):floor(M-1)/2, -floor(N/2):floor(N-1)/2); % Image Size Must be in Even Numbers (M & N are Even)
z = sqrt(u.^2 + v.^2); % Distance from the center

butterworth_filter = 1 ./ (1 + (z ./ D0).^(2 * n)); %ButterWorth Low pass filter
%butterworth_filter = 1 ./ (1 + (D0 ./ z).^(2 * n)); % Butterworth High pass filter
% Performing Filtering in Frequency Domain
output_img = f_img .* butterworth_filter; % Convolution in Spatial Domain = Multiplication in Frequency Domain
output_img1 = ifft2(output_img);
output_img2 = mat2gray(abs(output_img1));

subplot(row, col, 2);
imshow(butterworth_filter);
title('Butterworth Filter');

subplot(row, col, 3);
imshow(output_img2);
title('After Filtering');