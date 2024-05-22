clc;
clear all;
close all;

% Read the image
Img = imread("images/Tulips.jpg");

% Separate the RGB channels
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

% Define filter parameters
D0 = 30;
n = 2;


% Display the original image before filtering
subplot(3,3,1)
imshow(Img)
title("Original Image");

% Display individual channels before filtering
subplot(3,3,2)
imshow(R);
title("R before filtering")

subplot(3,3,3)
imshow(G);
title("G before filtering")

subplot(3,3,4)
imshow(B);
title("B before filtering")


% Merge the channels back into a color image before filtering
mergedImageBeforeFiltering = cat(3, R, G, B);

subplot(3,3,5)
imshow(mergedImageBeforeFiltering);
title("Merged Image before filtering");

% Apply the filter to each channel separately
filteredR = applyFilter(R, D0, n);
filteredG = applyFilter(G, D0, n);
filteredB = applyFilter(B, D0, n);

subplot(3,3,6)
imshow(filteredR);
title("R after filtering");

subplot(3,3,7)
imshow(filteredG);
title("G after filtering");

subplot(3,3,8)
imshow(filteredB);
title("G after filtering");

% Merge the filtered channels back into a color image
mergedImageAfterFiltering = cat(3, filteredR, filteredG, filteredB);

% Display the merged image after filtering
subplot(3,3,9)
imshow(mergedImageAfterFiltering);
title("Merged Image after filtering");

function filteredChannel = applyFilter(channel, D0, n)
    % Performing FFT to Input Channel
    f_channel = fftshift(fft2(double(channel)));

    % Creating Butterworth LPF with D0 = Cut Off Frequency
    [M, N] = size(channel);
    [u, v] = meshgrid(-floor(N/2):floor(N-1)/2, -floor(M/2):floor(M-1)/2);
    z = sqrt(u.^2 + v.^2); % Distance from the center

    butterworth_filter = 1 ./ (1 + (D0 ./ z).^(2 * n)); %Butterworth High Pass Filter
    butterworth_filter = padarray(butterworth_filter, [floor((M-size(butterworth_filter,1))/2) floor((N-size(butterworth_filter,2))/2)], 0, 'both');

    % Performing Filtering in Frequency Domain
    output_channel = f_channel .* butterworth_filter;
    output_channel = ifft2(ifftshift(output_channel));
    filteredChannel = mat2gray(abs(output_channel));
end
