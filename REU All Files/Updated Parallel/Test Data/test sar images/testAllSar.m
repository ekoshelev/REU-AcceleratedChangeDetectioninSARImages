%The format is as follows: 
%testSAR(network,before image,after image,ground truth,upper threshold,lower threshold);
%Figure 1 is the before and after image, side by side. Figure 2 is the
%change detection map based on the thresholds. Figure 3 is the actual
%output of the network. Figure 4 is the ground truth map.
testSAR('sarbbdbn100000.mat','3santb.png','3santa.png','santaremgroundtruth.png',.999,.15);
testSAR('sarbbdbn100000.mat','Before.png','After.png','Change.png',.99995,.15);
testSAR('sarbbdbn100000.mat','puppyTestA.png','puppyTestB.png','groundTruth.png',.99995,.15);
testSAR('sarbbdbn100000.mat','smaller1.png','smaller2.png','smallerChange.png',.995,.01);
testSAR('sarbbdbn100000.mat','Test Before.png','Test After.png','Test Change.png',.999,.01);