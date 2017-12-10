function Fi = VorwaertsEulerVerfahren(t1,t2,Delta_t)
fi = 0;
Fi = fi;
for t = t1:Delta_t:t2-Delta_t
    fx = t^2*exp(-5*t)-6*fi;
    fi = fi + Delta_t*fx;
    f = [Fi;fi];
    Fi = f;
end
end