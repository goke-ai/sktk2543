clear
clc

filename='B3Q1T1.xlsx';
format long
dp=4;

g=9.81;
xl=0;
xu=5;
v=6;
t=3.2;
L=4.5;
es=5;
maxIt=50;

X = ['g     = ', num2str(g)];
disp(X)
X = ['v     = ', num2str( v)];
disp(X)
X = ['t     = ', num2str(t)];
disp(X)
X = ['L     = ', num2str( L)];
disp(X)
X = ['Hl    = ', num2str(xl)];
disp(X)
X = ['Hu    = ', num2str( xu)];

disp(X)
X = ['es    = ', num2str( es)];
disp(X)
X = ['maxlt = ', num2str( maxIt)];
disp(X)

 
fprintf('\n\n');

f = @(H) sqrt(2*g*H) * tanh(sqrt(2*g*H/2/L*t)) - v;


[root, ea, iter, T] = false_position(f,xl,xu,es,[],dp)


writetable(T, filename);

