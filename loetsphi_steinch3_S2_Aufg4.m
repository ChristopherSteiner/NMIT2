t = @(v, m) m./(-v.*sqrt(v));
result = integral(@(v)t(v,10),20,5);

mass = 10;
n = 5;
a = 20;
b = 5;
stepsize = (b-a)./n;
resultR = 0;
resultT = 0;
for i=1:n
   rA = a + ((i-1) .* stepsize);
   rB = a + (i .* stepsize);
   resultR = resultR + (t((rA + rB)./2, mass).*(rB-rA));
   resultT = resultT + ((t(rA, mass) + t(rB, mass))/2).*(rB-rA);
end
resultR
errorR = abs(resultR - result)
resultT
errorT = abs(resultT- result)
