function [x,fx,ea,iter] = parabolicmin(f,x0,x1,x2,es,maxit,varargin)
    if nargin < 4, error('at least 4 input arguments required'), end
    if nargin < 5 || isempty(es), es = 0.0001; end
    if nargin < 6 || isempty(maxit), maxit = 50; end
    
    disp("      i          x0         f0        x1       f1        x2        f2       x3        f3")
    
    iter = 0;
    X=[iter,0,0,0,0,0,0,0,0];
    while(1)
        f0=f(x0,varargin{:});
        f1=f(x1,varargin{:});
        f2=f(x2,varargin{:});
        
        % x3 = (f0*(x1^2-x2^2)+f1*(x2^2-x0^2)+f2*(x0^2-x1^2))/(2*f0*(x1-x2)+2*f1*(x2-x0)+2*f2*(x0-x1));
        x3 = x1 - 0.5*(((x1-x0)^2*(f1-f2)-(x1-x2)^2*(f1-f0))/((x1-x0)*(f1-f2)-(x1-x2)*(f1-f0)));        
        f3=f(x3);
        
        X(iter+1,:)=[iter,x0,f0,x1,f1,x2,f2,x3,f3];

        if f1 < f3
            xopt = x1;
            x0 = x1;
        else
            xopt = x3;
            x2 = x1;
        end
        
        iter = iter+1;
        if xopt~=0, ea = abs((x1-x3)/x1)*100;end
        if ea <= es || iter >= maxit, break, end
        
        x1 = x3;
    end
    x=xopt;
    fx=f(xopt,varargin{:});
    disp(X)
end