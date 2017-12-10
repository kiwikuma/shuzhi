function [detJ,invJ] = getdetJacob(nodes,xi,eta)
dN = linquadderivref_N(xi,eta);
J = dN*nodes;
invJ = inv(J);
detJ = det(J);
end