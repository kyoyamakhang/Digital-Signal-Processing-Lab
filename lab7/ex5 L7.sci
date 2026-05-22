n = 0:1:19;
N = size(n, 2);
x = sin((2*%pi*2*n)./N);
s = 0:1:19;

clf();
plot2d3(s, x, 2);
plot(s, x, 'bo');
xtitle("Signal x(n) for 0 < n < 19", "n", "Amplitude");
xgrid(color("grey"));
a = gca();
a.data_bounds = [-1 -1 ; 20 1];
