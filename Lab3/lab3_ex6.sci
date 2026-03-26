function [y_n, y_origin] = delay(x_n, x_origin, k);
    y_n = x_n;
    y_origin = x_origin - k;
endfunction

function [y_n, y_origin] = advance(x_n, x_origin, k);
    y_n = x_n;
    y_origin = x_origin + k;
endfunction

function [yn, yorigin] = fold(xn, xorigin);
    yn = flipdim(xn, 2);
    yorigin = length(xn) - xorigin + 1;
endfunction

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin);
    n_start = min(-x1origin, -x2origin);
    n_end = max(length(x1n) - x1origin, length(x2n) - x2origin);
    x1 = zeros(1, n_end - n_start + 1);
    x2 = zeros(1, n_end - n_start + 1);
    i1 = -x1origin - n_start + 1;
    x1(i1:i1 + length(x1n) - 1) = x1n;
    i2 = -x2origin - n_start + 1;
    x2(i2:i2 + length(x2n) - 1) = x2n;
    yorigin = -n_start;
    yn = x1+x2;
endfunction

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

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin);//y(n)) = x(k)h(-k+n)
    n = length(xn) + length(hn) - 1;
    n_start = -xorigin -horigin;
    n_end = length(xn) - xorigin + (length(hn) - horigin);
    eyn = zeros(1, n_end - n_start - 1);
    ehn = hn;
    ehorigin = horigin;
    for v = n_start:n_end;
        [ehn, ehorigin] = fold(hn, horigin);
        if (v < 0) then [ehn, ehorigin] = advance(ehn, ehorigin, abs(v));
        elseif (v >= 0) then [ehn, ehorigin] = delay(ehn, ehorigin, v);
        end
        
        emorg = 0;
        [emulti, emorg] = multi(xn, xorigin, ehn, ehorigin);
        eyn(v -n_start +1) = sum(emulti);
    end
    yn = eyn;
    yorigin = emorg;
endfunction

x1 = [1 1 1];
x1org = 0;
x2 = [1 1];
x2org = 0;
y = zeros(1:max(length(x1),length(x2)));
yorg = 0;
[y, yorg] = convolution(x1, x1org, x2, x2org);
disp(yorg);

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
n_start = -x1org -x2org;
n_end = length(x1) - x1org + (length(x2) - x2org);
ny = (n_start:1:n_end) - 2; //offset -2 becuz the indexing in Scilab is different
plot2d3(ny, y);
title("y(n)");
xlabel("n");
ylabel("y(n)");
a = gca();
a.data_bounds = [-length(y) -length(y); 10 10];
