function a = apply(n,param)

global theta;
% Copyright 2012 The MathWorks, Inc.

a = 1 ./ (1 + exp(-n*theta));