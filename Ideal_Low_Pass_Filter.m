clc; clear; close all;
row = 2; 
col = 2;

img = imread('cameraman.tif');

subplot(row,col,1);
imshow(img);
title('Before Filtering');

[M,N] = size(img);

% Performing FFT to Input Iamge
f_img = fftshift(fft2(img));
%f_img1 = log(1+abs(f_img));
%f_img2 = mat2gray(f_img1);

% Creating ILPF with C0 = Cut Off Frequency
C0=60;
[u,v] = meshgrid(-floor(M/2):floor(M-1)/2, -floor(N/2):floor(N-1)/2); % Image Size Must be in Even Numbers (M & N are Even)
z = sqrt(u.^2 + v.^2); % Equation of Circle
ideal_filter = z<C0;  % Thresholding to Generate B/W Image for Creating Filter Function
%ideal_filter = z>C0; % High Pass

% Performing Filtering in Frequency Domain
output_img = f_img .* ideal_filter; % Convolution in Spatial Domain = Multiplication in Frequency Domain
output_img1 = ifft2(output_img);
output_img2 = mat2gray(abs(output_img1));

subplot(row,col,2);
imshow(ideal_filter);
title('Radius');

subplot(row,col,3);
imshow(output_img2);
title('After Filtering');
