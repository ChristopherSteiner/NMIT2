function [ Tf_neq ] = integrieren_trapez_n_aequidist( x, y )
% Trapezregel für nicht äquidistiante (nicht immer der gleiche Abstand)
% Werte

Tf_neq = 0;
for i = 1:length(x)-1
    Tf_neq = Tf_neq + (y(i) + y(i+1))/2*(x(i+1) - x(i));
end

