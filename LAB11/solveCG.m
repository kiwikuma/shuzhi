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