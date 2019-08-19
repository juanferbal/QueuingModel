close all 
clear all
clc

%ONE TIER
%Bandwidth
%Lamda variable
syms Bjl Brhol
k=1;
Bmuil=500;
for i = 1:1000
 Blamdal(i)=i; 
 Brhol(i)=Blamdal(i)/Bmuil;
 PBl(i)= double((Brhol(i)^k)/symsum(((Brhol(i)^Bjl)/factorial(Bjl)), Bjl, 0, k));
end

%Memory
%Lamda variable
syms Mjl Mrhol
k=1;
Mmuil=100;
for i = 1:1000
 Mlamdal(i)=i; 
 Mrhol(i)=Mlamdal(i)/Mmuil;
 PMl(i)= double((Mrhol(i)^k)/symsum(((Mrhol(i)^Mjl)/factorial(Mjl)), Mjl, 0, k));
end

%CPU Model
%Lamda variable
k=1;
Cmuil=300;
tw=1;
for i = 1:1000
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

PTotal1=1-((1-PBl).*(1-PMl).*(1-PCl));

%TWO TIER
%Bandwidth
%Lamda variable
syms Bjl2 Brhol2
k2=1;
Bmuil2=500;
for i = 1:1000
 Blamdal2(i)=i; 
 Brhol2(i)=Blamdal2(i)/Bmuil2;
 PBl2(i)= double((Brhol2(i)^k2)/symsum(((Brhol2(i)^Bjl2)/factorial(Bjl2)), Bjl2, 0, k2));
end

%Memory
%Lamda variable
syms Mjl2 Mrhol2
k2=1;
r=3;
w=10;
Mmuil2=100;
for i = 1:1000
 Mlamdal2(i)=((Blamdal2(i).*(1-PBl2(i)))*r)/w; 
 Mrhol2(i)=Mlamdal2(i)/Mmuil2;
 PMl2(i)= double((Mrhol2(i)^k2)/symsum(((Mrhol2(i)^Mjl2)/factorial(Mjl2)), Mjl2, 0, k2));
end

%CPU Model
%Lamda variable
k2=1;
Cmuil2=300;
tw2=1;
lamdaS=2;
for i = 1:1000
 Clamdal2(i)=(Blamdal2(i).*(1-PBl2(i)))+lamdaS; 
 Crhol2(i)=Clamdal2(i)/Cmuil2;
 if Cmuil2<=Clamdal2(i)
     PCl2(i)=1;
 else
     CLl2(i)=1/(Cmuil2-Clamdal2(i));
     if CLl2(i)>tw2
         PCl2(i)=1;
     else 
         PCl2(i)=CLl2(i)/tw2;
     end
 end
end

PTotal2=1-((1-PBl2).*(1-PMl2).*(1-PCl2));

figure(1)
plot(Blamdal,PBl)
hold on
%figure(2)
plot(Mlamdal,PMl)
%figure(3)
plot(Clamdal, PCl)
%figure(4)
plot(Blamdal, PTotal1)
hold off

figure(5)
plot(Blamdal2,PBl2)
hold on
%figure(6)
plot(Blamdal2,PMl2)
%figure(7)
plot(Blamdal2, PCl2)
%figure(8)
plot(Blamdal2, PTotal2)
hold off
