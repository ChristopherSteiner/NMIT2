f = @(x, y) x^2 / y;
f_exakt = @(x) sqrt(2*x^3/3+4);
a = 0;
b = 10;
n = abs((b-a)/0.1);
y0 = 2;
y_exakt = 0;

[x, y] = loetsphi_steinch3_S6_Aufg1(f, a, b, n, y0)
[x2, y_euler, y_mittelpunkt, y_modeuler] = loetsphi_steinch3_S5_Aufg3(f, a, b, n, y0)
for i = 0:n
    y_exakt(i+1) = f_exakt(a+0.1*i);
end

figure(1)
hold off
plot(x, y, 'b')
hold all
plot(x2, y_euler, 'r');
plot(x2, y_mittelpunkt, 'g');
plot(x2, y_modeuler, 'm');
legend('runge-kutta','euler', 'mittelpunkt', 'mod euler')

figure(2)
hold off
semilogy(x, abs(y_exakt-y), 'b');
hold all
semilogy(x2, abs(y_exakt-y_euler), 'r');
semilogy(x2, abs(y_exakt-y_mittelpunkt), 'g');
semilogy(x2, abs(y_exakt-y_modeuler), 'm');

legend('runge-kutta','euler', 'mittelpunkt', 'mod euler')
