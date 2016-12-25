% sigmoid: calculate sigmoid function
%
% y = sigmoid(x)
%
% y = 1.0 ./ ( 1.0 + exp(-x) );
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
function y = sigmoid(x)

y = 1.0 ./ ( 1.0 + exp(-x) );
