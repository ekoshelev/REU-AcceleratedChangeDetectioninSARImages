string = 'C:\Users\mmilton1\Downloads\';
files = dir('C:\Users\mmilton1\Downloads\*.png');

for file = files'
    
    path = strcat(string, file.name);
    
    IM = imread(path);
    
    IM = rgb2gray(IM);

    imwrite(IM(:,:,1), path)
    
end