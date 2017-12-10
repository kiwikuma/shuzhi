function Fi = RueckwaertsEulerVerfahren(t1,t2,Delta_t)
fi = 0;
Fi = fi;
for t = t1+Delta_t:Delta_t:t2
    fi = (fi + Delta_t*t^2*exp(-5*t))/(1+6*Delta_t);
    f = [Fi;fi];
    Fi = f;
end
end