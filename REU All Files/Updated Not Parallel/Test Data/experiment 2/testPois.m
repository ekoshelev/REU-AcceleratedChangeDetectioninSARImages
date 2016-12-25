function [results] = testPois(before,after,network,noise)
    beforeimg = imread(before);
    afterimg = imread(after);
    [ground]=getGroundTruth(beforeimg,afterimg);
    results=[];
    noisybefore=imnoise(beforeimg,noise);
    noisyafter=imnoise(afterimg,noise);
   [resultstemp]=evalArtificialPics(network,noisybefore,noisyafter,ground);
    results=[results; resultstemp];
     
end