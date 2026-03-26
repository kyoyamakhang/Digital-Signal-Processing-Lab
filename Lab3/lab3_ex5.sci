function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin);
    n_start = min(-x1origin, -x2origin);
    n_end = max(length(x1n) - x1origin, length(x2n) - x2origin);
    x1 = zeros(1, n_end - n_start + 1);
    x2 = zeros(1, n_end - n_start + 1);
    i1 = -x1origin - n_start + 1;
    x1(i1:i1 + length(x1n) - 1) = x1n;
    i2 = -x2origin - n_start + 1;
    x2(i2:i2 + length(x2n) - 1) = x2n;
    yorigin = -n_start;
    yn = x1.*x2;
endfunction

function adisp(y_n, y_origin);
    ny = (0:length(y_n) - 1) - y_origin;
    plot2d3(ny, y_n);
endfunction

x1 = [0 1 3 -2];
x1org = 0;
x2 = [1 1 2 3];
x2org = 1;
y = zeros(1:max(length(x1),length(x2)));
yorg = 0;
[y, yorg] = multi(x1, x1org, x2, x2org);

subplot(3,1,1);
adisp(x1, x1org);
title("x1(n)");
xlabel("n");
ylabel("x1(n)");
a = gca();
a.data_bounds = [-length(x1) -length(x1); length(x1) length(x1)];

subplot(3,1,2);
adisp(x2, x2org);
title("x2(n)");
xlabel("n");
ylabel("x2(n)");
a = gca();
a.data_bounds = [-length(x2) -length(x2); length(x2) length(x2)];

subplot(3,1,3);
adisp(y, yorg);
title("y(n)");
xlabel("n");
ylabel("y(n)");
a = gca();
a.data_bounds = [-length(y) -length(y); 10 10];
