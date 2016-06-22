t = 0:10:120;
h = [2 286 1268 3009 5375 8220 11505 15407 20127 25593 31672 38257 44931];
m = [2051113 1935155 1799290 1681120 1567611 1475282 1376301 1277921 1177704 1075683 991872 913254 880377];
%Space Shuttle Berechnung
% a) Geschwindigkeit, Beschleuningung, Massenänderung(t) und Massenänderung(h) anhand Input Daten
% berechnen
v = loetsphi_steinch3_S1_Aufg3(t, h);
a = loetsphi_steinch3_S1_Aufg3(t, v);
dmdt = loetsphi_steinch3_S1_Aufg3(t, m);
dmdh = loetsphi_steinch3_S1_Aufg3(h, m);

plot(t, h, 'r');
plot(t, v, 'r');
plot(t, a, 'r');
plot(t, m, 'r');
plot(t, dmdt, 'r');
plot(t, dmdh, 'r');

plot(t, dmdt, 'r', t, dmdh .* v, 'b-.');

% b)
G = 6.673 * 10^-11;
M = 5.976 * 10^24;
R0 = 6378137;
epot = 0;
ekin = 0;
for i = 1:length(t)
    epot(i) = G * M * loetsphi_steinch3_S3_Aufg4a(R0 + h(1:i), m(1:i)./(R0 + h(1:i)).^2);
    ekin(i) = loetsphi_steinch3_S3_Aufg4a(R0 + h(1:i), dmdt .* v);
    ekin(i) = ekin(i) + loetsphi_steinch3_S3_Aufg4a(R0 + h(1:i), m.*a);
end
plot(t, epot, 'r', t, ekin, 'g', t, ekin + epot, 'b');
legend('ePot', 'eKin', 'eTot');

% c)
% etwas mehr als 63 Haushalte 
((ekin(length(t)) + epot(length(t))) / 10^10)