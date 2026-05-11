A = 1; a = 2;
F = -5:0.01:5;

// --- Part (a) ---
Xa = A ./ (a + %i*2*%pi*F);
scf(0); clf();
subplot(2,1,1); 
plot(F, abs(Xa)); 
xtitle("Magnitude 4.2a", "F", "|X(F)|"); 
xgrid();
subplot(2,1,2); 
plot(F, atan(imag(Xa), real(Xa))); 
xtitle("Phase 4.2a", "F", "phi(F)"); 
xgrid();

// --- Part (b) ---
Xb = (2*a*A) ./ (a^2 + (2*%pi*F).^2);
scf(1); clf();
subplot(2,1,1); 
plot(F, abs(Xb)); 
xtitle("Magnitude 4.2b", "F", "|X(F)|"); 
xgrid();
subplot(2,1,2); 
plot(F, zeros(1, length(F))); 
xtitle("Phase 4.2b (Constant 0)", "F", "phi(F)"); 
gca().data_bounds = [-5, -1; 5, 1]; xgrid();
