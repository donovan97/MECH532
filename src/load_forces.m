function [q,qd] = load_forces(Wto,Wws,n,L,Co,Ct,Wf,Cof,Ctf,Lf)
%     parameters ; 
    load param.mat  
    x = linspace(0, L,1000); 
    
    %Lift load
    for i = 1 : length(x)
        q1(i) = (2 * Wto * n * sqrt (L^2 - x(i)))/(L^2*pi);
    end
    
    %Drag load
    for i = 1 : length(x)
        qd(i) = parameters.Thrust/parameters.L;
    end

    %Weight of the wing structure

    for i = 1 : length(x)
        qw(i) = -(Wws * n * (Co - x(i)*(Co-Ct)/L)) / (L * (Co + Ct)) ; 
    end

    %Weight of the fuel

    for i = 1 : length(x)
        if x(i) < Lf
            qf(i) = 0 ; 
        else
            qf(i) = -(Wf * n * (Cof - x(i)*(Cof-Ctf)/Lf)) / (Lf * (Cof + Ctf));
        end
    end 


    %Total distributed load (the signs are already in each individual force)
    q = q1 + qw + qf;
    
end 