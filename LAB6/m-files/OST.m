function [LHS,RHS] = OST(theta,timestep,M,B,C,sol)
theta = 0.5;
timestep = 0.2;
M = 1.1;
B = [1.4,1.5];
C = [1.7,1.8];
sol = 2.0;
LHS = (M-B(1)*theta*timestep);
RHS = (M+(1-theta)*timestep*B(2))*sol+(theta*timestep*C(1)+(1-theta)*timestep*C(2));
a = [LHS,RHS];
end