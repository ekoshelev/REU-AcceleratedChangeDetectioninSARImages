% v2hall: to transform from visible (input) variables to all hidden (output) variables
%
% Hall = h2val(dnn, V)
%
%
%Output parameters:
% Hall: all hidden (output) variables, where # of row is number of data and # of col is # of hidden (output) nodes
%
%
%Input parameters:
% dnn: the Deep Neural Network model (dbn, rbm)
% V: visible (input) variables, where # of row is number of data and # of col is # of visible (input) nodes
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
function Hall = v2hall(dnn, V)

ind1 = numel(dnn.type);
ind0 = ind1-2;
type = dnn.type(ind0:ind1);

if( isequal(type, 'RBM') )
    Hall = cell(1,1);
    Hall{1} = v2h( dnn, V );

elseif( isequal(type, 'DBN') )
    nrbm = numel( dnn.rbm );
    Hall = cell(nrbm,1);
    H0 = V;
    for i=1:nrbm
        H1 = v2h( dnn.rbm{i}, H0 );
        H0 = H1;
        Hall{i} = H1;
    end
end

