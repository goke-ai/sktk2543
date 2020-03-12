x=0:pi/12:2*pi;
f= @(x) 2*cos(x) - 2/10;
y = f(x);
plot(x,y)
xw=1;xu=5;
[x,fx,ea,iter] = goldmin(f,xw,xu);
%x0=1;x1=2;x2=5; %[x,fx,ea,iter] = parabolicmin(f,x0,x1,x2);
disp("      x        fx        ea        iter")
disp([x,fx,ea,iter]);

