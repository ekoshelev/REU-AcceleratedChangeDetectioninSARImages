function trainSAR(TrainNum,nodes,batch,iter,Name, features, labels)
    addpath('..');

    load(features);
    load(labels);

    TrainImages = TrainImages(1:TrainNum,:);
    TrainLabels = TrainLabels(1:TrainNum,:);

    %Set up structure 
    bbdbn = randDBN( nodes, 'bbdbn' );
    nrbm = numel(bbdbn.rbm);

    %iterations done for each layer
    opts.MaxIter = iter;
    %according to RBM paper, if batch size is extremely large, use a subset:
    opts.BatchSize = batch;
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
    save(Name, 'bbdbn' );
    clear all;
end




