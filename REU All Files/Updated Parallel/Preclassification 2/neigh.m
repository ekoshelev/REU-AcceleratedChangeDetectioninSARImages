function [sample] = neigh(in)

IM=in;
IM=double(IM);
[maxX,maxY]=size(IM);

a = 0.6;
n = 5;
r = floor(n / 2); %reach
sample = zeros(maxX, maxY);

for i = 1:maxX
    for j = 1:maxY
        sum = 0;
        
        for dx = -r:r
            for dy = -r:r
                if i + dx > 0 && i + dx <= maxX
                    if j + dy > 0 && j + dy <= maxY
                        if IM(i + dx, j + dy) == IM(i, j)
                            sum = sum + 1;
                        end
                    end
                end
            end
        end
        
        if sum / (n^2) > a
            sample(i, j) = 1;
        end 
        
    end 
end
end
