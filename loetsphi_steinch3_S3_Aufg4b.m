%Skript für Aufruf von Funktion 4a
m = @(r, p) p .* 4 .* pi .* r.^2;
r = [ 0; 800; 1200; 1400; 2000; 3000; 3400; 3600; 4000; 5000; 5500; 6370];
p = [ 13000; 12900; 12700; 12000; 11650; 10600; 9900; 5500; 5300; 4750; 4500; 3300];

m = loetsphi_steinch3_S3_Aufg4a(r*1000,m(r*1000,p));
mWikipedia = 5.974*10^24;
absFehler =  abs(m - mWikipedia);
relFehler = abs(m - mWikipedia) / abs(mWikipedia);
absFehler
relFehler