clear
clc

filename='C2Q1T1.xlsx';
format long
dp=4;

g=9.81;
u=1800;
mo=160000;
q=2600;
v=750;

f = @(t) u*log(mo/(mo-q*t))- g*t - v;

es=2.5;
maxIt=50;

xl=10;
xu=50;


[root, ea, iter, T] = false_position(f,xl,xu,es,[],dp)


writetable(T, filename);

