function Ig = GaussQuadratur(n,a,b)
gaussx = gx(n);
gaussw = gw(n);
x = (b-a)/2.*gaussx+(a+b)/2
for i = 1:n
fx(i) = (x(i))^5/(1+x(i))^5
end
Ig = gaussw*fx'
Ig = Ig*(b-a)/2;
end