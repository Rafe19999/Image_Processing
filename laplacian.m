clc;
clear all;
close all;

img=imread("cameraman.tif");
[r,c]=size(img);
img=im2double(img);

for i=1:r-2
    for j=1:c-2
        musk=[0,1,0,1,-4,1,0,1,0];
        p=1;
        sum=0;
        for k=i:i+2
            for l=j:j+2
                sum=sum+img(k,l)*musk(p);
                p=p+1;
            end
        end
        img2(i,j)=sum;
    end
end
imshow(img2);
    
