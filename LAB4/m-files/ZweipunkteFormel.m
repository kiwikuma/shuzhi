function df = ZweipunkteFormel(x0,h)
x = x0 - h;
y1 = (x/(1+x))^5;
x = x0;
y2 = (x/(1+x))^5;
df = (y2-y1)/h;
end