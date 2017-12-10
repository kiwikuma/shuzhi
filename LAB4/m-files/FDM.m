function df = FDM(x0,h)
%FDM Summary of this function goes here
%   Detailed explanation goes here
%% parameter

    for i = 1:5
        x(i)=x0+(-3+i)*h;
    end
        y = (x./(1+x)).^5;
        df = (-y(5)+8*y(4)-8*y(2)+y(1))/(12*h);
    
end

