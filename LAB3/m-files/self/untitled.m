function val = linquaref(xi,eta)
    format long
    fx = [0 1 3 1];
    N = zeros(4,1);
    N(1) = (1-xi)*(1-eta)/4;
    N(2) = (1+xi)*(1-eta)/4;
    N(3) = (1+xi)*(1+eta)/4;
    N(4) = (1-xi)*(1+eta)/4;
    val = fx*N
end