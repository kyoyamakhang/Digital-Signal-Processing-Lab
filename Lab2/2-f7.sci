x = [1 -2 3 6 0];
nx = -2:2;

n = -5:5;
y = zeros(1,11);

for v = 1:11
    ns = -n(v) - 2;
    if ns >= nx(1) & ns <= nx($) then
        y(v) = 2 * x(ns - nx(1) + 1);
    else
        y(v) = 0;
    end
end

subplot(2,1,1);
plot2d3(nx,x);
title("x(n)");
xlabel("n");
ylabel("x(n)");
a=gca();
a.data_bounds = [-5 -5 ; 5 7];

subplot(2,1,2);
plot2d3(n,y);
title("y(n) = 2x(-n-2)");
xlabel("n");
ylabel("y(n)");
a=gca();
a.data_bounds = [-5 -5 ; 7 15];
