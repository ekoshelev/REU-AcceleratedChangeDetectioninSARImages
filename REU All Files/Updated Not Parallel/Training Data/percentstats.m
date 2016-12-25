function [percent] = percentstats(TrainLabels)
UC=0;
C=0;
for x = 1:size(TrainLabels)
    if TrainLabels(x)==1
        UC=UC+1;
    else
        C=C+1;
    end
    percent = 100* C  /(UC + C) ;
    
end
fprintf('Unchanged: %f Changed: %f Percent Changed: %f', UC, C, percent);
end