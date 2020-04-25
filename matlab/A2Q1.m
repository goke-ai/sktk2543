clear
clc

format long
dp=4;

g=9.81;

v=5;
t=2.5;
L=4;


% X = ['g     = ', num2str(g)];
% disp(X)
% X = ['v     = ', num2str( v)];
% disp(X)
% X = ['t     = ', num2str(t)];
% disp(X)
% X = ['L     = ', num2str( L)];
% disp(X)
% X = ['Hl    = ', num2str(xl)];
% disp(X)
% X = ['Hu    = ', num2str( xu)];
% 
% disp(X)
% X = ['es    = ', num2str( es)];
% disp(X)
% X = ['maxlt = ', num2str( maxIt)];
% disp(X)

 
fprintf('\n\n');
xl=0;
xu=4;
es=5;
maxIt=50;

f = @(H) sqrt(2*g*H) * tanh(sqrt(2*g*H/2/L*t)) - v;

[root, ea, iter, T] = false_position(f,xl,xu,es,[],dp)


writetable(T, 'A2Q1T1.xlsx');

