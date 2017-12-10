function Aufgabe1()
s = logspace(-20,5,26);
s = s';
P2 = [0.0+s,1.0-s]
n = length(P2)
P1 = zeros(n,2)
P1(:,1) = P1(:,1) + 0.0;
P1(:,2) = P1(:,2) + 1.0;
X = lineintersection(P1,P2,n);
X = X';
clf;
loglog(s,abs(X-1));
axis([10^-20,10^5,0,inf]);
grid on;
end

