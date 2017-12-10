function Lag = LagrangePolynom(x)
format long
x_node = [0,1,2,3,4,5];
f_node = [0,0.031250000000,0.131687242798,0.237304687500,0.327680000000];
n = 4;
%x_node = linspace(0,4,81);
%f_node = (x_node./(1+x_node)).^5;
%n = 80;
LagrangeBasis = zeros(1,n+1);
for i = 1:n+1
   LagrangeBasis(i) = 1;
    for k = 1:n+1
        if k ~= i
            LagrangeBasis(i) = LagrangeBasis(i) * (x-x_node(k))/(x_node(i)-x_node(k));
        end
    end
end
Lag = 0;
for i =1:n+1
    Lag = Lag + LagrangeBasis(i)*f_node(i);
end
end