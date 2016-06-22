function [ Tf_neq ] = loetsphi_steinch3_S3_Aufg4a( x, y )
% Trapezregel für nicht äquidistiante (nicht immer der gleiche Abstand)
% Werte
% Sample Call
% m = @(r, p) p .* 4 .* pi .* r.^2;
% r = [ 0; 800; 1200; 1400; 2000; 3000; 3400; 3600; 4000; 5000; 5500; 6370];
% p = [ 13000; 12900; 12700; 12000; 11650; 10600; 9900; 5500; 5300; 4750; 4500; 3300];
% 
% m = loetsphi_steinch3_S3_Aufg4a(r*1000,m(r*1000,p));

Tf_neq = 0;
for i = 1:length(x)-1
    Tf_neq = Tf_neq + (y(i) + y(i+1))/2*(x(i+1) - x(i));
end

