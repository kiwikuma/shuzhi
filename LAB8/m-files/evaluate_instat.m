function [elemat,elevec] = evaluate_instat(elenodes,gpx,gpw,elesol,eleosol,timInt_m,timestep,theta,firststep)

lamda = 48;
rho = 7800;
Cp = 452;
B = zeros(4);
M = zeros(4);

for i = 1:4
    for k =1:size(gpx,1)
        N = linquadref_N(gpx(k,1),gpx(k,2));
        dN = linquadderivref_N(gpx(k,1),gpx(k,2));
        [detJ,invJ] = getdetJacob(elenodes,gpx(k,1),gpx(k,2));
        for j = 1:4
            B(i,j) = B(i,j)+lamda*(invJ*dN(:,i))'*(invJ*dN(:,j))*detJ*gpw(k);
            M(i,j) = M(i,j)+rho*Cp*N(:,i)*N(:,j)*detJ*gpw(k);
        end
    end
end

LHS = zeros(4);
RHS = zeros(4);
if timInt_m == 1
for i = 1:4
    for j = 1:4
        LHS(i,j) = (M(i,j) + timestep*theta*B(i,j));
        RHS(i,j) = ((M(i,j) - timestep*(1-theta)*B(i,j)));
    end
end
end
elemat = LHS;
elevec = RHS*elesol;
end
            
              

