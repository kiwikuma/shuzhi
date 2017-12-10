function df = FuenfpunkteMittelpunktFormel(x0,h)
for i = 1:5
    x(i) = x0 + (-3+i)*h;
end
y = (x./(1+x)).^5;
df = 1/(12*h)*(y(1)-8*y(2)+8*y(4)-y(5));
end