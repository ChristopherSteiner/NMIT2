t = 0:10:120;
h = [2 286 1268 3009 5375 8220 11505 15407 20127 25593 31672 38257 44931];
m = [2051113 1935155 1799290 1681120 1567611 1475282 1376301 1277921 1177704 1075683 991872 913254 880377];

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
