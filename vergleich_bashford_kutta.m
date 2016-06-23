% Vegleich Adam Bashford, Runge Kutta
f = @(t, y) t.^2 + 0.1*y;
yab4 = 0;
tocAB = 0;
tocRK = 0;
[t45, y45] = ode45(f, [-1.5 1.5], 1);
yExact = y45(end);
yABError = 0;
yRKError = 0;
for i = 1:4
    tic;    
    [xab4, yab4] = diff_adam_bashford(f, -1.5, 1.5, 10.^i, 1);
    tocAB(i) = toc;
    yABError(i) = abs(yab4(end)-yExact);
    tic;
    [xRK, yRK]= diff_runge_kutta(f, -1.5, 1.5, 10.^i, 1);
    tocRK(i) = toc;
    yRKError(i) = abs(yRK(end)-yExact);
end

% hold off
% semilogy(1:4, yABError); 
% hold all
% semilogy(1:4, yRKError);

semilogy(1:4, tocAB, 'r', 1:4, tocRK, 'b');
% Runge-Kutta scheint besser zu sein beim globalen Fehler mit der gleichen
% Anzahl Schritte. AB ist bei uns langsämer wie RK, unter anderem weil wir
% in der Funktion von AB den gesamten RK ausführen, was man eigentlich nur
% bis zu den ersten 4 Werten machen müsste.