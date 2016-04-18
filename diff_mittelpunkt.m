function [x, y_mittelpunkt] = loetsphi_steinch3_S5_Aufg3(f, a, b, n, y)
%Berechnet Anfangswertprobleme mittels Euler, Mittelpunkt und dem
%modifizertem Euler
%sample call
%f = @(x,y) x.^2./y
%[x, y_euler, y_mittelpunkt, y_modeuler] = loetsphi_steinch3_S5_Aufg3(f, 0, 2.1, 3, 2)

h = abs(a-b/n);
x = a:h:b;

%Mittelpunkt
y_mittelpunkt = y;
xh2 = zeros(n);
yh2 = zeros(n);
for i = 1:n
   xh2(i) = x(i)+h/2;
   yh2(i) = y_mittelpunkt(i)+h/2*f(x(i),y_mittelpunkt(i));
   y_mittelpunkt(i+1) = y_mittelpunkt(i) + h * f(xh2(i), yh2(i));
end