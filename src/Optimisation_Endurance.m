n=6;


Param_def

ct=linspace(0.05,1,n);
b=linspace(1.5,2,n);
E=zeros(n,n);

for i=1:n
    i
    for j=1:n
     parameters.Ct=ct(i);
     parameters.Co=ct(i);
     parameters.bw=b(j);
     parameters.Sw=parameters.Ct*parameters.bw;
     save('param.mat','parameters')
     
    [CLmd,CDmd, Cd0, k] = Derivation_CL_mp(0);
    parameters.Cl=CLmd;
    parameters.Cd=CDmd;
    parameters.Cd0=Cd0;
    parameters.k=k;
    save('param.mat','parameters')
    %Vst=sqrt(2*parameters.Wto/(parameters.rho*parameters.Sw))*(parameters.n/parameters.Cl)^(3/2)*parameters.Cd 
    
    
    
    E(i,j)=Endurance(0);
    
    
    
    
   
    end
end
surf(ct,b,E);