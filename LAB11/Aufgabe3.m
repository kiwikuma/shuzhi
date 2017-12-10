function Aufgabe3()
n = 300;
Phi = [10.0,6.0,5.1,5.01,5.001,5.00001,5.0000001,5.00000000001];
x = zeros(n,4);
for i = 1:length(Phi)
A = diag(Phi(i)*ones(n,1)) + diag(-2*ones(n-1,1),1) + diag(-2*ones(n-1,1),-1);
A(1,1) = 1;
b = ones(n,1);
x0 = zeros(n,1);
tic
x(:,1) = solveG(A,b,x0,1e-7,10000);
toc
tic
x(:,2) = solveCG(A,b,x0,1e-7,10000);
toc
tic
x(:,3) = solveGauss(A,b);
toc
tic
x(:,4) = inv(A)*b;
toc
end
end