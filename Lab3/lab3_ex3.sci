function [yn, yorigin] = fold(xn, xorigin);
    yn = flipdim(xn, 2);
    yorigin = length(xn) - xorigin + 1;
endfunction

function adisp(y_n, y_origin);
    ny = (0:length(y_n) - 1) - y_origin + 1;
    plot2d3(ny, y_n);
endfunction

x = [1 -2 3 6];
x_org = 2;
y = 1:length(x);
y_org = 0;
[y, y_org] = fold(x, x_org);

subplot(2,1,1);
adisp(x, x_org);
title("x(n)");
xlabel("n");
ylabel("x(n)");
a = gca();
a.data_bounds = [-length(x) -length(x); length(x) length(x)];

subplot(2,1,2);
adisp(y, y_org);
title("y(n)");
xlabel("n");
ylabel("y(n)");
a = gca();
a.data_bounds = [-length(y) -length(y); length(y) length(y)];
