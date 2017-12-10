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