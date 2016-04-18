function [x,y_modeuler] = diff_mod_euler(f, a, b, n, y)
%Berechnet Anfangswertprobleme mittels Euler, Mittelpunkt und dem
%modifizertem Euler
%sample call
%f = @(x,y) x.^2./y
%[x, y_euler, y_mittelpunkt, y_modeuler] = loetsphi_steinch3_S5_Aufg3(f, 0, 2.1, 3, 2)

h = abs(a-b/n);
x = a:h:b;

%mod Euler
y_modeuler = y;
k1 = zeros(n);
k2 = zeros(n);
yieuler = zeros(n);
for i = 1:n
    yieuler(i) = y_modeuler(i) + h * f(x(i), y_modeuler(i));
    k1(i) = f(x(i), y_modeuler(i));
    k2(i) = f(x(i+1), yieuler(i));
    y_modeuler(i+1) = y_modeuler(i) + h * (k1(i) + k2(i)) / 2;
end

