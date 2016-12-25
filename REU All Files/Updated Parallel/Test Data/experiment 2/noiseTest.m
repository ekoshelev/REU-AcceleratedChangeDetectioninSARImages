%Results for each set of images with different types of noise-
%Results= speckle noise of 1, Results2=salt&pepper noise, Results3=
%Gaussian noise
%Speckle:
speckvar=.5;
saltdens=.2;
gaussvar=.1;
network='sarbbdbn100000.mat';

resultspeck=[];
resultsalt=[];
resultgauss=[];
resultpois=[];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes1b.png','shapes1a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes2b.png','shapes2a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes3b.png','shapes3a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes4b.png','shapes4a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes5b.png','shapes5a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes6b.png','shapes6a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes7b.png','shapes7a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes8b.png','shapes8a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];

[resultspecktemp,resultsalttemp,resultgausstemp,resultpoistemp] = testSet('shapes9b.png','shapes9a.png',network,speckvar,saltdens,gaussvar);
resultspeck=[resultspeck;resultspecktemp];
resultsalt=[resultsalt;resultsalttemp];
resultgauss=[resultgauss;resultgausstemp];
resultpois=[resultpois;resultpoistemp];
