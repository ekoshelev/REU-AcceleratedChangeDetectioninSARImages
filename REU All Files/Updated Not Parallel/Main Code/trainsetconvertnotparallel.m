function [allfeatures, alllabels] = trainsetconvertnotparallel(set,setnumber)
allfeatures1=[];
alllabels1=[];
for i = 1:1:setnumber
    if i==1
    [allfeaturestemp, alllabelstemp] = trainimgconvertnotparallel(set(1:300,1:600),set(1:300,601:1200));
    else
    [allfeaturestemp, alllabelstemp] = trainimgconvertnotparallel(set((i-1)*300:i*300,1:600),set((i-1)*300:i*300,601:1200));
    end
    allfeatures1=cat(1,allfeatures1,allfeaturestemp);
    alllabels1=cat(1,alllabels1,alllabelstemp);
end
allfeatures=allfeatures1;
alllabels=alllabels1;