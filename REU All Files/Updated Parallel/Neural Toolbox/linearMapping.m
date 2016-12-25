% linearMaping: calculate the linear mapping matrix between the input data and the output data
%
% M = linearMapping( IN, OUT )
%
%
%Output parameters:
% M: The linear mapping matrix
%
%
%Input parameters:
% IN: input data, where # of row is # of data and # of col is # of input features
% OUT: output data, where # of row is # of data and # of col is # of output labels
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
% M = linearMapping(inputdata, outputdata);
%
%
%Version: 20130727

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function M = linearMapping( IN, OUT )
M = pinv(IN) * OUT;

%OUT = IN * M;
