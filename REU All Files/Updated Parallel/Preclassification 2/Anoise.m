clc;
clear all;
close all;

IM1 = imread('lena.jpg');
IM2 = IM1;

[maxX, maxY] = size(IM1);

for i = 1:maxX
    for j = 1:maxY
        IM2(i, j) = IM2(i, j) + randi([0,100]);
        
        if IM2(i, j) > 255
            IM2(i, j) = 255;
            
        end
    end
end

imwrite(IM2, 'lenoise.png');