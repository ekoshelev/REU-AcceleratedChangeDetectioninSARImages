results=[];
results2=[];
results3=[];
%Results for each type of noise, with increasing intensity.
for i=0:1:10
    [resultstemp] = testIntensity('shapes1b.png','shapes1a.png','sarbbdbn100000.mat', 'speckle', i);
    results=[results;resultstemp];
    
    [resultstemp2] = testIntensity('shapes1b.png','shapes1a.png','sarbbdbn100000.mat', 'salt & pepper', i/10);
    results2=[results;resultstemp2];
    
    [resultstemp3] = testIntensity('shapes1b.png','shapes1a.png','sarbbdbn100000.mat', 'gaussian', i/10);
    results3=[results;resultstemp3];
end

