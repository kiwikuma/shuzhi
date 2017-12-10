function m12 = mehrdimensionalenGaussQuadratur(n)
n = 1;
gaussx = gx2dref(n);
gaussw = gw2dref(n);
m12 = 0;
for i = 1:size(gaussx,1)
    xi = gaussx(i,1);
    eta = gaussx(i,2);
    N = linquadratN(xi,eta);
    detJ = getdetJacob(xi,eta);
    m12 = m12 + detJ*N(1)*N(2)*gaussw(i);
end
    m12 = double(m12);
end