function y_struct = circonv_fft(x1_struct, x2_struct)
    x1 = x1_struct.data;
    x2 = x2_struct.data;
    orig1 = x1_struct.origin;
    orig2 = x2_struct.origin;
    
    N = length(x1) + length(x2) - 1;
    
    x1_padded = [x1, zeros(1, N - length(x1))];
    x2_padded = [x2, zeros(1, N - length(x2))];

    X1 = fft(x1_padded);
    X2 = fft(x2_padded);
    
    Y = X1 .* X2;
    
    y_data = real(ifft(Y));
    
    y_origin = orig1 + orig2 - 1;
    
    y_struct.data = y_data;
    y_struct.origin = y_origin;
endfunction

function y_struct = circonv_direct(x1_struct, x2_struct)
    x1 = x1_struct.data;
    x2 = x2_struct.data;
    orig1 = x1_struct.origin;
    orig2 = x2_struct.origin;
    
    N = length(x1) + length(x2) - 1;
    
    // manual zero padding
    x1_padded = [x1, zeros(1, N - length(x1))];
    x2_padded = [x2, zeros(1, N - length(x2))];
    
    y_data = zeros(1, N);
    for m = 0:N-1
        sum_val = 0;
        for n = 0:N-1
            idx = pmodulo(m - n, N) + 1;
            sum_val = sum_val + x1_padded(n + 1) * x2_padded(idx);
        end
        y_data(m + 1) = sum_val;
    end
    
    y_struct.data = y_data;
    y_struct.origin = orig1 + orig2 - 1;
endfunction

// g(n) = [1, 2, 1, -1] with origin at 2 (index 2)
g_signal.data = [1, 2, 1, -1];
g_signal.origin = 2; 
// h(n) = [0, 1/3, -1/3, 1/3] with origin at 0 (index 1)
h_signal.data = [0, 1/3, -1/3, 1/3];
h_signal.origin = 1;

y_fft = circonv_fft(g_signal, h_signal);
y_dir = circonv_direct(g_signal, h_signal);
N_res = length(y_fft.data); 

n_axis = (1:N_res) - y_fft.origin; 

clf();
subplot(1,2,2);
plot2d3(n_axis, y_fft.data, 2);
plot(n_axis, y_fft.data, 'bo');
xtitle("Circular Convolution with Origin (FFT method)", "Time index (n)", "y(n)");
xgrid(color("grey"));

subplot(1,2,1);
plot2d3(n_axis, y_dir.data, 2);
plot(n_axis, y_fft.data, 'bo');
xtitle("Circular Convolution with Origin (Direct method)", "Time index (n)", "y(n)");
xgrid(color("grey"));
