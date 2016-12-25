% randDBN: get randomized Deep Belief Nets (DBN) model
%
% dbn = randDBN( dims, type )
%
%
%Output parameters:
% dbn: the randomized Deep Belief Nets (DBN) model
%
%
%Input parameters:
% dims: number of nodes
% type (optional): (default: 'BBDBN' )
%                 'BBDBN': all RBMs are the Bernoulli-Bernoulli RBMs
%                 'GBDBN': the input RBM is the Gaussian-Bernoulli RBM, other RBMs are the Bernoulli-Bernoulli RBMs
%
%
%Version: 20130830


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dbn = randDBN( dims, type )

if( ~exist('type', 'var') || isempty(type) )
	type = 'BBDBN';
end

if( strcmpi( 'GB', type(1:2) ) )
 dbn.type = 'GBDBN';
 rbmtype = 'GBRBM';
elseif( strcmpi( 'BBP', type(1:3) ) )
 dbn.type = 'BBPDBN';
 rbmtype = 'BBPRBM';
else
 dbn.type = 'BBDBN';
 rbmtype = 'BBRBM';
end

dbn.rbm = cell( numel(dims)-1, 1 );

i = 1;
dbn.rbm{i} = randRBM( dims(i), dims(i+1), rbmtype );

for i=2:numel(dbn.rbm) - 1
 dbn.rbm{i} = randRBM( dims(i), dims(i+1), rbmtype );
end

i = numel(dbn.rbm);
if( strcmp( 'P', type(3) ) )
    dbn.rbm{i} = randRBM( dims(i), dims(i+1), 'BBPRBM' );
else
    dbn.rbm{i} = randRBM( dims(i), dims(i+1), 'BBRBM' );
end
