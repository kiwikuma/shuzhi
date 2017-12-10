function Fx = Trapezregel(a,b)
x = a;
fx1 = x^5/(1+x)^5;
x = b;
fx2 = x^5/(1+x)^5;
Fx = (b-a)*(fx1+fx2)/2;
end