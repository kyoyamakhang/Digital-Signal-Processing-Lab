w = [0, 1/4, -1/4, 1/2, -1/2, 3/4, -3/4];
ck = [2, 1, 1, 1/2, 1/2, 1/4, 1/4];
psd = ck.^2;

scf(3);
clf();

plot2d3(w, psd);
plot(w, psd, "ro");
xtitle("Power Density Spectrum", "omega (units of pi)", "P(omega)");
xgrid(color("grey"));
gca().data_bounds = [-1, 0; 1, 4.5];
