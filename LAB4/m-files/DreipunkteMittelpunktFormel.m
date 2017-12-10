function df = DreipunkteMittelpunktFormel(x0,h)
x = x0-h;
y1 = (x/(1+x))^5;
x = x0+h;
y3 = (x/(1+x))^5;
df = 1/(2*h)*(y3-y1);
end