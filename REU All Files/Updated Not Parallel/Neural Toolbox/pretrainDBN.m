% pretrainDBN: pre-training the Deep Belief Nets (DBN) model by Contrastive Divergence Learning 
%
% dbn = pretrainDBN(dbn, V, opts)
%
%
%Output parameters:
% dbn: the trained Deep Belief Nets (DBN) model
%
%
%Input parameters:
% dbn: the initial Deep Belief Nets (DBN) model
% V: visible (input) variables, where # of row is number of data and # of col is # of visible (input) nodes
% opts (optional): options
%
% options (defualt value):
%  opts.LayerNum: # of tarining RBMs counted from input layer (all layer)
%  opts.MaxIter: Maxium iteration number (100)
%  opts.InitialMomentum: Initial momentum until InitialMomentumIter (0.5)
%  opts.InitialMomentumIter: Iteration number for initial momentum (5)
%  opts.FinalMomentum: Final momentum after InitialMomentumIter (0.9)
%  opts.WeightCost: Weight cost (0.0002)
%  opts.DropOutRate: List of Dropout rates for each layer (0)
%  opts.StepRatio: Learning step size (0.01)
%  opts.BatchSize: # of mini-batch data (# of all data)
%  opts.Verbose: verbose or not (false)
%  opts.SparseQ: q parameter of sparse learning (0)
%  opts.SparseLambda: lambda parameter (weight) of sparse learning (0)
%
%
%Example:
% datanum = 1024;
% outputnum = 16;
% hiddennum = 8;
% inputnum = 4;
% 
% inputdata = rand(datanum, inputnum);
% outputdata = rand(datanum, outputnum);
% 
% dbn = randDBN([inputnum, hiddennum, outputnum]);
% dbn = pretrainDBN( dbn, inputdata );
% dbn = SetLinearMapping( dbn, inputdata, outputdata );
% dbn = trainDBN( dbn, inputdata, outputdata );
% 
% estimate = v2h( dbn, inputdata );
%
%
%Reference:
%for details of the dropout
% Hinton et al, Improving neural networks by preventing co-adaptation of feature detectors, 2012.
%for details of the sparse learning
% Lee et al, Sparse deep belief net model for visual area V2, NIPS 2008.
%
%
%Version: 20130821


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dbn = pretrainDBN(dbn, V, opts)

LayerNum = numel( dbn.rbm );
DropOutRate = zeros(LayerNum,1);

X = V;

if( exist('opts' ) )
 if( isfield(opts,'LayerNum') )
  LayerNum = opts.LayerNum;
 end
 if( isfield(opts,'DropOutRate') )
  DropOutRate = opts.DropOutRate;
  if( numel( DropOutRate ) == 1 )
   DropOutRate = ones(LayerNum,1) * DropOutRate;
  end
 end
 
else
 opts = [];
end

for i=1:LayerNum
	opts.DropOutRate = DropOutRate(i);
    dbn.rbm{i} = pretrainRBM(dbn.rbm{i}, X, opts);
    X0 = X;
    X = v2h( dbn.rbm{i}, X0 );
end
