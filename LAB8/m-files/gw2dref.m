function gaussw = gw2dref(n)
gw1 = gw(n);
gw2 = gw(n);
gaussw = 0;
for i = 1:n
    for j = 1:n
        A = gw1(i)*gw2(j);
        w = [gaussw;A];
        gaussw = w;
    end
end
gaussw(1) = [];
end
