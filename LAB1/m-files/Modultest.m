function Modultest()

f = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Fkt -1:facultaet
n = [0,5];
real_val = [1,120];
tol = zeros(size(real_val));
tol = tol + 10^-12;

for i = 1:length(n)
    X = abs(facultaet(n(i))-real_val(i));
if  X<= tol(i)
    X = sprintf('Fkt -1:facultaet_%d...passed (= %d, tol= %d)',n(i),facultaet(n(i)),tol(i));
    disp(X);
else
    X = sprintf('Fkt -1:facultaet_%d...failed (= %d, %d , tol= %d)',n(i),facultaet(n(i)),real_val(i),tol(i));
    disp(X);
    f = f+1;
end
end
%%%%%%%%%%%%%%%%%%%%%
    X = sprintf('%d / %d failed',f,length(n));
    disp(X);
end