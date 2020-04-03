function [CLmd,CDmd, Cd0, k] = Derivation_CL_mp()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load param.mat
%V0=sqrt(2*parameters.Wto*parameters.g/(parameters.rho*parameters.Sw*parameters.CLmax));
n=100;
CLMAX=parameters.CLmax;
cl=linspace(0,CLMAX,n);
cd=linspace(0,CLMAX,n);
cl32_cd=linspace(0,CLMAX,n);


for i=1:length(cl)  
    [Cd0,k] = Parasitedrag(cl(i));
    cd(i)=(Cd0+k*(cl(i)^2));
    cl32_cd(i)=cl(i)^(3/2)/cd(i);
end


figure(1)
plot(cd,cl)
title("Cl over Cd")
xlabel('Cd')
ylabel('Cl')
hold on
figure(2)
plot(cl,cl32_cd)
title("Minimum power conditions")
xlabel('Cl')
ylabel('Cl^{3/2}/Cd')
[cl32_cd_max,index]=max(cl32_cd);
CLmd=cl(index);
CDmd=cd(index);
    
[Cd0,k] = Parasitedrag(CLmd);


parameters.Cl = CLmd;
parameters.Cd = CDmd;
parameters.Cd0=Cd0;
parameters.k=k;
save('param.mat','parameters')



end

