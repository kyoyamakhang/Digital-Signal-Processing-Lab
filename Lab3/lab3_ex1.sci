function [y_n, y_origin] = delay(x_n, x_origin, k);
    y_n = x_n;
    y_origin = x_origin - k;
endfunction

// n = index - origin
function adisp(y_n, y_origin);
    ny = (0:length(y_n) - 1) - y_origin;
    plot2d3(ny, y_n);
endfunction

x = [1 -2 3 6];
y = 1:5;
y_org = 0;
[y, y_org] = delay(x, 3, 1);

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
