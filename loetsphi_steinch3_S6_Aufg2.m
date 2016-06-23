%Kugelförmiger Wassertank entleert sich durch ein kleines Loch
a = 0;
b = 24000;
n = abs((b-a)/4000);
g = 9.81;
r = 0.02;
R = 4;
h0 = 6.5;
f = @(t,h) -((r.^2*sqrt(2*g*h))/(2*h*R-h.^2));
[x, y] = diff_runge_kutta(f, a, b, n, h0)
[x2, y_euler, y_mittelpunkt, y_modeuler] = loetsphi_steinch3_S5_Aufg3(f, a, b, n, h0)

clf %Clear plot from loetsphi_steinch3_S5_Aufg3
hold on
%a Runge Kutta Verfahren
plot(x, y, 'b')
%bc Euler Verfahren
plot(x2, y_euler, 'r');
% Mittelpunkt Verfahren
plot(x2, y_mittelpunkt, 'g');
% Modifiziertes Euler Verfahren
plot(x2, y_modeuler, 'm');
legend('runge-kutta','euler', 'mittelpunkt', 'mod euler')