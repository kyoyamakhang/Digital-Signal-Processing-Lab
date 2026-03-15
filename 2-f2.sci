x=[1 3 -2];
n=-1:1;
y= flipdim(x,2);
e = (x+y)/2;
o = (x-y)/2;
subplot(3,1,1);
title("Odd");
plot2d3(n,o);
xlabel("n");
ylabel("xo(n)");
a = gca();
a.data_bounds=[-3,-3;3,3];


subplot(3,1,2);
title("Even");
plot2d3(n,e);
xlabel("n");
ylabel("xe(n)");
a = gca();
a.data_bounds=[-3,-3;3,3];

subplot(3,1,3);
title("Signal")
plot2d3(n,x);
xlabel("n");
ylabel("x0(n)")

a = gca();
a.data_bounds=[-3,-3;3,3];
