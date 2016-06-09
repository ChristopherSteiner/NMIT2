% Ausgleichfunktion mit Normalgleichung 
x = 0:10:100;
y = [999.9 999.7 998.2 995.7 992.2 988.1 983.2 977.8 971.8 965.3 958.4];
p = @(T) a*T.^2+b*T+c;
p1 = @(T) T.^2;
p2 = @(T) T.^1;
p3 = @(T) T.^0;

A = [ p1(x)' p2(x)' p3(x)' ];
%A'*A*lambda = A'*y
lambda = A'*A\(A'*y');
a = lambda(1);
b = lambda(2);
c = lambda(3);

%Plots der Daten und p(T)
plot(x, y, 'rx', x, p(x), 'b');
legend('Messpunkte', 'p(T)');

%Konditionszahl
cond(A'*A)
[lambda polyfit(x,y,2)']

%Eine schlecht konditionierte Matrix wirkt sich negativ auf die berechneten
%Koeffizienten aus. Die Ursache für eine schlecht konditionierte Matrix
%sind eine schlechte Ansatzfunktion oder Messwerte.