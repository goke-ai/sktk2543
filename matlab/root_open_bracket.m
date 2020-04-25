function [root, ea, iter, T] = root_open_bracket(fm,f,xl,xu,es,maxit,dp,varargin)
    if nargin < 3
        error('at least 3 input arguments required');
    end
    
    fl = f(xl,varargin{:});
    fu = f(xu,varargin{:});
    test = fl*fu;
    if test > 0
        error('no sign change')
    end
    if nargin < 4 || isempty(es)
        es = 0.0001;
    end
    if nargin < 5 || isempty(maxit)
        maxit = 50;
    end
    if nargin < 6 || isempty(dp)
        dp = 4;
    end
    
    q=5*10^-(dp+1);
    
    I=[];
    Xl=[];
    Xu=[];
    Xr=[];
    fXl=[];
    fXu=[];
    fXr=[];
    fXlxfXu=[];
    Ea=[];
    
    iter = 0; 
    xr = xl;
    while (1)
        xrold = xr;
        xr = fm(xl,xu,fl,fu); % xu - (fu*(xl-xu)/(fl-fu));
        xr = round(xr+q,dp);
        iter = iter +1;
        if xr ~= 0
            ea=abs((xr-xrold)/xr)*100;
            ea = round(ea+q,dp);
        end
        f1 = f(xl,varargin{:});
        fl = round(f1+q,dp);
        fu = f(xu,varargin{:});
        fu = round(fu+q,dp);
        fr = f(xr,varargin{:});
        fr = round(fr+q,dp);
        test = fl*fu;
        test = round(test+q,dp);
           
        i = iter;
        I(i) = i;
        Xl(i) = xl;
        Xu(i) = xu;
        Xr(i) = xr;
        fXl(i) = fl;
        fXu(i) = fu;
        fXr(i) = fr;
        fXlxfXu(i) = test;
        Ea(i) = ea;        
    
        if test < 0
            xu=xr;
        elseif test > 0
            xl=xr;
        else
            ea=0;
        end
        if ea <= es || iter >= maxit
            break
        end
    end
    
    root = xr;
    T = table(I',Xl',Xr',Xu',fXl',fXr',fXu',fXlxfXu',Ea', ...
            'VariableNames',{'I','Xl','Xr','Xu','fXl','fXr','fXu','fXlxfXu','Ea'});