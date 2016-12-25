function [results] = testSAR(Name,Before,After,Ground,upperthresh,bottomthresh)

addpath('..');
%load network
load(Name);
%load images to test here
BeforeImage = imread(Before);
AfterImage = imread(After);

%convert test image to features
%load TestImages.mat;
[allfeaturestest] = testimgconvertnotparallel(BeforeImage,AfterImage);
TestImages=single(allfeaturestest)/255;

out2 = v2h( bbdbn, TestImages );
%To print out the expected labels from the network, uncomment the following.
%fprintf( 'For test data:\n' );
%fprintf('%8.3f\n', [,out2]')


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

GroundTruth = imread(Ground);
GroundTruth=GroundTruth/255;
[h,w]=size(GroundTruth); 
GroundTruth = GroundTruth(3:(h-3),3:(w-3));

figure(4)
imshow(Ground);

[results] = getStats(GroundTruth, PlotChange);
 
%[labels, samples] = preclassify(BeforeImage, AfterImage);
%Display the supposed labels for the image, from preclassification. The
%darker areas indicate areas of change.
% figure(5)
% imshow(uint8(labels .* 80))
end


