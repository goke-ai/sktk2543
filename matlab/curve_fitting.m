clear; clc;
xi = [1;2;3;4;5;6;7];
yi = [0.5;2.5;2.0;4.0;3.5;6.0;5.5];
T = table(xi,yi)
[r,c] = size(T);
n=r;
T.xiyi = T.xi.*T.yi

