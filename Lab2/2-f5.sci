x = [1 -2 3 6 0];
n = -2:2;
y = flipdim(x, 2);
subplot(2,1,1);
plot2d3(n,x);
title("x(n)");
xlabel("n");
ylabel("x(n)");
a=gca();
a.data_bounds = [-4 -4 ; 4 7];

subplot(2,1,2);
plot2d3(n,y);
title("y(n) = x(-n)");
xlabel("n");
ylabel("y(n)");
a=gca();
a.data_bounds = [-4 -4 ; 4 7];
