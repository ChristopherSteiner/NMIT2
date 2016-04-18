function [x, y_euler] = diff_euler(f, a, b, n, y)
%Berechnet Anfangswertprobleme mittels Euler, Mittelpunkt und dem
%modifizertem Euler
%sample call
%f = @(x,y) x.^2./y
%[x, y_euler, y_mittelpunkt, y_modeuler] = loetsphi_steinch3_S5_Aufg3(f, 0, 2.1, 3, 2)

h = abs(a-b/n);
x = a:h:b;

%Euler

y_euler = zeros(n);
for i = 1:n
    y_euler(i+1) = y_euler(i) + h * f(x(i),y_euler(i));
end