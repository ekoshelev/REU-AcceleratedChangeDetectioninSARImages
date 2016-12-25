results=[];
resultspeck=[];
resultsalt=[];
resultgauss=[];
%Results for normalized images, with increasing intensity.
for i=0:1:10
    network='sarbbdbn100000.mat';
    speckvar=i;
    saltdens=i/10;
    gaussvar=i/10;
    [resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes1b.png','shapes1a.png',network,speckvar,saltdens,gaussvar);
    resultspeck=[resultspeck;resultspecktemp];
    resultsalt=[resultsalt;resultsalttemp];
    resultgauss=[resultgauss;resultgausstemp];
end
