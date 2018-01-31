function [elemat,elevec] = evaluate_stat(elenodes,gpx,gpw)
gpx = gx2dref(3);
gpw = gw2dref(3);
lamda = 48;
elemat = zeros(4);
elevec = zeros(4,1);
q_punkt = 0;

for i = 1:4
    for k = 1:size(gpx,1)
        dN = linquadderivref_N(gpx(k,1),gpx(k,2));
        N = linquadref_N(gpx(k,1),gpx(k,2));
        [detJ,invJ] = getdetJacob(elenodes,gpx(k,1),gpx(k,2));
        for j = 1:4
            elemat(i,j) = elemat(i,j)+lamda*(invJ*dN(:,i))'*(invJ*dN(:,j))*detJ*gpw(k);
        end
        %elevec(i) = elevec(i) + q_punkt*N(i)*detJ*gpw(k);
    end
end
end
            
              

