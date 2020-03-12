function [x,fx,ea,iter] = goldmin(f,xw, xu, es, maxit, varargin)
    if nargin < 3, error('at least 3 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001; end
    if nargin < 5 || isempty(maxit), maxit = 50; end
    
    disp("      i          d         xw        x1       f1        x2        f2       xu        es       phi")
    
    phi = (1+sqrt(5))/2;
    iter = 0;
    X=[iter,0,0,0,0,0,0,0,0,0];
    while(1)
        d = (phi-1)*(xu-xw);
        x1=xw+d;
        x2=xu-d;
        f1=f(x1,varargin{:});
        f2=f(x2,varargin{:});
        
        X(iter+1,:)=[iter,d,xw,x1,f1,x2,f2,xu,es,phi];
        
        if f1 < f2
            xopt = x1;
            xw = x2;
%             x2 = x1;
%             f2 = f1;
        else
            xopt = x2;
            xu = x1;
%             x1 = x2;
%             f1 = f2;
        end
        iter = iter+1;
        if xopt~=0, ea = (2-phi)*abs((xu-xw)/xopt)*100;end
        if ea <= es || iter >= maxit, break, end
        
        
    end
    x=xopt;
    fx=f(xopt,varargin{:});
    disp(X)
end