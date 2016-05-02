function [ yj ] = loetsphi_steinch3_S9_Aufg3( x, y, xj)
% Berechnet einen Wert mittels Aitken-Neville
% Sample Call:
%       x = [0; 2500; 5000; 10000];
%       y = [1013; 747; 540; 226];
%       loetsphi_steinch3_S9_Aufg3(x, y, 1250)

iEnd = length(x);
p = sym(zeros(iEnd, iEnd));
p(:, 1) = y;
syms a
for i = 2:iEnd
   for j = 2:i
       p(i,j) = ((x(i)-a)*p(i-1, j-1)+(a-x(i-j+1))*p(i, j-1))/(x(i) - x(i-j+1));
   end
end
f = matlabFunction(p(iEnd, iEnd));
yj = f(xj);
end

