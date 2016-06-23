% Adam Bashford Methode 4ter Ordnung
% f = @(t, y) t.^2 + 0.1*y;
% loetsphi_steinch3_S7_Aufg2(f, -1.5, 1.5, 10.^i, 1)
b = 0;
s = 3;
n = 5;
for j = 0:3     
   if j == 0       
      f = @(u) (u+1).*(u+2).*(u+3);       
   else
      f = @(u) (u+0).*(u+1).*(u+2).*(u+3)./(u+j);
   end
   b(j+1) = (-1)^j / (factorial(j)*factorial(s-j)); 
   b(j+1) =  b(j+1)*loetsphi_steinch3_S3_Aufg3(f, 0, 1, 5);
end

b.*24 % 55   -59    37    -9
% Die Berechnung oben ist die Berechnung der b's. Diese b * 24 ergeben die
% Lösung gemäss der Aufgabe