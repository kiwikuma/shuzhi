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