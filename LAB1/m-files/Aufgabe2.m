function Aufgabe2()

a = rand(1,1000);
if a(1) >= 0.5  
    disp('a1>= 0.5');
else
    disp('a1<0.5');
end
n05 = 0;
for i=1:length(a)
   if a(i)>=0.5
      n05 = n05+1;
   end
end
    disp(n05);

    i=1;
while a(i)<0.499 || a(i)>0.501
    i=i+1;
end
   if i>1000
       disp('Kein Element0.499<= a_i <=0.501');
   else
        disp(i);
        disp(a(i));
   end
end