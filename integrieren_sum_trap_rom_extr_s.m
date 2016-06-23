%Funktionswerte mit Trapezformel integrieren und mit Romberg-Extrapolation
%verbessern 
a = 0;
b = pi;
h = 0;
f = @(x) cos(x.^2);
D = 0;
for i = 0:4
    h(i+1) = (b - a) / 2^i;
    %angewandte Trapezregel 
    D(i+1, 1) = ((f(a) + f(b))./2);
    for n = 1:(2^i-1)       
        D(i+1, 1) = D(i+1, 1) + f(n.*h(i+1));        
    end    
    
    D(i+1, 1) = h(i+1) * D(i+1,1);
end
for k = 1:5
    %Romberg Extrapolation
    for i = 1:(5-k)
        D(i, k+1) = (4.^k*D(i+1,k) - D(i, k)) ./ (4.^(k)-1); 
    end
end
D