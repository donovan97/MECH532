function [CLmd,CDmd, Cd0, k] = Derivation_CL_mp(disp)
%Derivation of Cl min power
%   Detailed explanation goes here
global parameters

iter=100;
CLMAX=parameters.CLmax;
cl=linspace(0,CLMAX,iter);
cd=linspace(0,CLMAX,iter);
cl32_cd=linspace(0,CLMAX,iter);


for i=1:length(cl)  
    [Cd0,k]=Parasitedrag(cl(i));
    cd(i)=(Cd0+k*(cl(i)^2));
    cl32_cd(i)=cl(i)^(3/2)/cd(i);
end

if disp==1
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
end
[cl32_cd_max,index]=max(cl32_cd);
CLmd=cl(index);
CDmd=cd(index);
    
[Cd0,k] = Parasitedrag(CLmd);


parameters.Cl = CLmd;
parameters.Cd = CDmd;
parameters.Cd0=Cd0;
parameters.k=k;




end

