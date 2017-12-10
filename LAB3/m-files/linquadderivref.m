function val = linquadderivref(xi,eta,fx)

dN = linquadderivref_N(xi,eta);
val(1) = fx*dN(:,1);
val(2) = fx*dN(:,2);
end