function [Endurance,c,b] = Optimisation_Endurance(n)


Param_def

ct=linspace(0.05,0.3,n);
b=linspace(1.5,2,n);
E=zeros(n,n);
for i=1:n
    for j=1:n
     parameters.Ct=ct(i);
     parameters.b=b(j);
     save('param.mat','parameters')
    [CLmd,CDmd, Cd0, k] = Derivation_CL_mp(0);
     E(i,j)= Endurance();
    end
end
surf(ct,b,E);
end

