clear;clc;

% V*dc/dt = W - Q*c - k*V*sqrt(c)
% f(c) = W/V - Q*c/V - k*sqrt(c)
% ff = -Q/V - k/2/(c^.5)
func = @(c,x) x{3} ./ x{1} - x{2}.*c./x{1} - x{4}.*(c^.5);
ffunc = @(c,x) -x{2}/x{1} - x{4}/2/(c^.5);

V=1e6;
Q=1e5;
W=1e6;
k=0.2;

x0=6;

[root, ea, iter] = newton(func,ffunc,x0,[],[],V,Q,W,k)

