%To train a network, the format is as follows:
%trainSAR(Size of Training Set,Structure of Training Set,Batch Size,Iterations,Name of Network,Name of Saved Features,Name of Saved Labels);
%Lists of saved features and labels can be found in the folder training
%data, along with a read me file describing them. Here is an example of how
%this code would be run:
trainSAR(100000,[50 250 200 100 1],100,50,'originalnetwork.mat','trainimages.mat','trainlabels.mat');

%Below is an example of how I train a full set of networks:
    % trainSAR(10000,[50 250 200 100 1],10,50,'10batch20sarbdbn10000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(20000,[50 250 200 100 1],10,50,'10batch20sarbdbn20000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(30000,[50 250 200 100 1],10,50,'10batch20sarbdbn30000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(40000,[50 250 200 100 1],10,50,'10batch20sarbdbn40000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(50000,[50 250 200 100 1],10,50,'10batch20sarbdbn50000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(60000,[50 250 200 100 1],10,50,'10batch20sarbdbn60000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(70000,[50 250 200 100 1],10,50,'10batch20sarbdbn70000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(80000,[50 250 200 100 1],10,50,'10batch20sarbdbn80000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(90000,[50 250 200 100 1],10,50,'10batch20sarbdbn90000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(100000,[50 250 200 100 1],10,50,'10batch20sarbdbn100000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(110000,[50 250 200 100 1],10,50,'10batch20sarbdbn110000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(120000,[50 250 200 100 1],10,50,'10batch20sarbdbn120000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(130000,[50 250 200 100 1],10,50,'10batch20sarbdbn130000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(140000,[50 250 200 100 1],10,50,'10batch20sarbdbn140000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(150000,[50 250 200 100 1],10,50,'10batch20sarbdbn150000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(160000,[50 250 200 100 1],10,50,'10batch20sarbdbn160000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(170000,[50 250 200 100 1],10,50,'10batch20sarbdbn170000.mat','20trainimages.mat','20trainlabels.mat');
    % trainSAR(180000,[50 250 200 100 1],10,50,'10batch20sarbdbn180000.mat','20trainimages.mat','20trainlabels.mat');
    
