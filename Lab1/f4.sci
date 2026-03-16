function x=X(n);
    x=3*sin(%pi*n/2);
endfunction

r=0:4*5;
res=1:4*5;
for n=1:4*5
    res(n)=X(n);
end

clf();
plot2d3(res);
a = gca();
a.data_bounds = [0 -4 ; 20 4];
