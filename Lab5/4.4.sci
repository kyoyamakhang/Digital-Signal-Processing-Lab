x_per = [3, 2, 1, 0, 1, 2];
N = 6;
n = 0:N-1;
ck = fft(x_per) / N;

k = 0:N-1;
mag_ck = abs(ck);
phase_ck = atan(imag(ck), real(ck));

scf(0);
clf();
subplot(3,1,1);
plot2d3(n, x_per);
plot(n, x_per, "ro");
xtitle("Periodic Signal x(n) (One Period)", "n", "x(n)");
xgrid(color("grey"));

subplot(3,1,2);
plot2d3(k, mag_ck);
plot(k, mag_ck, "bo");
xtitle("Magnitude Spectrum |ck|", "k", "|ck|");
xgrid(color("grey"));

subplot(3,1,3);
plot2d3(k, phase_ck);
plot(k, phase_ck, "go");
xtitle("Phase Spectrum", "k", "Phase (rad)");
gca().data_bounds = [0, -%pi; 5, %pi];
xgrid(color("grey"));
