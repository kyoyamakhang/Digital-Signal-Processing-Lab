delta = %pi/9;
res=1:10; res(1)=0;
r = 1:10;
for n=2:10
    res(n) = res(n-1)+delta;
end
for n=1:10
    r(n) = sin(res(n));
end
disp(res); disp(r);
