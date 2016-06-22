function [ dx ] = loetsphi_steinch3_S1_Aufg3( x, y )
%Erste Ableitung numerisch berechnen
dx = 0; % Steigungen
n = length(x);
%Für ersten Wert wird die Vorwärtsdifferenz benutzt
dx(1) = (y(2)-y(1))/(x(2)-x(1));
%Für alle Werte dazwischen die zentrale Differenz
for i = 2:n-1
    dx(i) = (y(i+1)-y(i-1))/(x(i+1)-x(i-1));
end
%Für den letzten Wert muss die Rückwärtsdifferenz benutzt werden
dx(n) = (y(n)-y(n-1))/(x(n)-x(n-1)); 
end

