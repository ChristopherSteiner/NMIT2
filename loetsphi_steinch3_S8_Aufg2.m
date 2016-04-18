c = 0.16;
m = 1;
l = 1.2;
g = 9.81;

phi = @(t, z)[z(2); -c/m*z(2)-g/l*sin(z(1))];
phi0 = [pi/2 0];
a = 0;
b = 60;
h = 0.1;
n = abs(b-a)/h;
[t, y] = loetsphi_steinch3_S6_Aufg1(phi, a, b, n, phi0);


plot(t,y(1, :));
ylim([-2 2]);