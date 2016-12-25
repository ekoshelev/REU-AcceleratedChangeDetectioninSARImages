string1 = 'C:\Users\Elizabeth\Desktop\Updated Parallel\Test Data\shapes'; %folder the images are in
string2 = 'C:\Users\Elizabeth\Desktop\Updated Parallel\Test Data\shapesnoise'; %folder to put the noisy images in
files = dir('C:\Users\Elizabeth\Desktop\Updated Parallel\Test Data\shapes'); %folder the images are in

variance= 0.07;

for file = files'
    
    path1 = strcat(string1, file.name);
    path2  = strcat(string2, file.name);
    
    IM1 = imread(path1);
    
    IM2 = im2double(IM1);
    IM2 = imnoise(I,'salt & pepper',0.02);
    figure, imshow(IM1)
    figure, imshow(IM2)

    imwrite(IM2(:,:,1), path2)
    
end