%to make every nth label changed, adjust the diversity. an example is for a
%diversity of 2, the labels become 1 0 1 0 1 0 ect.
diversity=2;
[C,UC] = stats(largetrainlab);
unchanged = zeros(UC,50);
changed = zeros(C,50);
countme=0;
countme2=0;
%create two arrays of changed features, and unchanged features
for x= 1:size(largetrainlab)
    if largetrainlab(x)==1
        countme=countme+1;
        unchanged(countme,:)= largetrain(x,:);
    else
        countme2=countme2+1;
        changed(countme2,:)=largetrain(x,:);
    end
end
newfeatures= zeros(diversity*C,50);
newlabels= zeros(diversity*C, 1);
count1=0;
count2=0;
for y = 1:diversity*C
    if mod(y,diversity)==0
    count1=count1+1;
    newfeatures(y,:) = changed(count1,:);
    newlabels(y,:)= 0;
    else
    count2=count2+1;
    newfeatures(y,:) = unchanged(count2,:);
    newlabels(y,:)= 1;
    end
end

    