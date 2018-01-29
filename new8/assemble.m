function [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele)

for i= 1:4
    rhs(ele(1,i),1) = rhs(ele(1,i),1) + elevec(i,1);
    for j= 1:4
        sysmat(ele(1,i),ele(1,j)) = sysmat(ele(1,i),ele(1,j)) + elemat(i,j);
    end
end

