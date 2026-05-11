w = -%pi:0.01:%pi;
X1 = 1 ./ (1 - 0.1 * exp(-%i * w));

clf();
subplot(2,1,1);
plot(w, abs(X1));
xtitle("Amplitude Spectrum of x1(n)", "omega", "|X(e^jw)|");
xgrid(color("grey"));

subplot(2,1,2);
plot(w, atan(imag(X1), real(X1)));
xtitle("Phase Spectrum of x1(n)", "omega", "Phase (rad)");
xgrid(color("grey"));
