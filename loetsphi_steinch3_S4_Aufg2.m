R = 50;
V = @(t) 3500 * sin(140*pi*t)*exp(-63*pi*t);
EV = @(t) V(t)^2/R;
E = 0;

%Energie berechnen mit Integral
for t = 0:50
  E(t+1) = loetsphi_steinch3_S3_Aufg3(EV, 0, t/1000, 3);    
end

plot(0:50, E)
% n = 3 sind zu wenig Schritte um die Aufgabe genau zu lösen, mit n = 6
% nimmt die Energie wi erwartet nicht mehr ab
f = @(t) EV(t/1000)-250;

xtol = 1;
xn1 = 0;
xn = 8;

%Nullstellen Problem mit Newton Verfahren lösen
while ((f(xn - 10^-5) * f(xn + 10^-5)) > 0)    
    %Ableitung
    fdiff = loetsphi_steinch3_S2_Aufg2(f, 0.01, xn, 3);
    %Newton Verfahren
    xn1 = xn - (f(xn)/fdiff(1,3));
    xn = xn1;    
end
% Konvergiert gegen 7,4620 was beim Graphen mit n = 3 dem Wert 250 J
% entspricht
xn
