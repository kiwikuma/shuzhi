function LagDiv = LagrangeDerivPolynom(x)
x_node = [0,1,2,3,4,5];
f_node = [0,0.031250000000,0.131687242798,0.237304687500,0.327680000000];
n = 4;
%x_node = linspace(0,4,81);
%f_node = (x_node./(1+x_node)).^5;
%n = 80;
LagrangeDerivBasis = zeros(1,n+1);
for i = 1:n+1
    LagrangeDerivBasis(i) = 0;
    for m = 1:n+1
        LagrangeDerivBasis_2 = 1;
        if m ~= i
            LagrangeDerivBasis_1 = 1/(x_node(i)-x_node(m));
            for k = 1:n+1
                if k ~= i && k ~= m
                    LagrangeDerivBasis_2 = LagrangeDerivBasis_2 * (x-x_node(k))/(x_node(i)-x_node(k));
                end   
            end
        LagrangeDerivBasis(i) = LagrangeDerivBasis(i) + LagrangeDerivBasis_1 * LagrangeDerivBasis_2;    
        end
    end
end
LagDiv = 0;
for i = 1:n+1
    LagDiv = LagDiv + LagrangeDerivBasis(i)*f_node(i);
end
end
    
        
            
            