clear;clc;
% V*dc/dt = W - Q*c - k*V*sqrt(c)
% f(c) = W/V - Q*c/V - k*sqrt(c)

func2 = @(c,x) x{3}/x{1} - x{2}*c/x{1} - x{4}*(c^.5);

V = 1e6;
Q=1e5;
W=1e6;
k=0.2;

xl=0; xu=6;

[root, ea, iter] = bisect(func2,xl,xu,[],[],V,Q,W,k)
func2(root, {V,Q,W,k})

