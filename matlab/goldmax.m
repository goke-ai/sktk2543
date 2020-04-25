function [x,fx,ea,iter,phi,T] = goldmax(f,xw, xu, es, maxit, dp, varargin)
    if nargin < 3, error('at least 3 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001; end
    if nargin < 5 || isempty(maxit), maxit = 50; end
    if nargin < 6 || isempty(dp), dp = 4; end
    
    phi = (1+sqrt(5))/2;
    iter = 0;
    
    I=[];
    Xl=[];
    Xu=[];
    D=[];
    X1=[];
    X2=[];
    fX1=[];
    fX2=[];
    Xopt=[];
    Ea=[];
    
    while(1)
        iter = iter+1;
        
        d = round((phi-1)*(xu-xw),dp);
        x1=round(xw+d,dp);
        x2=round(xu-d,dp);
        f1=round(f(x1,varargin{:}),dp);
        f2=round(f(x2,varargin{:}),dp);
        
        if f1 > f2
            xopt = x1;
        else
            xopt = x2;
        end       
        
        if xopt~=0
            ea = round((2-phi)*abs((xu-xw)/xopt)*100,dp);
        end
        
        
        i=iter;
             
        I(i) = i;
        Xl(i) = xw;
        Xu(i) = xu;
        D(i) = d;
        X1(i) = x1;
        X2(i) = x2;
        fX1(i) = f1;
        fX2(i) = f2;
        Xopt(i) = xopt;
        Ea(i) = ea;
        
        if f1 > f2
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
            
        if ea <= es || iter >= maxit
            break
        end
    end
    x = xopt;
    fx = round(f(xopt,varargin{:}));
    
    T = table(I',Xl',Xu',D',X1',X2',fX1',fX2',Xopt',Ea', ...
            'VariableNames',{'I','Xl','Xu','d','X1','X2','fX1','fX2','Xopt','Ea'});
end