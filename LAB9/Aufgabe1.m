function k = Aufgabe1(A,x0,tol,itermax)
format long;
A = [1,2,10;4,5,6;7,8,9];
x0 = [1/sqrt(3);1/sqrt(3);1/sqrt(3)];
tol = 1e-8;
itermax = 100;
lamda_max = VecIt(A,x0,tol,itermax);
A = inv(A);
lamda_min = VecIt(A,x0,tol,itermax);
k = lamda_max*lamda_min;
end