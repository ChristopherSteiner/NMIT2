function [ T ] = integrieren_sum_trap_rom_extr( f, a, b, n )
% Berechnet ein Integral mit der summierten Trapezformel
% und anschliessend mit Romberg extrapoliert
% sample call:
%    f = @(x) cos(x.^2)
%    loetsphi_steinch3_S3_Aufg3(f, 0, pi, 5)

T = 0;
for i = 0:(n-1)
    h(i+1) = (b - a) / 2^i;
    
    D(i+1, 1) = ((f(a) + f(b))./2);
    for j = 1:(2^i-1)       
        D(i+1, 1) = D(i+1, 1) + f(j.*h(i+1));        
    end    
    D(i+1, 1) = h(i+1) * D(i+1,1);
end
for k = 1:n
    for i = 1:(n-k)
        D(i, k+1) = (4.^k*D(i+1,k) - D(i, k)) ./ (4.^(k)-1); 
    end
end

T = D(1,n);
end