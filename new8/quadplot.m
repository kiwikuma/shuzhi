function quadplot(nodes,elements,sol)
%nodes=[-1,-1; 0,-1; 1,-1;-1, 0; 0, 0; 1, 0;-1, 1; 0, 1; 1, 1];
%elements = [1 2 5 4; 2 3 6 5; 4 5 8 7; 5 6 9 8];
%sol = [2; 1; 2; 1; 0; 1; 2; 1; 2];
n = length(elements);

P = nodes
P(:,3) = sol
T = zeros(2*n,3)
for i=1:n
    j=2*i-1;
    T(j,:) = [elements(i,1),elements(i,2),elements(i,3)]
    T(j+1,:) = [elements(i,1),elements(i,3),elements(i,4)]

end
    TR = triangulation(T,P(:,1),P(:,2),P(:,3))
    trisurf(TR);

end