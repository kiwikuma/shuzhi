function eigval = VecIt(A,x0,tol,itermax)
format long;
p = A*x0;
x1 = p/norm(p);
lamda_1 = x1'*A*x1;
for i = 2:itermax
    x0 = x1;
    p = A*x0;
    x1 = p/norm(p);
    lamda_2 = (x1)'*A*x1;
    if abs(lamda_2 - lamda_1) <= tol
        break;
    end
    lamda_1 = lamda_2;
end
eigval = lamda_2;
end
