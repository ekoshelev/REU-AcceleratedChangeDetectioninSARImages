%string = 'P:\REU\MATLAB\PUP Images Gray';
%before = imread(strcat(string, '\puppyTestA.png'));
%after = imread(strcat(string, '\puppyTestB.png'));
function [groundTruth] = getGroundTruth(before,after)

before = double(before) / 255;
after = double(after) / 255;

[h,w] = size(before);
groundTruth = zeros(h,w);

for x = 1:h*w
   if (before(x)<after(x)) || (before(x)>after(x))
       groundTruth(x) = 1;
   end
end

end