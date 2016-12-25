clear all;
addpath('..');

load('convertimages.mat','TrainImages','TrainLabels');
%choose number of training and testing images, the samples with most
%variety of 0s and 1s for labels are more effective
TrainNum=100000;
TrainImages = TrainImages(1:TrainNum,:);
TrainLabels = TrainLabels(1:TrainNum,:);
% 

%first layer= size of feature vector
%last layer = number of label nodes (i.e. 1 or 0, 1 for our )
nodes = [50 250 200 100 1];  
bbdbn = randDBN( nodes, 'BBDBN' );
nrbm = numel(bbdbn.rbm);

%iterations done for each layer
opts.MaxIter = 50;
%according to RBM paper, if batch size is extremely large, use a subset:
opts.BatchSize = 100;
%print statistics
opts.Verbose = true;
%learning rate change
opts.StepRatio = 0.1;
opts.object = 'CrossEntropy';
%layers not including final
opts.Layer = nrbm-1;
%pretrain to learn features
bbdbn = pretrainDBN(bbdbn, TrainImages, opts);
%map to final layer
bbdbn= SetLinearMapping(bbdbn, TrainImages, TrainLabels);

opts.Layer = 0;
bbdbn = trainDBN(bbdbn, TrainImages, TrainLabels, opts);

save('sarbbdbn.mat', 'bbdbn' );




