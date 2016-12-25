function [allfeaturestest] = testimgconvert(before,after)
    IM3 = before;
    IM4 = after;
columns = length(IM3);
rows = size(IM3,1);
allfeaturestest=zeros( (rows-5)*(columns-5), 50);
parfor i=1:((rows-5)*(columns-5))
    IM3=before;
    IM4=after;
    if (mod(i,(columns-5))==0)
        x=columns-3;
        y=2+floor(i/(columns-5));
    else
        x=2+mod(i,(columns-5));
        y=3+floor(i/(columns-5));
    end
    section1 = IM3((y-2):(y+2),(x-2):(x+2));     
    section2 = IM4((y-2):(y+2),(x-2):(x+2));
    feature1=reshape(section1',1,[]);
    feature2=reshape(section2',1,[]);
    featurecomp2=cat(2,feature1,feature2);
    allfeaturestest(i,:)=featurecomp2;

end
end