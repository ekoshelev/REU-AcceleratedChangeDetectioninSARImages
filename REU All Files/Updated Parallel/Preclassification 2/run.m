clc;
clear all;
close all;

IM1 = imread('SantaremG.png');
IM2 = imread('Santarem2G.png');

%labels and samples are both matrices of same size as images
%labels: 1 = potential changed, 2 = potential unchanged
%samples: 0 = did not meet ratio requirement, 1 = met ratio requirement
[labels, samples] = preclassify(IM1, IM2);

%show labels, dark is potentially changed
figure(1)
imshow(uint8(labels .* 80))
%show samples, light is good samples
figure(2)
imshow(uint8(samples .* 250))