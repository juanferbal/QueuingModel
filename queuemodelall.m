close all 
clear all
clc

%Bandwidth
%Lamda variable
syms Bjl Brhol
k=1;
Bmuil=3;
for i = 1:100
 Blamdal(i)=i; 
 Brhol(i)=Blamdal(i)/Bmuil;
 PBl(i)= double((Brhol(i)^k)/symsum(((Brhol(i)^Bjl)/factorial(Bjl)), Bjl, 0, k));
end

%Miu variable
syms Bjm Brhom
k=1;
Blamdam=3;
for i = 1:100
Bmium(i)=i; 
Brhom(i)=Blamdam/Bmium(i);
PBm(i)= double((Brhom(i)^k)/symsum(((Brhom(i)^Bjm)/factorial(Bjm)), Bjm, 0, k));
end

%Memory
%Lamda variable
syms Mjl Mrhol
k=1;
Mmuil=5;
for i = 1:100
 Mlamdal(i)=i; 
 Mrhol(i)=Mlamdal(i)/Mmuil;
 PMl(i)= double((Mrhol(i)^k)/symsum(((Mrhol(i)^Mjl)/factorial(Mjl)), Mjl, 0, k));
end

%Miu variable
syms Mjm Mrhom
k=1;
Mlamdam=3;
for i = 1:100
Mmium(i)=i; 
Mrhom(i)=Mlamdam/Mmium(i);
PMm(i)= double((Mrhom(i)^k)/symsum(((Mrhom(i)^Mjm)/factorial(Mjm)), Mjm, 0, k));
end

%CPU Model
%Lamda variable
k=1;
Cmuil=20;
tw=1;
for i = 1:100
 Clamdal(i)=i; 
 Crhol(i)=Clamdal(i)/Cmuil;
 if Cmuil<=Clamdal(i)
     PCl(i)=1;
 else
     CLl(i)=1/(Cmuil-Clamdal(i));
     if CLl(i)>tw
         PCl(i)=1;
     else 
         PCl(i)=CLl(i)/tw;
     end
 end
end

%Miu variable
k=1;
Clamdam=3;
tw=1;
for i = 1:100
 Cmium(i)=i; 
 Crhom(i)=Clamdam/Cmium(i);
 if Cmium(i)<=Clamdam
     PCm(i)=1;
 else
     CLm(i)=1/(Cmium(i)-Clamdam);
     if CLm(i)>tw
         PCm(i)=1;
     else 
         PCm(i)=CLm(i)/tw;
     end
 end
end

for i = 1:100
 Ptl(i)=1-((1-PBl(i)).*(1-PMl(i)).*(1-PCl(i)));
 Ptm(i)=1-((1-PBm(i)).*(1-PMm(i)).*(1-PCm(i)));
end

figure(1)
plot(Blamdal,PBl)
hold on
%figure(2)
plot(Mlamdal,PMl)
%figure(3)
plot(Clamdal, PCl)
%figure(4)
plot(Blamdal,Ptl)
hold off


figure(5)
plot(Bmium,PBm)
hold on
%figure(6)
plot(Mmium,PMm)
%figure(7)
plot(Cmium, PCm)
%figure(8)
plot(Bmium, Ptm)
hold off
