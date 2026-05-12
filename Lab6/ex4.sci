w = -%pi:0.005:%pi;
H = 1 ./ (1 + 0.1*exp(-%i*w) + 0.2*exp(-%i*2*w));

clf();

subplot(2,1,1);
plot(w, abs(H));
xtitle("Amplitude Spectrum", "omega", "|H(e^jw)|");
a = gca(); 
a.grid = [1 1];
xgrid(color("grey"));

subplot(2,1,2);
plot(w, atan(imag(H), real(H)));
xtitle("Phase Spectrum", "omega", "Phase (rad)");
a = gca();
a.grid = [1 1];
xgrid(color("grey"));
