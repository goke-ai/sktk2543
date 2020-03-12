% dv/dt = g - c/m*v
% v(t) = g*m/c*(1 - e(-(c/m)*t))

function [v] = falling_velocity(g,m,c,t)
    v = g*m/c*(1 - exp(-(c/m)*t));


