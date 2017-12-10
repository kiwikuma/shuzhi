function KonvergenzFiniteDifferenzen()
x0 = 0.6;
h = logspace(-5,0,100);
syms x;
fx = (x/(1+x))^5;
df_wirklich = subs(diff(fx),x,0.6);
df_wirklich = double(df_wirklich);
for i = 1:100
df(i) = FuenfpunkteMittelpunktFormel(x0,h(i));
Delta_df(i) = abs(df_wirklich-df(i));
end
gx = h.^4;
clf
figure(1)
loglog(h,gx);
hold on;
loglog(h,Delta_df);
axis([10^-5,10^0,-inf,inf]);
grid minor;
end