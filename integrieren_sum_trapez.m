function [ T ] = integrieren_sum_trapez( f, a, b, n )
% Berechnet ein Integral mit der summierten Trapezformel
% und anschliessend mit Romberg extrapoliert
% sample call:
%    f = @(x) cos(x.^2)
%    integrieren_sum_trapez(f, 0, pi, 5)

T = 0;
for i = 0:(n-1)
    h(i+1) = (b - a) / 2^i;
    
    D(i+1) = ((f(a) + f(b))./2);
    for j = 1:(2^i-1)       
        D(i+1) = D(i+1) + f(j.*h(i+1));        
    end    
    D(i+1) = h(i+1) * D(i+1);
end


T = D;
end