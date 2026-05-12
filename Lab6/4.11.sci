x = [1, 0, -1, 2, 3];
n_x = -3:1;

n = -3:3;
x_ext = [1, 0, -1, 2, 3, 0, 0];
x_fold = [0, 0, 3, 2, -1, 0, 1];

xe = (x_ext + x_fold) / 2;
xo = (x_ext - x_fold) / 2;

n_y = -5:3;
xe_shifted = [2, 1, -0.5, 2, -0.5, 1, 2, 0, 0];
xo_y = [0, 0, -1, -1, -0.5, 0, 0.5, 1, 1];

y = xe_shifted - %i * xo_y;
clf();
subplot(2,1,1);
plot2d3(n_y, real(y), 2); 
re_pts = gce(); re_pts.children.mark_style = 9;
xtitle("Real part of y(n)", "n", "Re{y(n)}");
xgrid(color("grey"));
a = gca();
a.data_bounds = [-5 -2 ; 5 5];

subplot(2,1,2);
plot2d3(n_y, imag(y), 5);
im_pts = gce(); im_pts.children.mark_style = 9;
xtitle("Imaginary part of y(n)", "n", "Im{y(n)}");
xgrid(color("grey"));
a = gca();
a.data_bounds = [-5 -2 ; 5 5];

disp("Values of y(n) from n = -5 to 3:");
disp(y);
