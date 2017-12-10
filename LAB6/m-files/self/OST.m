function [LHS,RHS] = OST(theta,timestep,M,B,sol)

LHS = (M*timestep-B(1)*theta*timestep);
RHS = (M+(1-theta)*timestep*B(2))*sol+(theta*timestep*C(1)+(1-theta)*timestep*C(2));
a = [LHS,RHS];
end