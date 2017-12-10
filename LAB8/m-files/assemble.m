function [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele)
for i = 1:length(sysmat)
    for j = 1:length(sysmat)
        if any(ele==i)==1&&any(ele==j)==1
    m = find(ele==i);
    n = find(ele==j);
    sysmat(i,j) = sysmat(i,j)+elemat(m,n);
        end
    end
end
for i = 1:length(sysmat)
    if any(ele==i)==1
        m = find(ele==i);
        rhs(i) = rhs(i)+elevec(m);
    end
end
end
