A = 1;
tau = 1;
F0 = 1/tau; 
k = -5:5;

ck = (2*A/%pi) ./ (1 - 4*k.^2);
PSD = abs(ck).^2;

clf();
plot2d3(k*F0, PSD);
plot(k*F0, PSD, "ro");
xtitle("Power Spectral Density (PSD) of Full-Wave Rectified Sinusoid", "Frequency (F)", "Power |ck|^2");
xgrid(color("grey"));
