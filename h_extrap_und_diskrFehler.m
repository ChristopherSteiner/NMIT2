% h-Extrapolation und Diskretisierungsfehler
h = [ 0.1 0.05 0.025 0.0125 ];
f = @(x, h) (log((x + h).^2) - log(x.^2)) / h;
d = 0;
e = 0;
for i = 1:4
   d(i, 1) = f(2, h(i));
end
d(1,2) = 2 * d(2, 1) - d(1, 1);
d(2,2) = 2 * d(3, 1) - d(2, 1);
d(3,2) = 2 * d(4, 1) - d(3, 1);

d(1,3) =(4 * d(2, 2) - d(1,2)) / 3;
d(2,3) =(4 * d(3, 2) - d(2,2)) / 3;

d(1,4) =(8 * d(2,3) - d(1,3)) / 7;

d

for i = 1:4
   n = 4;
   for j = 1:n
       e(i, j) = abs(d(i,j)-1);
   end
end

e