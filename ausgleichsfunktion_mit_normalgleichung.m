%Achtung Vektoren sind in Zeilenform anstatt normale Vektoren darum sind
%die Transponierten Vektoren und Matrizen aus dem Skript die nicht
%transponierten und umgekehrt.
%Skript ist momentan nur eine Iteration es müsste noch eine While Schleife
%darum gebaut werden welche zum Beispiel überprüft ob Delta die gewünschte
%Genauigkeit erreicht hat.
lambda = [ 1 2 2 1];
prec = 10^-5;
t = [ 0.1 0.3 0.7 1.2 1.6 2.2 2.7 3.1 3.5 3.9 ];
y(1,:) = [ 0.558 0.569 0.176 -0.207 -0.133 0.132 0.055 -0.090 -0.069 0.027 ];

f = @(x0, delta, omega, phi) x0 .* exp(-delta.*t) .* sin(omega.*t + phi);
fDiffx0 = @(x0, delta, omega, phi) -exp(delta.*-t).*sin(t.*omega.*phi);
fDiffDelta = @(x0, delta, omega, phi) -t .* x0.*(-exp(delta.*-t)).* sin(t .* omega + phi);
fDiffOmega = @(x0, delta, omega, phi) -t .* x0 .* exp(delta.*-t).*cos(t.*omega+phi);
fDiffPhi =  @(x0, delta, omega, phi) -x0 .* exp(delta .* -t) .* cos(t .* omega +phi);

g = y(1,:) - f(lambda(1), lambda(2), lambda(3), lambda(4));
Dg(1,:) =  fDiffx0(lambda(1), lambda(2), lambda(3), lambda(4));
Dg(2,:) =  fDiffDelta(lambda(1), lambda(2), lambda(3), lambda(4));
Dg(3,:) =  fDiffOmega(lambda(1), lambda(2), lambda(3), lambda(4));
Dg(4,:) =  fDiffPhi(lambda(1), lambda(2), lambda(3), lambda(4));

% Nicht das Delta aus der Funktion f sondern die Abweichung
deltaVektor = (Dg * Dg')\(Dg * g');
lambda = deltaVektor' + lambda(1,:)
