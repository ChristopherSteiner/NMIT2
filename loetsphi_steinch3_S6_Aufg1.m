function [x, y] = loetsphi_steinch3_S6_Aufg1(f, a, b, n, y0)
a
b
n
y0
%Berechnet das Anfangswertproblem mit Runge-Kutta
%Sample Call
% f = @(x,y) x.^2+0.1*y
% [x, y] = loetsphi_steinch3_S6_Aufg1(f, -1.5, 1.5, 5, 0)

    k1 = 0;
    k2 = 0;
    k3 = 0;
    k4 = 0;
    h = abs((b-a)/n);
    h
    x = a:h:b;
    x
    vectorSize = size(y0,2);
    y(1:vectorSize, 1) = y0;  
    
    for i = 1:n
        i
        k1 = f(x(i), y(1:vectorSize,i));
        k2 = f(x(i) + h/2, y(1:vectorSize, i) + h/2.*k1);
        k3 = f(x(i) + h/2, y(1:vectorSize, i) + h/2*k2);
        k4 = f(x(i) +h, y(1:vectorSize, 1)+h*k3);        
        y(1:vectorSize, i+1) = y(1:vectorSize, i)+h/6*(k1+2*k2+2*k3+k4);
    end
end