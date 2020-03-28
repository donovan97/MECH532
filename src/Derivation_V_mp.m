function [V_mp] = Derivation_V_mp()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load param.mat
v=[sqrt(2*parameters.Wto*parameters.g/(parameters.rho*parameters.Sw*parameters.CLmax))];
dv=0.01;  %
[CD0,k] = Parasitedrag()
cl=[parameters.CLmax];
cd=[(CD0+k*parameters.CLmax*parameters.CLmax)];
n=1000;
cl32_cd=[cl(end)^(3/2)/cd(end)]
for k=1:n
    v=[v v(end)+dv];
    CL=2*parameters.Wto*parameters.g/(parameters.rho*parameters.Sw*v(end)*v(end)) ;
    CD=CD0+k*(CL^2);
    cl=[cl CL];
    cd=[cd CD];
    cl32_cd=[cl32_cd cl(end)^(3/2)/cd(end)];
end
plot(cl,cd)
figure(3)
plot(v,cd)

%plot(v,cl32_cd)
  
    






end

