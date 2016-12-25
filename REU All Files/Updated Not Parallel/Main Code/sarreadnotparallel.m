
% load('trainimages.mat');
% load('trainlabels.mat');
%uncomment the following to run the full program to get the labels and
%features
IM1 = imread('SantaremG.png');
IM2 = imread('Santarem2G.png');
IM3 = imread('harvforest1b.png');
IM4 = imread('harvforest1a.png');
IM5 = imread('harvforest2b.png');
IM6 = imread('harvforest2a.png');
IM7 = imread('kulub.png');
IM8 = imread('kulua.png');
IM9 = imread('kulu2b.png');
IM10 = imread('kulu2a.png');
IM11 = imread('niwotb.png');
IM12 = imread('niwota.png');
IM13 = imread('siouxb.png');
IM14 = imread('siouxa.png');
IM15 = imread('sant2b.png');
IM16 = imread('sant2a.png');
IM17 = imread('niwot2b.png');
IM18 = imread('niwot2a.png');
IM19 = imread('harvforest3b.png');
IM20 = imread('harvforest3a.png');
%put them into an array, as of now it works only for images of size 300x600
set=[IM1,IM2;IM3,IM4;IM5,IM6;IM7,IM8;IM9,IM10;IM11,IM12;IM13,IM14;IM15,IM16;IM17,IM18;IM19,IM20];
%call trainsetconvert to variables allfeatures and alllabels, in the form
%[allfeatures, alllabels] = trainsetconvertnotparallel(set,number of sets);
[allfeatures, alllabels] = trainsetconvertnotparallel(set,10);
TrainImages=single(allfeatures)/255;
TrainLabels=single(alllabels);

save('convertimages.mat','TrainImages','TrainLabels');
