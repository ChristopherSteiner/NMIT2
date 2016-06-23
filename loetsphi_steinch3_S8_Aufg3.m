% Anfangswertsproblem lösen
f = @(t,y) -12*y+30*exp(-2*t);
a = 0;
b = 10;
n = 1000;
y0 = 0;
h = abs(a-b/n);
x = a;
tol = 1e-3;
h_tab = h;
y_euler = y0;
y_mittelpunkt = y0;
xh2 = 0;
yh2 = 0;
i = 1;
while(x(i) < b)
   %Euler
   y_euler(i+1) = y_euler(i) + h * f(x(i),y_euler(i));
    
   %Mittelpunkt
   xh2 = x(i)+h/2;
   yh2 = y_mittelpunkt(i)+h/2*f(x(i),y_mittelpunkt(i));
   y_mittelpunkt(i+1) = y_mittelpunkt(i) + h * f(xh2, yh2);
   % b Schrittweite h adaptiv an Verhätlnisse anpassen
   if (abs(y_euler(i+1)-y_mittelpunkt(i+1)) < tol/20) 
       x(i+1) = x(i) + h;
       h = h*2;      
       i = i + 1;       
   else
       if (abs(y_euler(i+1)-y_mittelpunkt(i+1)) >= tol)
           h = h/2;
       else 
           x(i+1) = x(i) + h;
           i = i + 1;
       end
   end
   
   h_tab(i) = h;
end

figure(1)
plot(x, 3*(1-exp(-10*x)).*exp(-2*x), 'r', x, y_mittelpunkt, '--b');
legend('exakt', 'genähert');
title('Vergleich exakte und genährte Werte');
figure(2)
plot(x, h_tab)
title('Variable h in abhängigkeit zur Zeit');

% Experiment mit h:
% Inital h hat nur einen Einfluss wenn es akzieptiert wird, also die
% berechnete Differenz kleiner ist als die Toleranz. Ansonsten wird Inital h
% angepasst.
% Bei abflachender Funktionskurve wird h grösser ansonsten kleiner

% Experiment mit tol:
% niedrige Werte von tol lassen h spät steigen
% Ansonsten beeinflusst die tol natürlich die Rechengeschwindigtkeit
% massiv.