format long;
tab = 0;
x0 = 2;
% f'(x) = 2/x
D1f = @(x0, h) (log((x0 + h).^2) - log(x0.^2))/h;
D1fehler = @(x0, h) abs((D1f(x0, h) - 2/x0));
D2f = @(x0, h) (log((x0 + h).^2) - log((x0 - h).^2))/(2*h);
D2fehler = @(x0, h) abs((D2f(x0, h) - 2/x0));
for i=1:17
   tab(i, 1) = D1f(x0, 10.^-i);
   tab(i, 2) = D2f(x0, 10.^-i);
   tab(i, 3) = D1fehler(x0, 10.^-i);
   tab(i, 4) = D2fehler(x0, 10.^-i);
end
tab
% Für d1 ist h = 10^-8 am besten für d2 schon h = 10^-5
eps52 = 0.5 * 2.^-51
D1hopt = sqrt(4 * (log(4)/0.5) * eps52)
D2hopt = (6 * (log(4)/0.5)*eps52).^(1/3)
% Ja entsprechen den ausgelesenen Werten der Tabelle