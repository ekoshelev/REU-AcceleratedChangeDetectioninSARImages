function [results] = testIntensity(before,after,network,noise,intensity)
    beforeimg = imread(before);
    afterimg = imread(after);
    [ground]=getGroundTruth(beforeimg,afterimg);
    results=[];
    noisybefore=imnoise(beforeimg,noise,intensity);
    noisyafter=imnoise(afterimg,noise,intensity);
    [resultstemp]=evalArtificialPics(network,noisybefore,noisyafter,ground);
    results=[results; resultstemp];
     
end