function x=getPos(xi,eta)
format long
addpath('C:\Users\AdminF\Desktop\PNium0\LAB3\m-files')
nodes = [2,1;4,1;4,3;2,2]
N = linquadref_N(xi,eta)
x = N*nodes;
end