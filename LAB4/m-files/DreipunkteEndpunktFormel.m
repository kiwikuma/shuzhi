function df = DreipunkteEndpunktFormel(x0,h)
x = x0;
y1 = (x/(1+x))^5;
x = x0+h;
y2 = (x/(1+x))^5;
x = x0+2*h;
y3 = (x/(1+x))^5;
df = 1/(2*h)*(-3*y1+4*y2-y3);
end
