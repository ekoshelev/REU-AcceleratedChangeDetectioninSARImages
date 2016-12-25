%returns results for putting two images through a network with increasing
%noise
%levels increasing from 0 to 10 by steps of 1
%testNoise(before image,after image,network,'speckle',iterations,limit on variance);
iter=.5;
limit=10;
[results1] = testNoise('shapes1b.png','shapes1a.png','sarbbdbn100000.mat','speckle',iter,limit);
[results2] = testNoise('shapes2b.png','shapes2a.png','sarbbdbn100000.mat','speckle',iter,limit);
[results3] = testNoise('shapes3b.png','shapes3a.png','sarbbdbn100000.mat','speckle',iter,limit);
[results4] = testNoise('shapes4b.png','shapes4a.png','sarbbdbn100000.mat','speckle',iter,limit);
[results5] = testNoise('shapes5b.png','shapes5a.png','sarbbdbn100000.mat','speckle',iter,limit);
[results6] = testNoise('shapes6b.png','shapes6a.png','sarbbdbn100000.mat','speckle',iter,limit);
[results7] = testNoise('shapes7b.png','shapes7a.png','sarbbdbn100000.mat','speckle',iter,limit);
[results8] = testNoise('shapes8a.png','shapes8b.png','sarbbdbn100000.mat','speckle',iter,limit);
[results9] = testNoise('shapes9b.png','shapes9a.png','sarbbdbn100000.mat','speckle',iter,limit);

