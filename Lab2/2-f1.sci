u=-5:5;
dsig = bool2s(u>=0);
x=-5:1:5;
y=x.*dsig;
plot(x,y);
