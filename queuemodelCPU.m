close all 
clear all
clc

%Lamda variable
k=1;
muil=3;
tw=1;
for i = 1:50
 lamdal(i)=i; 
 if muil<=lamdal(i)
     PCl(i)=1;
 else
     Ll(i)=1/(muil-lamdal(i));
     if Ll(i)>tw
         PCl(i)=1;
     else 
         PCl(i)=Ll(i)/tw;
     end
 end
end
hold on
figure(1)
plot(lamdal,PCl)

%Miu variable
k=1;
lamdam=3;
tw=1;
for i = 1:50
 mium(i)=i; 
 if mium(i)<=lamdam
     PCm(i)=1;
 else
     Lm(i)=1/(mium(i)-lamdam);
     if Lm(i)>tw
         PCm(i)=1;
     else 
         PCm(i)=Lm(i)/tw;
     end
 end
end
hold on
figure(2)
plot(mium,PCm)