function [allfeaturestest] = testimgconvertnotparallel(before,after)
IM3 = before;
IM4= after;
columns = length(IM3);
rows = size(IM3,1);
feature1= zeros(1,25);
feature2= zeros(1,25);
featurecomp2=[];
allfeaturestest=[];
for i=3:1:rows-3
    for j=3:1:columns-3
            count=0;
            %fprintf('( %.0f , %.0f ) \n', i,j);
            for k=1:1:5
                for l=1:1:5
                   count= count+1;
                   feature1(count)=IM3(i-3+k,j-3+l);
                   feature2(count)=IM4(i-3+k,j-3+l);
                end
            end
            featurecomp2=cat(2,feature1,feature2);
            allfeaturestest=cat(1,allfeaturestest,featurecomp2);
           
    end
end