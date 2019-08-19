close all 
clear all
clc

%Lamda variable
syms jl rhol
k=1;
muil=3;
for i = 1:50
 lamdal(i)=i; 
 rhol(i)=lamdal(i)*muil;
 PMl(i)= double((rhol(i)^k)/symsum(((rhol(i)^jl)/factorial(jl)), jl, 0, k));
end
hold on
figure(1)
plot(rhol,PMl)

%Miu variable
syms jm rhom
k=1;
lamdam=3;
for i = 1:100
muim(i)=i; 
rhom(i)=lamdam*muim(i);
PMm(i)= double((rhom(i)^k)/symsum(((rhom(i)^jm)/factorial(jm)), jm, 0, k));
end
hold on
figure(2)
plot(rhom,PMm)


