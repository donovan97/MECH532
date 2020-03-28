function [CLmd] = Derivation_CL_mp()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load param.mat
V0=sqrt(2*parameters.Wto*parameters.g/(parameters.rho*parameters.Sw*parameters.CLmax));
n=1000;
[Cd0,k] = Parasitedrag();
Cd0=Cd0/6;
CLMAX=parameters.CLmax
cl=linspace(0,CLMAX,n);
cd=linspace(0,CLMAX,n);
cl32_cd=linspace(0,CLMAX,n);


for i=1:length(cl)
    cl(i);
    cd(i)=(Cd0+k*(cl(i)^2));
    
    cl32_cd(i)=cl(i)^(3/2)/cd(i);
end
plot(cd,cl)
hold on
% figure(3)
% plot(v,cd)
% hold on

plot(cl,cl32_cd)
[cl32_cd_max,index]=max(cl32_cd)
Clmd=cl(index)
  
    






end

