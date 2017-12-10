function Aufgabe2()
t1 = 0;
t2 = 2;
theta = 0.5;
timestep = 0.1;
B = -6;
M = 1.1;
for t = t1:timestep:t2-timestep
    if t == t1
    C(1) = (t+timestep)^2*exp(-5*(t+timestep));
    C(2) = t^2*exp(-5*t);
    sol = 0;
    [LHS,RHS] = OST(theta,timestep,M,B,C,sol);
    sol = RHS/LHS;
    else
    C(1) = (t+timestep)^2*exp(-5*(t+timestep));
    C(2) = t^2*exp(-5*t);
    [LHS,RHS] = OST(theta,timestep,M,B,C,sol);
    sol = RHS/LHS;
    end
end
end