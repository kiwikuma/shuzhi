function  Conver()
%CONVER Summary of this function goes here
%   Detailed explanation goes here
h = logspace(-5,0,100);
syms x;
fx = (x/(1+x))^5;
y_wirklich = subs(diff(fx),x,0.6);
for i = 1:100
    y(i) = FDM(0.6,h(i));
    Delta_df(i) = abs(double(y_wirklich)-y(i));
end

gx = h.^4;
gx2=h.^2
gx=
clf
figure(1)
loglog(h,gx);
hold on;
loglog(h,gx2);
hold on
loglog(h,Delta_df);
axis([10^-5,10^0,-inf,inf]);
grid minor
end