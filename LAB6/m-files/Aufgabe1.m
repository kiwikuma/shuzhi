function Aufgabe1()
t1 = 0;
t2 = 2;
Delta_t = 0.1;
%% R&V&T rechnen
Fi_Rueck = RueckwaertsEulerVerfahren(t1,t2,Delta_t); % RueckwaertsEuler
Fi_Vor = VorwaertsEulerVerfahren(t1,t2,Delta_t); % VorwaertsEuler
Fi_Trapez = Trapezregel(t1,t2,Delta_t); % Trapezregel
%% Exakter Wert rechnen
fi = exp(-5*t1)*(t1^2-2*t1+2)-2*exp(-6*t1);
Fi_Exakt = fi;
for t = t1+Delta_t:Delta_t:t2
fi = exp(-5*t)*(t^2-2*t+2)-2*exp(-6*t);
f = [Fi_Exakt;fi];
Fi_Exakt = f;
end
%% AB2
B = [-6,-6];
M = 1;
sol(1) = 0;
t = t1+Delta_t;
sol(2) = exp(-5*t)*(t^2-2*t+2)-2*exp(-6*t);
i = 1;
for t = t1+2*Delta_t:Delta_t:t2
    T = t-Delta_t;
    C(1) = (T)^2*exp(-5*(T));
    T = t-2*Delta_t;
    C(2) = (T)^2*exp(-5*(T));
    s = [sol(i+1),sol(i)];
    [LHS,RHS] = AB2(Delta_t,M,B,C,s);
    sol(i+2) = RHS/LHS;
    i = i+1;
end
Fi_AB2 = sol;
sol = 0;
%% AM3
B = [-6,-6,-6];
M = 1;
sol(1) = 0;
t = t1+Delta_t;
sol(2) = exp(-5*t)*(t^2-2*t+2)-2*exp(-6*t);
i = 1;
for t = t1+2*Delta_t:Delta_t:t2
    T = t;
    C(1) = (T)^2*exp(-5*(T));
    T = t-Delta_t;
    C(2) = (T)^2*exp(-5*(T));
    T = t-2*Delta_t;
    C(3) = (T)^2*exp(-5*(T));
    s = [sol(i+1),sol(i)];
    [LHS,RHS] = AM3(Delta_t,M,B,C,s);
    sol(i+2) = RHS/LHS;
    i = i+1;
end
Fi_AM3 = sol;
sol = 0;
%% BDF2
B = -6;
M = 1;
sol(1) = 0;
t = t1+Delta_t;
sol(2) = exp(-5*t)*(t^2-2*t+2)-2*exp(-6*t);
i = 1;
for t = t1+2*Delta_t:Delta_t:t2
    T = t;
    C = (T)^2*exp(-5*(T));
    s = [sol(i+1),sol(i)];
    [LHS,RHS] = BDF2(Delta_t,M,B,C,s);
    sol(i+2) = RHS/LHS;
    i = i+1;
end
Fi_BDF2 = sol;
sol = [];
%% Plotten
clf
hold on
figure(1)
t = t1:Delta_t:t2
Fi_Rueck = plot(t,Fi_Rueck,'linewidth',2);
Fi_Vor = plot(t,Fi_Vor,'linewidth',2);
Fi_Trapez = plot(t,Fi_Trapez,'linewidth',2);
Fi_Exakt = plot(t,Fi_Exakt,'--k','linewidth',4);
Fi_AB2 = plot(t,Fi_AB2,'linewidth',2);
Fi_AM3 = plot(t,Fi_AM3,'linewidth',2);
Fi_BDF2 = plot(t,Fi_BDF2,'linewidth',2);
axis([0,2,0,Inf]);
legend('Fi-Rueck','Fi-Vor','Fi-Trapez','Fi-Exakt','Fi-AB2','Fi-AM3','Fi-BDF2');
grid minor
end