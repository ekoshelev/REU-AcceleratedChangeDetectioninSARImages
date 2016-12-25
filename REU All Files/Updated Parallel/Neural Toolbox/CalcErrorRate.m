% CalcErrorRate: calculate error rate
%
% ErrorRate = CalcErrorRate( dbn, IN, OUT )
%
%
%Output parameters:
% ErrorRate: error rate
%
%
%Input parameters:
% dbn: network
% IN: input data, where # of row is # of data and # of col is # of input features
% OUT: output data, where # of row is # of data and # of col is # of output labels
%
%
%Version: 20131213

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ErrorRate = CalcErrorRate( dbn, IN, OUT )
 out = v2h( dbn, IN );
 [m ind] = max(out,[],2);
 out = zeros(size(out));
 for i=1:size(out,1)
  out(i,ind(i))=1;
 end
 
 ErrorRate = abs(OUT-out);
 ErrorRate = mean(sum(ErrorRate,2)/2);

end

