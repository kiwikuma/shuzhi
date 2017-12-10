function N = linquadref_N(xi,eta)
N = zeros(1,4);
N(1) = (1-xi)*(1-eta)/4;
N(2) = (1+xi)*(1-eta)/4;
N(3) = (1+xi)*(1+eta)/4;
N(4) = (1-xi)*(1+eta)/4;
end