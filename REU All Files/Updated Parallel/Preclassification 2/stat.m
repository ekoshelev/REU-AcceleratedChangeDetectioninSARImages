clc;
clear all;
close all;

in1 = imread('RiverB.png');
in2 = imread('RiverA.png');

[labels, sample] = preclassify(in1, in2);

IM1 = labels .* 66;

[maxX, maxY] = size(IM1);
[labelK, cc] = kmeans(IM1, 2);
[labelO, sep] = otsu(IM1);
[labelF, cc1, cc2] = FCM(IM1);

%comment the following section if you don't want to see stuff
KModel = labelK;
OModel = labelO;
FModel = labelF;

maxG = 255;
minG = 0;

for i = 1:maxX
    for j = 1:maxY
        if labelK(i, j) == 2
            Kmodel(i, j) = maxG;
        else
            Kmodel(i, j) = minG;
        end
        
        if labelF(i, j) == 2
            Fmodel(i, j) = maxG;
        else
            Fmodel(i, j) = minG;
        end
        
        if labelO(i, j) == 2
            Omodel(i, j) = maxG;
        else
            Omodel(i, j) = minG;
        end
    end
end

figure(1)
imshow(uint8(Omodel));
figure(2)
imshow(uint8(Fmodel));
figure(3)
imshow(uint8(Kmodel));