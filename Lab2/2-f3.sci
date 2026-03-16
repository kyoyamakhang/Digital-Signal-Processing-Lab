x1 =[0 0 0 0 1 3 -2];
x2 =[0 0 0 1 2 3 0];
y =1:7;

for n=1:7;
    y(n) = x1(n) + x2(n);
end

r=-3:3;
subplot(3,1,1);
plot2d3(r, x1);
title("x1(n)");
xlabel("n");
ylabel("x1(n)");
a =gca();
a.data_bounds = [0 -4 ; 4 7];

subplot(3,1,2);
plot2d3(r, x2);
title("x2(n)");
xlabel("n");
ylabel("x2(n)");
a =gca();
a.data_bounds = [0 -4 ; 4 7];

subplot(3,1,3);
plot2d3(r, y);
title("y(n)");
xlabel("n");
ylabel("y(n)");
a =gca();
a.data_bounds = [0 -4 ; 4 7];
