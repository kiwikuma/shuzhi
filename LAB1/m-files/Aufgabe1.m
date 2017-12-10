function Aufgabe1()
A = diag([3 3 3 3],0);
v = [1;2;3;4];
a = v'*v;
B = v*v';
C = A*B;
Eigenwert = eig(C);
X = (C-A)\(a*v);
C(:,2) = v;
b = C(3,:);
c = [10:0.5:100];
f = c.*(5+c)+1./c+2.^c;
l = length(f);
end