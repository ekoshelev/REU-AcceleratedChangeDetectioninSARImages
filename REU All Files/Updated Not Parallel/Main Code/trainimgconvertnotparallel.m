function [allfeaturesna, alllabelsna] = trainimgconvertnotparallel(before,after)
IM1=before;
IM2=after;
%labels and samples are both matrices of same size as images
%labels: 1 = potential changed, 2 = potential unchanged
%samples: 0 = did not meet ratio requirement, 1 = met ratio requirement
[labels, samples] = preclassify(IM1, IM2);

columns = length(IM1);
rows = size(IM1,1);
feature1 = zeros(1,25);
feature2= zeros(1,25);
allfeaturesna=[];
alllabelsna=[];
for i=3:1:rows-3
    for j=3:1:columns-3
        if samples(i,j)==1 % if the sample is good
            count=0;
            for k=1:1:5
                for l=1:1:5
                   count= count+1;
                   feature1(count)=IM1(i-3+k,j-3+l);
                   feature2(count)=IM2(i-3+k,j-3+l);
                end
            end
            featurecomp=cat(2,feature1,feature2);
            allfeaturesna=cat(1,allfeaturesna,featurecomp);
            alllabelsna=cat(1,alllabelsna,labels(i,j)-1);
        end
    end
end
