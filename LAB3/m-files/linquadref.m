function val = linquadref(xi,eta,fx)
fx = [0,1,3,1];
N = linquadref_N(xi,eta);
val = fx.*N;
end