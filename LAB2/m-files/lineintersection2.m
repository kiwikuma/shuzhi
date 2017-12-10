function x = lineintersection2(p1,p2,n)
    y = zeros(n,2);
    a = p2(i,1)-p1(i,1);
    k = (p2(i,2)-p1(i,2))/(p2(i,1)-p1(i,1));
    for i = 1:n
        if a == 0
            x(i) = 0;
        elseif k == 0
            x(i) = NaN;
        else
            b = p1(i,2)-p1(i,1)*k;
            x(i) = (y(i) - b)/k;
        end
    end
end