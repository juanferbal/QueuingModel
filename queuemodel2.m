close all 
clear all

%Bandwidth exhaustion 
syms jB rhoB
k=1;
T=1000000;
v=2000;
miuB=T/v;
lamdaB=250; 
rhoB=lamdaB/miuB;
PB= double((rhoB^k)/symsum(((rhoB^jB)/factorial(jB)), jB, 0, k))

%Memory exhaustion 
syms jM rhoM
N=3;
miuM=0.01;
lamdaM=36.3; 
rhoM=lamdaM*miuM;
PM= double((rhoM^N)/symsum(((rhoM^jM)/factorial(jM)), jM, 0, N))


%CPU exhaustion 
syms jC rhoC
miuC=300;
lamdaC=252.5; 
L=1/(miuC-lamdaC);
tw=1;
PC= L/tw

P=1-((1-PB)*(1-PM)*(1-PC))

%Two tier
syms jM2 rhoM2
r=3;
w=10;
lamdaM2=(lamdaB*(1-PB)*r)/w;
rhoM2=lamdaM2*miuM;
PM2= double((rhoM2^N)/symsum(((rhoM2^jM2)/factorial(jM2)), jM2, 0, N))

lamdaS=2;
lamdaC2=(lamdaB*(1-PB)+lamdaS);
L2=1/(miuC-lamdaC2);
tw=1;
PC2= L2/tw

P=1-((1-PB)*(1-PM2)*(1-PC2))
