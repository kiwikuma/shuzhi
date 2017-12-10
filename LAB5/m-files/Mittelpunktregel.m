function Fx = Mittelpunktregel(a,b)
x = (a+b)/2;
fx = x^5/(1+x)^5;
Fx = (b-a)*fx;
end