function dn = backprop(da,n,a,param)
%TANSIG.BACKPROP

% Copyright 2012 The MathWorks, Inc.

dn = bsxfun(@times,da,a.*(1-a));
