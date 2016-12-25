% GetDroppedDBN: get dropped dbn
%
% [DropedDBN OnInd] = GetDroppedDBN(dbn, DropOutRate, strbm)
%
%
%Output parameters:
% DropedDBN: the generated dropped Deep Belief Nets (DBN) model
% OnInd: indexes which are used (not dropped) nodes
%
%
%Input parameters:
% dbn: the Original Deep Belief Nets (DBN) model
% DropOutRate: 0 < DropOutRate < 1
% strbm (optional): started rbm layer to dropout (Default: 1)
%
%
%Reference:
%for details of the dropout
% Hinton et al, Improving neural networks by preventing co-adaptation of feature detectors, 2012.
%
%
%Version: 20130920

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [DropedDBN OnInd] = GetDroppedDBN(dbn, DropOutRate, strbm)

if( ~exist('strbm', 'var') || isempty(strbm) )
	strbm = 1;
end

nrbm = numel(dbn.rbm);

OnInd = GetOnInd(dbn, DropOutRate, strbm);

DropedDBN.type = dbn.type;
DropedDBN.rbm = cell(nrbm,1);

for n=1:nrbm-1
    DropedDBN.rbm{n}.type = dbn.rbm{n}.type;
    DropedDBN.rbm{n}.W = dbn.rbm{n}.W(OnInd{n},OnInd{n+1});
    DropedDBN.rbm{n}.b = dbn.rbm{n}.b(1,OnInd{n+1});
    DropedDBN.rbm{n}.c = dbn.rbm{n}.c(1,OnInd{n});
    if( isequal(dbn.rbm{n}.type(1:2), 'GB') )
    	DropedDBN.rbm{n}.sig = dbn.rbm{n}.sig(1,OnInd{n});
    end
end

n = nrbm;
DropedDBN.rbm{n}.type = dbn.rbm{n}.type;
DropedDBN.rbm{n}.W = dbn.rbm{n}.W(OnInd{n},:);
DropedDBN.rbm{n}.b = dbn.rbm{n}.b;
DropedDBN.rbm{n}.c = dbn.rbm{n}.c(1,OnInd{n});
if( isequal(dbn.rbm{n}.type(1:2), 'GB') )
	DropedDBN.rbm{n}.sig = dbn.rbm{n}.sig(1,OnInd{n});
end
