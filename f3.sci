function x=X(t);
    x=3*sin(100*%pi*t);
endfunction
res = 1:5;

for n=1:5
    res(n)=X(n);
end

c=0:0.001:5/50;
r=3*sin(100*%pi*c);
clf();
plot(c,r);
