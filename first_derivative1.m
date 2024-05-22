clc
close all
clear all
% Read the image
% Read the image
I = imread('cameraman.tif');

% Convert the image to grayscale
%I = rgb2gray(I);

% Calculate the horizontal derivative
Ix = [-1 0 1];
Ix = Ix / 3;
Ix_filtered = conv2(I, Ix, 'same');

% Calculate the vertical derivative
Iy = [-1; 0; 1];
Iy = Iy / 3;
Iy_filtered = conv2(I, Iy, 'same');

% Calculate the magnitude of the gradient
G = sqrt(Ix_filtered.^2 + Iy_filtered.^2);

% Show the original image and the gradient magnitude image
figure;
subplot(1,2,1);
imshow(I);
title('Original image');
subplot(1,2,2);
imshow(G);
title('Gradient magnitude image');