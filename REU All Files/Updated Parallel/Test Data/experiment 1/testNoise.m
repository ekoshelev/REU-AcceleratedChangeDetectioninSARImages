function [results] = testNoise(before,after,network,noise,step,limit)
    beforeimg = imread(before);
    afterimg = imread(after);
    [ground]=getGroundTruth(beforeimg,afterimg);
    results=[];
     for i= 0:step:limit
        noisybefore=imnoise(beforeimg,noise,i);
        noisyafter=imnoise(afterimg,noise,i);
        [resultstemp]=evalArtificialPics(network,noisybefore,noisyafter,ground);
        results=[results;i resultstemp];
     end
end