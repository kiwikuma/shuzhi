function dN = linquadderivref_N(xi,eta)
dN = zeros(2,4);
dN(1,1) = -(1-eta)/4;
dN(2,1) = -(1-xi)/4;
dN(1,2) = (1-eta)/4;
dN(2,2) = -(1+xi)/4;
dN(1,3) = (1+eta)/4;
dN(2,3) = (1+xi)/4;
dN(1,4) = -(1+eta)/4;
dN(2,4) = (1-xi)/4;
end
--------------------------------------------------------
function N = linquadref_N(xi,eta)
N = zeros(1,4);
N(1) = (1-xi)*(1-eta)/4;
N(2) = (1+xi)*(1-eta)/4;
N(3) = (1+xi)*(1+eta)/4;
N(4) = (1-xi)*(1+eta)/4;
end

--------------------------------------------------
function x = solveCG(A,b,x0,r_tol,iter_max)
format long
r0 = b - A*x0;
p0 = r0;
k = 0;
while (norm(r0)>r_tol && k<=iter_max)
v0 = A*p0;
alpha = (r0'*r0)/(p0'*v0);
x1 = x0 + alpha*p0;
r1 = r0 - alpha*v0;
Beta = (r1'*r1)/(r0'*r0);
p1 = r1 + Beta*p0;
k = k+1;
x0 = x1;
p0 = p1;
r0 = r1;
end
W = sprintf('k2 = %d',k);
disp(W);
x = x0;
end

-------------------------------------------------------------
function x = solveG(A,b,x0,r_tol,iter_max)
format long
r0 = b - A*x0;
k = 0;
while (norm(r0)>r_tol && k<=iter_max)
v0 = A*r0;
alpha = (r0'*r0)/(r0'*v0);
x1 = x0 + alpha*r0;
r1 = r0 - alpha*v0;
k = k+1;
x0 = x1;
r0 = r1;
end
W = sprintf('k1 = %d',k);
disp(W);
x = x0;
end

------------------------------------------------------------------------------
function x = solveGauss(A,b)
format long;
n = length(A);
for i = 1:n-1
    for j = (i+1):n
    m = A(j,i)/A(i,i);
    A(j,:) = A(j,:) - m*A(i,:);
    b(j) = b(j) - m*b(i);
    end
end
x = zeros(n,1);
x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    for j = i+1:n
        b(i) = b(i) - A(i,j)*x(j);
    end
    x(i) = b(i)/A(i,i);
end
end
--------------------------------------------------------------------------