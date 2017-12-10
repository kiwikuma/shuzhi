function detJ = getdetJacob(nodes,xi,eta)
addpath('/Users/yingxian/Documents/MATLAB/NumiP/LAB3/m-files');
dN = linquadderivref_N(xi,eta);
J = dN*nodes;
invJ = inv(J);
detJ = det(J);
end