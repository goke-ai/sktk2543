a = [7 -2 -3 500;
     5 -14 2 200;
     5 5 -22 30     ];
[m,n] = size(a);
a
for p=1:m-1
    for i=p+1:m
        
        for j=p+1:n
            a(i,j) = a(i,j) - a(i,p)*a(p,j)/a(p,p);
        end
        a(i,p)=0;
        a
    end
end

