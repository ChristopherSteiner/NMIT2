function [x, yab4] = diff_adam_bashford(f, a, b, n, y0)
% Löst das Anfangsproblem auf dem Intervall a b mit n Schritten gemäss der
% Adam-Bashford Methode 4. Ordnung
x =0;
%Erste 4 Startwerte müssen mit Adam Bashford berechnet werden.
[xRC, yRC] = diff_runge_kutta(f, a, b, n, y0);
h = abs((b-a)/n);
s = 3;
for i=1:4
   x(i) = xRC(i);
   yab4(i) = yRC(i); 
end

for i=4:n    
    b = 0;
    for j = 0:s
       if j == 0       
          fab = @(u) (u+1).*(u+2).*(u+3);       
       else
          fab = @(u) (u+0).*(u+1).*(u+2).*(u+3)./(u+j);
       end
       b(j+1) = (-1)^j / (factorial(j)*factorial(s-j)); 
       b(j+1) = b(j+1)*integrieren_sum_trap_rom_extr(fab, 0, 1, 5);        
    end
    bFertig = 0;
    for bCounter = 1:4
        bFertig = bFertig + (b(bCounter).*f(x(i),yab4(i)));
    end
    
    x(i+1) = x(1) + h*(i);
    yab4(i+1) = yab4(i) + h .* bFertig;
end

end

