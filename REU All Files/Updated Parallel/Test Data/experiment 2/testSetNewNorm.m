function [resultspeck,resultsalt,resultgauss,resultpois] = testSetNewNorm(before,after,network,speck,salt, gaus)
    beforeimg = imread(before);
    afterimg = imread(after);
    [ground]=getGroundTruth(beforeimg,afterimg);
    
    [speckleb,saltb,gaussb,poissonb]=normalizeImageNewNorm(beforeimg,speck,salt,gaus);
    [specklea,salta,gaussa,poissona]=normalizeImageNewNorm(afterimg,speck,salt,gaus);
    
    
    [resultspeck]=evalArtificialPics(network,speckleb,specklea,ground);

    [resultsalt]=evalArtificialPics(network,saltb,salta,ground);
 
    [resultgauss]=evalArtificialPics(network,gaussb,gaussa,ground);

    [resultpois]=evalArtificialPics(network,poissonb,poissona,ground);

end