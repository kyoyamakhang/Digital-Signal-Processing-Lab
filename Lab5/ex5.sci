w = -%pi:0.005:%pi;
H = 1 + exp(-%i*w);
X = 1 ./ (1 - 0.5*exp(-%i*w));
Y = H .* X;

clf();
subplot(2,1,1);
plot(w, abs(Y));
xtitle("Amplitude Spectrum of y(n)", "omega", "|Y(e^jw)|");
xgrid(color("grey"));
subplot(2,1,2);
plot(w, atan(imag(Y), real(Y)));
xtitle("Phase Spectrum of y(n)", "omega", "Phase (rad)");
xgrid(color("grey"));
