function m12 = mehrdimensionalenGaussQuadratur(n)
addpath('C:\Users\AdminF\Desktop\PNium0\LAB3\m-files')
n = 1;
gaussx = gx2dref(n);
gaussw = gw2dref(n);
m12 = 0;
for i = 1:size(gaussx,1);
    xi = gaussx(i,1);
    eta = gaussx(i,2);
    N = linquadref_N(xi,eta);
    detJ = getdetJacob(xi,eta);
    m12 = m12 + det*N(1)*N(2)*gaussw(i);
end
    m12 = double(m12)
end