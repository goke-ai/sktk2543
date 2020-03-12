V = 1e6;
Q=1e5;
W=1e6;
k=0.2;
c = [-10:0.1:10]

y = W/V - Q*c./V -k*sqrt(c)

plot(c,y)
