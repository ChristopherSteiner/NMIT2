
t = 0+(1:1000)*0.1;
y = 10.*exp(-0.05.*t).*cos(0.2.*pi.*t);
v = ableiten_funkt(t, y);
a = ableiten_funkt(t, v);
plot(t, y,'r',t,v,'g',t,a,'b')
%Die Gewschwindigkeit hat die Nulldurchgänge kurz bevor das Pendel in der Mitte
%ankommt
%Die Bewegung wird abgebremst, und es kommt irgendwann zum stehen.