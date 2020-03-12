% dv/dt = g - c/m*v
% v(ti+1) = v(ti) + (g - c/m*v(ti)) * (ti+1 - ti)
m=68.1; c=12.5; g=9.8;
t=0; v=0;
disp([t, v])
for t1=2:2:100     
    [v1] = falling_velocity_4(t1,v,t,g,m,c);
    t = t1;
    v = v1;
    disp([t, v])
end

function [v1] = falling_velocity_4(t1,v,t,g,m,c)
    v1 = v + (g - c/m*v) * (t1 - t);
end