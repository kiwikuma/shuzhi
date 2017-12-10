function gaussx = gx2dref(n)

gx1 = gx(n);
gx2 = gx(n);
gaussx = [0,0];
for i = 1:n
    for j = 1:n
    A = [gx1(i),gx2(j)];
    x = [gaussx;A];
    gaussx = x;
    disp(gaussx)
    end
end
gaussx(1,:) = [];
end
