function X = getxPos(xi,eta)
addpath('/Users/yingxian/Documents/MATLAB/NumiP/LAB3/m-files');
nodes = [2,1;4,1;4,3;2,2];
N = linquadref_N(xi,eta);
X = N*nodes;
end