function [LHS,RHS] = AB2(timestep,M,B,C,sol)
f1 = B(1)*sol+C(1);
f2 = B(2)*sol+C(2);
LHS = M;
RHS = M*sol(1)+timestep/2*(3*f1-f2);
ebd