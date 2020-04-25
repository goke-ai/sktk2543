
filename = 'B3Q2T1.xlsx';
format long;
dp=5;

Cs=2.5;
k1=0.25;
k2=0.8;
Lo=25;

tl=0;
tu=5;

es = 1;


f = @(t) k1*Lo/(k2-k1)*(exp(-k1*t)-exp(-k2*t))+(Cs*exp(-k2*t));

[x,fx,ea,iter,phi,T] = goldmax(f,tl,tu,es,[],dp)

writetable(T, filename);