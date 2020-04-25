function [root, ea, iter] = bisect(func,xl,xu,es,maxit,varargin)
    if nargin < 3
        error('at least 3 input arguments required');
    end
    f1 = func(xl,varargin{:});
    f2 = func(xu,varargin{:});
    test = f1*f2;
    if test > 0
        error('no sign change')
    end
    if nargin < 4 || isempty(es)
        es = 0.0001;
    end
    if nargin < 5 || isempty(maxit)
        maxit = 50;
    end
    iter = 0; 
    xr = xl;
    while (1)
        xrold = xr;
        xr = (xl + xu)/2;
        iter = iter +1;
        if xr ~= 0
            ea = abs((xr-xrold)/xr)*100;
        end
        f1 = func(xl,varargin{:});
        f2 = func(xu,varargin{:});
        test = f1*f2;
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