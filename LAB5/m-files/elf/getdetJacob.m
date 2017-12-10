function [J,detJ,invJ] = getdetJacob(nodes,xi,eta)
%GETDETJACOB Summary of this function goes here
%   Detailed explanation goes here
addpath('C:\Users\AdminF\Desktop\PNium0\LAB5\m-files')
dN = linquadderivref_N(xi,eta);
J = dN*nodes;
detJ = det(J);
invJ = inv(J);
end

