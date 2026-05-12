w = -%pi:0.005:%pi; 
X2 = 1 + exp(-%i*w) + exp(-%i*2*w) + exp(-%i*3*w);

clf();
subplot(2,1,1);
plot(w, abs(X2), 'b');
xtitle("Amplitude Spectrum of x2(n)", "omega (rad)", "|X2(e^jw)|");
xgrid(color("grey"));
subplot(2,1,2);
phase_x2 = atan(imag(X2), real(X2)); 
plot(w, phase_x2, 'r');
xtitle("Phase Spectrum of x2(n)", "omega (rad)", "Phase (rad)");
xgrid(color("grey"));
