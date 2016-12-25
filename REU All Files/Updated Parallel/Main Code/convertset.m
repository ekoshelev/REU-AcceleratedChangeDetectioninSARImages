function [allfeatures, alllabels] = convertset(set,setnumber)
allfeatures1=[];
alllabels1=[];
for j = 1:1:setnumber
    IM1=set((j-1)*300+1:j*300,1:600);
    IM2=set((j-1)*300+1:j*300,601:1200);
    [labels, samples] = preclassify(IM1, IM2);
    columns = length(IM2);
    rows = size(IM2,1);
    count=0;
    samplesize=0;
    for m=3:1:rows-3
        for n=3:1:columns-3
            if samples(m,n) == 1
                    samplesize=samplesize+1;

            end
        end
    end
    allfeaturestemp= zeros(samplesize,50);
    alllabelstemp= zeros(samplesize,1);
    [allfeaturestempp, alllabelstempp] = converttrain(IM1,IM2,labels);
 for i=1:((rows-5)*(columns-5))
    if (mod(i,(columns-5))==0)
        x=columns-3;
        y=2+floor(i/(columns-5));
    else
        x=2+mod(i,(columns-5));
        y=3+floor(i/(columns-5));
    end
            if samples(y,x)==1
                count=count+1;
            allfeaturestemp(count,:)=allfeaturestempp(i,:);
            alllabelstemp(count,:)=alllabelstempp(i,:);
            end
 end
    allfeatures1=cat(1,allfeatures1,allfeaturestemp);
    alllabels1=cat(1,alllabels1,alllabelstemp);
end
allfeatures=allfeatures1;
alllabels=alllabels1;
end