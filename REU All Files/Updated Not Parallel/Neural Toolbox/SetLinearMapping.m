% SetLinearMapping: set the RBM associated to the linear mapping to the last layer 
%
% dbn = SetLinearMapping( dbn, IN, OUT )
%
%
%Input parameters:
% dbn: the Deep Belief Nets (DBN) model
% IN: visible (input) variables, where # of row is number of data and # of col is # of visible (input) nodes
% OUT: teaching data, where # of row is number of data and # of col is # of hidden (output) nodes
%
%
%Output parameters:
% dbn: the set Deep Belief Nets (DBN) model
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dbn = SetLinearMapping( dbn, IN, OUT )
nrbm = numel(dbn.rbm);
if( nrbm > 1 )
    Hall = v2hall( dbn, IN );
    dbn.rbm{nrbm}.W = linearMapping( Hall{nrbm-1}, OUT );
    dbn.rbm{nrbm}.b = -0.5 * ones(size(dbn.rbm{nrbm}.b));
else
    dbn.rbm{nrbm}.W = linearMapping( IN, OUT );
    dbn.rbm{nrbm}.b = -0.5 * ones(size(dbn.rbm{nrbm}.b));
end
