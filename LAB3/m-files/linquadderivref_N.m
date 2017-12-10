function dN = linquadderivref_N(xi,eta)
dN = zeros(2,4);
dN(1,1) = -(1-eta)/4;
dN(2,1) = -(1-xi)/4;
dN(1,2) = (1-eta)/4;
dN(2,2) = -(1+xi)/4;
dN(1,3) = (1+eta)/4;
dN(2,3) = (1+xi)/4;
dN(1,4) = -(1+eta)/4;
dN(2,4) = (1-xi)/4;
%dN = dN'
end