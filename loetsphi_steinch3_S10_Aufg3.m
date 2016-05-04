x = [1900 1910 1920 1930 1940 1950 1960 1970 1980 1990 2000];
y = [75.995 91.972 105.711 123.203 131.669 150.697 179.323 203.212 226.505 249.633 281.422];

xx = 1900:2000;
yy = loetsphi_steinch3_S10_Aufg2(x, y, xx);
yyspline = spline(x, y, xx);
yypoly = polyval(polyfit(x-1900, y, 10), xx - 1900);

plot(xx, yy, 'b', xx, yyspline, 'r--', xx, yypoly, 'g--');
legend('Spline Loetsphi steinch3', 'Spline Matlab', 'Polyfit (10)');