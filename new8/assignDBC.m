function [sysmat,rhs] = assignDBC(sysmat,rhs,dbc)
for i = 1:size(dbc,1)
    n = dbc(i,1);
    sysmat(n,:) = 0;
    sysmat(n,n) = 1;
    rhs(n) = dbc(i,2);
end
end