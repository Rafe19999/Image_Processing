%Histogram calculation
clc;
clear all;
close all;

img=imread("cameraman.tif");



% Default operantion H=imhist(img);
for i=1:256
   a(i)=0
end
for b=1:256
    for c=1:256
        for d=1:256
            if img(c,d)==b;
                a(b)=a(b)+1;
            end
           
        end
    end
end

bar(a(1,:));                      % It is used to show the graph

S=sum(a);      % use to sum all the pixels
D=a/65536;

Mul=a*2;



 