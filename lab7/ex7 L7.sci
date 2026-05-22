function y = conv_fft(x1, x2)
    L1 = length(x1);
    L2 = length(x2);
    
    N = L1 + L2 - 1;

    x1_padded = [x1, zeros(1, N - L1)];
    x2_padded = [x2, zeros(1, N - L2)];
    
    X1 = fft(x1_padded);
    X2 = fft(x2_padded);
    Y = X1 .* X2;
    
    y = real(ifft(Y));
endfunction

clc;
x1 = [1, 2, 3, 4]; //L = 4
x2 = [2, 1, 1];    //L = 3

y_fft = conv_fft(x1, x2);
y_built_in = convol(x1, x2);

clf();
subplot(2, 1, 1);
plot2d3(0:length(y_fft)-1, y_fft, style=2);
plot(0:length(y_fft)-1, y_fft, 'bo');
xtitle("FFT method", "n", "Amp");
xgrid(color("grey"));
a = gca();
a.data_bounds = [0 0;8 15];

subplot(2, 1, 2);
plot2d3(0:length(y_built_in)-1, y_built_in, style=5);
plot(0:length(y_built_in)-1, y_built_in, 'ro');
xtitle("Bult-in Convo function", "n", "Amp");
xgrid(color("grey"));
a = gca();
a.data_bounds = [0 0;8 15];
