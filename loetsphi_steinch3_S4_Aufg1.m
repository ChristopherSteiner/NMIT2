t = 0:10:120;
h = [2 286 1268 3009 5375 8220 11505 15407 20127 25593 31672 38257 44931];
m = [2051113 1935155 1799290 1681120 1567611 1475282 1376301 1277921 1177704 1075683 991872 913254 880377];
%Space Shuttle Berechnung
% a) Geschwindigkeit, Beschleuningung, Massen�nderung(t) und Massen�nderung(h) anhand Input Daten
% berechnen
v       = ableiten_funkt(t, h);
a       = ableiten_funkt(t, v);
dmdt    = ableiten_funkt(t, m);
dmdh    = ableiten_funkt(h, m);

plot(t, h, 'r');
plot(t, v, 'r');
plot(t, a, 'r');
plot(t, m, 'r');
plot(t, dmdt, 'r');
plot(t, dmdh, 'r');

plot(t, dmdt, 'r', t, dmdh .* v, 'b-.');

% b) potentielle und kinetische Energie zu jedem Zeitpunkt berechnen
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

% c) Wieviel Schweizer Haushalte k�nnen mit der verbrauchten Energie nach
% 120s versorgt werden? (f�r ein ganzes Jahr)
% etwas mehr als 63 Haushalte 
((ekin(length(t)) + epot(length(t))) / 10^10)