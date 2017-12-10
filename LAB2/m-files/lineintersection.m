function X = lineintersection(P1,P2,n)
Y = zeros(n,1);
for i = 1:n
   a = (P2(i,1)-P1(i,1));
   k = (P2(i,2)-P1(i,2))/(P2(i,1)-P1(i,1));
if a == 0
   X(i) = 0;
elseif k == 0
   X(i) = NaN;
else
b = P1(i,2)-P1(i,1)*k;
X(i) = (Y(i) - b)/k;
end
end
end