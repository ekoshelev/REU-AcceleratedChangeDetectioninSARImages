function [results] = evalSAR(Name)

addpath('..');

load(Name);
%load images to test here
BeforeImage = imread('Before.png');
AfterImage = imread('After.png');

%convert test image to features
load santaremgroundtruthtest.mat;
% [allfeaturestest] = testimgconvert(BeforeImage,AfterImage);
% TestImages=single(allfeaturestest)/255;

%To compare the preclassification labels and expected network labels,
%uncomment the following. This is to analyze the training of the network.
% rmse= CalcRmse(gbdbn, TrainImages, TrainLabels);
% ErrorRate= CalcErrorRate(gbdbn, TrainImages, TrainLabels);
% fprintf( 'For training data:\n' );
% fprintf( 'rmse: %g\n', rmse );
% fprintf( 'ErrorRate: %g\n', ErrorRate );
% out = v2h( gbdbn, TrainImages );
% fprintf('%8.2f %8.3f\n', [TrainLabels,out]')

out2 = v2h( gbdbn, TestImages );
%To print out the expected labels from the network, uncomment the following.
%fprintf( 'For test data:\n' );
%fprintf('%8.3f\n', [,out2]')

columns = length(BeforeImage);
rows = size(BeforeImage,1);
PlotChange = zeros((rows-5),(columns-5));
count=1;
for i=1:1:rows-5
    for j=1:1:columns-5
            if out2(count)>=.5
           PlotChange(i,j)=0;
            else
                PlotChange(i,j)=1;
        
            end
                count= count+1;
            end
end
figure(1)
%Display the before and after image, side by side.
subplot(1,2,1), imshow(BeforeImage)
subplot(1,2,2), imshow(AfterImage)
%Display the change detection map.
figure(2)
imshow(PlotChange);

%[labels, samples] = preclassify(BeforeImage, AfterImage);
%Display the supposed labels for the image, from preclassification. The
%darker areas indicate areas of change.
%figure(3)
%imshow(uint8(labels .* 80))
 GroundTruth = imread('Change.png')/255;
 GroundTruth = GroundTruth(3:297,3:597);
 figure(3)
imshow('Change.png');
 [results] = getStats(GroundTruth, PlotChange);



