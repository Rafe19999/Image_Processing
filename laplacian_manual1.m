% Spatial Filtering Page-156 Low Pass Filter
% Non Linear(Order Statistic) Smoothing Filter- (Median, Max, Min)
clc;
clear all;
close all;
I = imread("images/moon.jpg");
 img = rgb2gray(I);


w=[ 0,1,0; 1,-4,1;0,1,0 ];                    % 3*3 Box Median/Max/Min Mask

[Mi,Ni] = size(img); % Input Image's Dimension
[m,n] = size(w);         % Mask Window's Dimension

f = padarray(img,[m-1 n-1]); % Padding the input image by m-1 & n-1 dimension
[M,N] = size(f);                   % Padded Image's Dimension
filtered_img = zeros(M,N);         % Output Image with New Dimension

sM = (m+1)/2;  % Starting Index of Mask 
sN = (n+1)/2;

eM = sM-1;     % Ending Index of Mask  E
eN = sN-1;

w = w';        % Converting Weight Matrix to Weight Vector
w1 = w(:);     % w1 is the weight vector
[r,c] = size(w1);
for i = sM:M-eM
    for j = sN:N-eN
        array = zeros(r,c);
        iw=1;
        for ii = i-eM:i+eM  
            for jj = j-eN:j+eN
                array(iw) = w1(iw)*f(ii,jj);
                iw = iw+1;
            end
        end
        
       
         % ceil lagbe jodi kono fied value dorkar 
        filtered_img3(i,j) = sum(array);  % mean sob gula jog kore 9 diye vag kore jeta asbe seta show korbe
    end
end

filtered_img3 = filtered_img3(m:m+Mi-1,n:n+Ni-1);



subplot(2,2,1);
imshow(img);
title('Before Filtering');


subplot(2,2,2);
imshow(uint8(filtered_img3))
title('weight');














