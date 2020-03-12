function [root, ea, iter] = newton(func, ffunc, x0,es,maxit,varargin)
    if nargin < 3
        error('at least 3 input arguments required');
    end    
    if nargin < 4 || isempty(es)
        es = 0.0001;
    end
    if nargin < 5 || isempty(maxit)
        maxit = 50;
    end
        
    iter = 0; 
    xr = x0;    
    while (1)
        xrold = xr;
        f = func(xrold,varargin(:));
        ff = ffunc(xrold,varargin(:));
        xr = xrold - f / ff;
        iter = iter +1;
        if xr ~= 0
            ea = abs((xr-xrold)/xr)*100;
        end
        
        if ea <= es || iter >= maxit
            break
        end
        
    end
    root = xr;