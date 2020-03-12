% dv/dt = g - c/m*v
% v(t) = g*m/c*(1 - e(-(c/m)*t))

m=68.1; c=12.5; g=9.8;

t = 0
falling_velocity2(g,m,c,t)

t = 2
falling_velocity2(g,m,c,t)

function [v] = falling_velocity2(g,m,c,t)
    v = g*m/c*(1 - exp(-(c/m)*t));
end
