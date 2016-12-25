% pretrainRBM: pre-training the restricted boltzmann machine (RBM) model by Contrastive Divergence Learning 
%
% rbm = pretrainRBM(rbm, V, opts)
%
%
%Output parameters:
% rbm: the restricted boltzmann machine (RBM) model
%
%
%Input parameters:
% rbm: the initial boltzmann machine (RBM) model
% V: visible (input) variables, where # of row is number of data and # of col is # of visible (input) nodes
% opts (optional): options
%
% options (defualt value):
%  opts.MaxIter: Maxium iteration number (100)
%  opts.InitialMomentum: Initial momentum until InitialMomentumIter (0.5)
%  opts.InitialMomentumIter: Iteration number for initial momentum (5)
%  opts.FinalMomentum: Final momentum after InitialMomentumIter (0.9)
%  opts.WeightCost: Weight cost (0.0002)
%  opts.DropOutRate: Dropour rate (0)
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
% inputnum = 4;
% 
% inputdata = rand(datanum, inputnum);
% outputdata = rand(datanum, outputnum);
% 
% rbm = randRBM(inputnum, outputnum);
% rbm = pretrainRBM( rbm, inputdata );
%
%
%Reference:
%for details of the dropout
% Hinton et al, Improving neural networks by preventing co-adaptation of feature detectors, 2012.
%for details of the sparse learning
% Lee et al, Sparse deep belief net model for visual area V2, NIPS 2008.
%for implimentation of contrastive divergence learning
% http://read.pudn.com/downloads103/sourcecode/math/421402/drtoolbox/techniques/train_rbm.m__.htm
%
%
%Version: 20131022


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rbm = pretrainRBM(rbm, V, opts )

% Important parameters
InitialMomentum = 0.5;     % momentum for first five iterations
FinalMomentum = 0.9;       % momentum for remaining iterations
WeightCost = 0.0002;       % costs of weight update
InitialMomentumIter = 5;

MaxIter = 100;
DropOutRate = 0;
StepRatio = 0.01;
BatchSize = 0;
Verbose = false;

SparseQ = 0;
SparseLambda = 0;


if( exist('opts' ) )
 if( isfield(opts,'MaxIter') )
  MaxIter = opts.MaxIter;
 end
 if( isfield(opts,'InitialMomentum') )
  InitialMomentum = opts.InitialMomentum;
 end
 if( isfield(opts,'InitialMomentumIter') )
  InitialMomentumIter = opts.InitialMomentumIter;
 end
 if( isfield(opts,'FinalMomentum') )
  FinalMomentum = opts.FinalMomentum;
 end
 if( isfield(opts,'WeightCost') )
  WeightCost = opts.WeightCost;
 end
 if( isfield(opts,'DropOutRate') )
  DropOutRate = opts.DropOutRate;
 end
 if( isfield(opts,'StepRatio') )
  StepRatio = opts.StepRatio;
 end
 if( isfield(opts,'BatchSize') )
  BatchSize = opts.BatchSize;
 end
 if( isfield(opts,'Verbose') )
  Verbose = opts.Verbose;
 end
 if( isfield(opts,'SparseQ') )
  SparseQ = opts.SparseQ;
 end
 if( isfield(opts,'SparseLambda') )
  SparseLambda = opts.SparseLambda;
 end

else
 opts = [];
end

num = size(V,1);
dimH = size(rbm.b, 2);
dimV = size(rbm.c, 2);

if( BatchSize <= 0 )
  BatchSize = num;
end

if( DropOutRate > 0 )
    DropOutNum = round(dimV * DropOutRate);
    DropOutRate = DropOutNum / num;
end


deltaW = zeros(dimV, dimH);
deltaB = zeros(1, dimH);
deltaC = zeros(1, dimV);

if( Verbose ) 
    timer = tic;
end

for iter=1:MaxIter

    
    % Set momentum
	if( iter <= InitialMomentumIter )
		momentum = InitialMomentum;
	else
		momentum = FinalMomentum;
    end

     if( SparseLambda > 0 )
        dsW = zeros(dimV, dimH);
        dsB = zeros(1, dimH);

        vis0 = V;
        hid0 = v2h( rbm, vis0 );

        dH = hid0 .* ( 1.0 - hid0 );
        sH = sum( hid0, 1 );
    end

    if( SparseLambda > 0 )
        mH = sH / num;
        sdH = sum( dH, 1 );
        svdH = dH' * vis0;

        dsW = dsW + SparseLambda * 2.0 * bsxfun(@times, (SparseQ-mH)', svdH)';
        dsB = dsB + SparseLambda * 2.0 * (SparseQ-mH) .* sdH;
    end


	ind = randperm(num);
	for batch=1:BatchSize:num
        
		bind = ind(batch:min([batch + BatchSize - 1, num]));

        if( DropOutRate > 0 )
            cMat = zeros(dimV,1);
            p = randperm(dimV, DropOutNum);
            cMat(p) = 1;
            cMat = diag(cMat);
        end
        
        % Gibbs sampling step 0
        vis0 = double(V(bind,:)); % Set values of visible nodes
        if( DropOutRate > 0 )
            vis0 = vis0 * cMat;
        end
        hid0 = v2h( rbm, vis0 );  % Compute hidden nodes

        % Gibbs sampling step 1
        if( isequal(rbm.type(3), 'P') )
            bhid0 = hid0;
        else
            bhid0 = double( rand(size(hid0)) < hid0 );
        end
        vis1 = h2v( rbm, bhid0 );  % Compute visible nodes
        if( DropOutRate > 0 )
            vis1 = vis1 * cMat;
        end
        hid1 = v2h( rbm, vis1 );  % Compute hidden nodes

		posprods = hid0' * vis0;
		negprods = hid1' * vis1;
		% Compute the weights update by contrastive divergence

        dW = (posprods - negprods)';
        dB = (sum(hid0, 1) - sum(hid1, 1));
        dC = (sum(vis0, 1) - sum(vis1, 1));
        
        if( strcmpi( 'GBRBM', rbm.type ) )
        	dW = bsxfun(@rdivide, dW, rbm.sig');
        	dC = bsxfun(@rdivide, dC, rbm.sig .* rbm.sig);
        end

		deltaW = momentum * deltaW + (StepRatio / num) * dW;
		deltaB = momentum * deltaB + (StepRatio / num) * dB;
		deltaC = momentum * deltaC + (StepRatio / num) * dC;

         if( SparseLambda > 0 )
            deltaW = deltaW + numel(bind) / num * dsW;
            deltaB = deltaB + numel(bind) / num * dsB;
        end

		% Update the network weights
		rbm.W = rbm.W + deltaW - WeightCost * rbm.W;
		rbm.b = rbm.b + deltaB;
		rbm.c = rbm.c + deltaC;

    end

    if( SparseLambda > 0 && strcmpi( 'GBRBM', rbm.type ) )
        dsW = bsxfun(@rdivide, dsW, rbm.sig');
    end

    
	if( Verbose )
        H = v2h( rbm, V );
        Vr = h2v( rbm, H );
		err = power( V - Vr, 2 );
		rmse = sqrt( sum(err(:)) / numel(err) );
        
        totalti = toc(timer);
        aveti = totalti / iter;
        estti = (MaxIter-iter) * aveti;
        eststr = datestr(datenum(0,0,0,0,0,estti),'DD:HH:MM:SS');
        
		fprintf( '%3d : %9.4f %9.4f %9.4f %s\n', iter, rmse, mean(H(:)), aveti, eststr );
    end
end

