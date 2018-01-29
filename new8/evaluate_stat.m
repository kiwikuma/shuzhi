function [elemat,elevec] = evaluate_stat(elenodes,gpx,gpw)

deriv_N = [];
J = [];
detJ = [];
InvJ = [];
lambda = 48;

A = zeros(4,4);


for k = 1:length(gpx)
deriv_N = linquadderivref(gpx(k,1), gpx(k,2));
[J,detJ,InvJ] = getJacobian(elenodes, gpx(k,1), gpx(k,2));

 for i = 1:4
     for j = 1:4
         A(i,j) = A(i,j) + lambda*(deriv_N(i,:)*InvJ)*(deriv_N(j,:)*InvJ)' *detJ*gpw(k,1);
     end
 end
end 

elemat = A;
 