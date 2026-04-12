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
    ny = ((0:length(y_n) - 1) - y_origin);
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

xn = [1 2 -3 2 1];
xorg = 0;
hn = [1 0 -1];
horg = 0;
[yn, yorg] = convolution(xn, xorg, hn, horg);

en = yn.^2;
eorg = yorg;

subplot(2,2,1)
nx = (0:length(xn) - 1) - xorg;
plot2d3(nx, xn);
title("x(n)");
xlabel("n");
ylabel("x(n) - magnitude")
a=gca();
a.data_bounds = [-1 -5; 10 10];


subplot(2,2,2)
ny = (0:length(yn) - 1) - yorg - 2;
plot2d3(ny, yn);
title("y(n)");
xlabel("n");
ylabel("y(n) - magnitude")
a = gca();
a.data_bounds = [-1 -5; 10 10];

subplot(2,1,2)
ne = (0:length(yn) - 1) - eorg - 2;
plot2d3(ne, en);
title("e(n)");
xlabel("n");
ylabel("e(n) - magnitude")
a = gca();
a.data_bounds = [-1 -5; 10 20];
