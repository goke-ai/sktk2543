% f(x) = ax^2 + bx + c = 0

a = 1; b= 2; c=4;
x = formula(a,b,c);
disp([a,b,c,x]);

a = 6; b= 2; c=-3;
x = formula(a,b,c);
disp([a,b,c,x]);

function [x] = formula(a,b,c)
    x = (-b + sqrt(b^2 - 4*a*c))/(2*a);
end