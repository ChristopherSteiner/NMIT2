function [x, y_euler, y_mittelpunkt, y_modeuler] = loetsphi_steinch3_S5_Aufg3(f, a, b, n, y)
%Berechnet Anfangswertprobleme mittels Euler, Mittelpunkt und dem
%modifizertem Euler
%sample call
%f = @(x,y) x.^2./y
%[x, y_euler, y_mittelpunkt, y_modeuler] = loetsphi_steinch3_S5_Aufg3(f, 0, 2.1, 3, 2)

h = abs(a-b/n);
x = a:h:b;

%Euler
y_euler = y;
for i = 1:n
    y_euler(i+1) = y_euler(i) + h * f(x(i),y_euler(i));
end

%Mittelpunkt
y_mittelpunkt = y;
xh2 = 0;
yh2 = 0;
for i = 1:n
   xh2(i) = x(i)+h/2;
   yh2(i) = y_mittelpunkt(i)+h/2*f(x(i),y_mittelpunkt(i));
   y_mittelpunkt(i+1) = y_mittelpunkt(i) + h * f(xh2(i), yh2(i));
end

%mod Euler
y_modeuler = y;
k1 = 0;
k2 = 0;
yieuler = 0;
for i = 1:n
    yieuler(i) = y_modeuler(i) + h * f(x(i), y_modeuler(i));
    k1(i) = f(x(i), y_modeuler(i));
    k2(i) = f(x(i+1), yieuler(i));
    y_modeuler(i+1) = y_modeuler(i) + h * (k1(i) + k2(i)) / 2;
end

hold off
hy = (max(y_euler) - min(y_euler)) / n;
loetsphi_steinch3_S5_Aufg1(f, a, b, min(y_euler), max(y_euler), h, hy)
hold all
plot(x, y_euler, 'r');
plot(x, y_mittelpunkt, 'g');
plot(x, y_modeuler, 'm');
legend('Richtungsfeld','euler', 'mittelpunkt', 'mod euler')
end
