clc;
clear all;
close all;

IM1 = imread('RiverB.png');
IM2 = imread('RiverA.png');

[maxX, maxY] = size(IM1);

[label,sample] = preclassify(IM1, IM2);