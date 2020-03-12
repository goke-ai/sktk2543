clear; clc;
% anonymous function
func5 = @(c,V,Q,W,k) W/V - Q*c/V - k* c^.5;
func2 = @(c,varargin) varargin{3}/ varargin{1} - varargin{2}*c/varargin{1} - varargin{4}*(c^.5);

V = 1e6;
Q=1e5;
W=1e6;
k=0.2;

% anonymous function
func1 = @(c) W/V - Q*c/V - k* c^.5;

c =0;
y = W/V - Q*c/V -k*sqrt(c);
t5 = toxic_arg5(c,V,Q,W,k);
t2 = toxic_arg2(c,V,Q,W,k);
f5 = func5(c,V,Q,W,k);
f1 = func1(c);
f2 = func2(c,V,Q,W,k);

disp('    t5     t2    f5    f1   f2    y')
disp([t5, t2, f5, f1, f2,  y])

%%
function [y] = toxic_arg5(c,V,Q,W,k)
    y = W/V - Q*c/V - k* c^.5;
end

function [y] = toxic_arg2(c, varargin)
    y= varargin{3} ./ varargin{1} - varargin{2} .* c ./ varargin{1} - varargin{4} .* (c^.5);
end