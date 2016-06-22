function [ D ] = h2_extrap_f(f, h0, x0, n)
%h2 Algorithmus
%sample call: loetsphi_steinch3_S2_Aufg2(@(x) log(x.^2), 0.1, 2, 4)
h(1) = h0;
for i = 2:n
    h(i) = h(i-1) / 2;
end
for i = 1:n
   D(i, 1) = (f(x0 + h(i)) - f(x0)) / h(i); 
end
for k = 1:n
    for i = 1:(n-k)
        D(i, k+1) = (4.^k*D(i+1,k) - D(i, k)) / (4.^(k)-1); 
    end
end