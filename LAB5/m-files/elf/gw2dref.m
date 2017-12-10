function gaussx = gw2dref(n)
gw1 = gw(n);
gw2 = gw(n);
gaussx = [0,0];
for i = 1:n
    for j = 1:n 
        A = [gw1(i),gw2(j)];
        temp_x = [gaussx;A];
        gaussx = temp_x;
    end
end
gaussx(1,:) = [];
end

