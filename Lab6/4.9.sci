w = -%pi:0.001:%pi;

//(a)
Xa = exp(-%i*2.5*w) .* (sin(3*w) ./ sin(0.5*w));
Xa(abs(w) < 1e-10) = 6; 

scf(0); clf();
subplot(2,1,1); plot(w, abs(Xa)); 
xtitle("Magnitude (a)", "omega", "|X(w)|");
xgrid(color("grey"));

subplot(2,1,2); plot(w, atan(imag(Xa), real(Xa))); 
xtitle("Phase (a)", "omega", "phi(w)");
xgrid(color("grey"));

//(f)
Xf = 0;
for n = -4:4
    Xf = Xf + (2 - 0.5*n) * exp(-%i*w*n);
end

scf(1); clf();
subplot(2,1,1); plot(w, abs(Xf)); 
xtitle("Magnitude (f)", "omega", "|X(w)|");
xgrid(color("grey"));

subplot(2,1,2); plot(w, atan(imag(Xf), real(Xf))); 
xtitle("Phase (f)", "omega", "phi(w)");
xgrid(color("grey"));

//(g)
Xg = -%i * (4*sin(2*w) + 2*sin(w));

scf(2); clf();
subplot(2,1,1); plot(w, abs(Xg)); 
xtitle("Magnitude (g)", "omega", "|X(w)|");
xgrid(color("grey"));

subplot(2,1,2); plot(w, atan(imag(Xg), real(Xg))); 
xtitle("Phase (g)", "omega", "phi(w)");
xgrid(color("grey"));
