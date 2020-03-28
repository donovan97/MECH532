function [] = Derivation_V_mp()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load param.mat
V0=sqrt(2*parameters.Wto*parameters.g/(parameters.rho*parameters.Sw*parameters.CLmax));
n=10;
[Cd0,k] = Parasitedrag();
CLMAX=parameters.CLmax
cl=linspace(0,CLMAX,n);
cd=linspace(0,CLMAX,n);



for i=1:length(cl)
    cl(i)
    cd(i)=(Cd0+k*(cl(i)^2))
    
    %cl32_cd=[cl32_cd cl(end)^(3/2)/cd(end)];
end
plot(cd,cl)
hold on
% figure(3)
% plot(v,cd)
% hold on

%plot(v,cl32_cd)
  
    






end

