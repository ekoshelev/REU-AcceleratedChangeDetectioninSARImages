function [results] = evalArtificialPics(Name,BeforeImage,AfterImage,Ground)

addpath('..');

load(Name);
%load images to test here
% BeforeImage = imread(Before);
% AfterImage = imread(After);

%convert test image to features
%load TestImages.mat;
[allfeaturestest] = testimgconvert(BeforeImage,AfterImage);
TestImages=single(allfeaturestest)/255;

%To compare the preclassification labels and expected network labels,
%uncomment the following. This is to analyze the training of the network.
% rmse= CalcRmse(bbdbn, TrainImages, TrainLabels);
% ErrorRate= CalcErrorRate(bbdbn, TrainImages, TrainLabels);
% fprintf( 'For training data:\n' );
% fprintf( 'rmse: %g\n', rmse );
% fprintf( 'ErrorRate: %g\n', ErrorRate );
% out = v2h( bbdbn, TrainImages );
% fprintf('%8.2f %8.3f\n', [TrainLabels,out]')

out2 = v2h( bbdbn, TestImages );
%To print out the expected labels from the network, uncomment the following.
%fprintf( 'For test data:\n' );
%fprintf('%8.3f\n', [,out2]')
bottomthresh = min(out2) + .2;
upperthresh = max(out2) - .005;
if bottomthresh>.8
    bottomthresh=.8;
end
if upperthresh<.98
    upperthresh=.98;
end
columns = length(BeforeImage);
rows = size(BeforeImage,1);
PlotChange = zeros((rows-5),(columns-5));
Change = zeros((rows-5),(columns-5));
count=1;
for i=1:1:rows-5
    for j=1:1:columns-5
            if out2(count)>=upperthresh || out2(count)<=bottomthresh
             Change(i,j)=out2(count);
           PlotChange(i,j)=1;
            else
               Change(i,j)=out2(count);
                PlotChange(i,j)=0;
        
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
figure(3)
imshow(Change);
%[labels, samples] = preclassify(BeforeImage, AfterImage);
%Display the supposed labels for the image, from preclassification. The
%darker areas indicate areas of change.
% figure(3)
% imshow(uint8(labels .* 80))
  GroundTruth = Ground;
 GroundTruth = GroundTruth(3:297,3:597);
 figure(4)
imshow(Ground);
 [results] = getStats(GroundTruth, PlotChange);

end

