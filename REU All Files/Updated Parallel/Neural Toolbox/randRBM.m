% randRBM: get randomized restricted boltzmann machine (RBM) model
%
% rbm = randRBM( dimV, dimH, type )
%
%
%Output parameters:
% dbn: the randomized restricted boltzmann machine (RBM) model
%
%
%Input parameters:
% dimV: number of visible (input) nodes
% dimH: number of hidden (output) nodes
% type (optional): (default: 'BBRBM' )
%                 'BBRBM': the Bernoulli-Bernoulli RBM
%                 'GBRBM': the Gaussian-Bernoulli RBM
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
function rbm = randRBM( dimV, dimH, type )

if( ~exist('type', 'var') || isempty(type) )
	type = 'BBRBM';
end

if( strcmpi( 'GB', type(1:2) ) )
    rbm.type = 'GBRBM';
    rbm.W = randn(dimV, dimH) * 0.1;
    rbm.b = zeros(1, dimH);
    rbm.c = zeros(1, dimV);
    rbm.sig = ones(1, dimV);
else
    rbm.type = type;
    rbm.W = randn(dimV, dimH) * 0.1;
    rbm.b = zeros(1, dimH);
    rbm.c = zeros(1, dimV);
end

