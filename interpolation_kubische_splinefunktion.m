function [yy] = interpolation_kubische_splinefunktion(x,y,xx)
% Berechnet die kubische Splinefunktion 
% x muss aufsteigend sortiert sei
% Sample Call:
% x = [ 0 1 2 3 ]
% y = [ 2 1 2 2 ]
% xx = [ 0.5 0.8 1.1 2.2]
% loetsphi_steinch3_S10_Aufg2(x,y,xx)

n = length(x) - 1;
h = x(2:n+1) - x(1:n);
for j=2:n-2
    z(j-1,1) =  3 * ((y(j+1)-y(j))/ h(j)) - 3 * ((y(j)-y(j-1))/h(j-1));    
end
z(n-1,1) = 3 * ((y(n+1) - y(n)) / h(n)) - 3 * ((y(n)-y(n-1)) / h(n-1));
A = diag(h(2:n-1), 1) + diag(h(2:n-1), -1) + diag((h(1:n-1) + h(2:n)));
c = A\z;
c(2:n) = c(1:n-1);
c(1) = 0;
c(n+1) = 0;
c = c.';
d = (1 ./ (3*h)) .* (c(2:n+1) - c(1:n));
b = (y(2:n+1)-y(1:n))./h - (h/3) .* ((c(2:n+1)+2*c(1:n)));

for j=1:n
    S = @(inp) y(j) + b(j)*(inp-x(j)) + c(j)*(inp-x(j)).^2 + d(j)*(inp-x(j)).^3;
    r = find(x(j)<=xx & xx<=x(j+1));        
    yy(r) = S(xx(r));
end

end

