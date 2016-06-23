function [ ] = diff_meshgrid(f, xmin, xmax, ymin, ymax, hx, hy)
%Zeigt das Richtungsfeld der Funktion auf
%sample call
%f = @(x, y) x.^2.*y.^2
%loetsphi_steinch3_S5_Aufg1(f, 0, 5, 0, 3, 0.1, 0.1)
[X, Y] = meshgrid(xmin:hx:xmax, ymin:hy:ymax);

Ydiff = f(X, Y);
quiver(X, Y, ones(size(X, 1), size(X, 2)), Ydiff); 

end

