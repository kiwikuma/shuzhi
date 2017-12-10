function Aufgabe2()
format long
x = linspace(0,4,100);
y = (x./(1+x)).^5;
dy = 5*(x./(1+x)).^4.*(1./(1+x)).^2;
Lag = zeros(1,100);
LagDiv = zeros(1,100);
for i = 1:100
    Lag(i) = LagrangePolynom(x(i));
    LagDiv(i) = LagrangeDerivPolynom(x(i));
end
figure(1)
hold on
plot(x,y,'--k','linewidth',3);
plot(x,Lag,'r','linewidth',3);
plot(x,dy,'--b','linewidth',2);
plot(x,LagDiv,'g','linewidth',2);
legend('Exakter wert','LagPol','Exakter Divwert','LagDiv');
end