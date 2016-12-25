clear all;

num = 1000;
nodes = [32 16 8 4];

IN = rand(num,32);
OUT = rand(num,4);

dnn = randDBN( nodes );
%dnn = randDBN( nodes, 'BBPDBN' ); % ICPR 2014
%dnn = randDBN( nodes, 'GBDBN' );
nrbm = numel(dnn.rbm);

opts.MaxIter = 20;
opts.BatchSize = num/4;
opts.Verbose = true;
opts.StepRatio = 0.1;
opts.Layer = nrbm-1;
opts.DropOutRate = 0.5;
opts.Object = 'CrossEntropy';

dnn = pretrainDBN(dnn, IN, opts);
dnn= SetLinearMapping(dnn, IN, OUT);

opts.Layer = 0;
dnn = trainDBN(dnn, IN, OUT, opts);
rmse = CalcRmse(dnn, IN, OUT);
rmse
