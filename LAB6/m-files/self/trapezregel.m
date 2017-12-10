function Fi = trapezregel(Delta_t,a,b)
    fi = 0;
    Fi = fi;
    for t = t1:Delta_t:t2-Delta_t
    fx = 1/2*Delta_t*(t^2*exp(-5*t)-6*fi);
    T = t+Delta_t;
    fi = (fi+fx+1/2*Delta_t*(T^2*exp(-5*T)))/(1+1/2*Delta_t*6);
    f = [Fi;fi]
    Fi = f
    end
end