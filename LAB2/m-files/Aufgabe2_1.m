function Aufgabe2_1()
    s = logspace(-20,5,26);
    s = s';
    p2 = [0.0+s, 1.0-s];
    n = length(p2);
    p1 = zeros(n,2);
    p1(:,1) = p1(:,1)+0.0;
    p1(:,2) = p1(:,2)+1.0;
    x = lineintersection2(p1,p2,n);
    x = x'
    clf;
    loglog(s, abs(x-1));
end