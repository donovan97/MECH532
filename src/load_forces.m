function [q,qd] = load_forces(Wto,Wws,n,L,Co,Ct)
%     parameters ; 
    load param.mat  
    x = linspace(0, L,1000); 
    
    %Lift load
    for i = 1 : length(x)
        q1(i) = (2 * Wto * n * sqrt (L^2 - x(i)^2))/(L^2*pi); %x(i) not originally squared, potential error?
    end
    
    %Drag load
    for i = 1 : length(x)
        qd(i) = parameters.drag/parameters.L;
    end

    %Weight of the wing structure

    for i = 1 : length(x)
        qw(i) = -(Wws * n * (Co - x(i)*(Co-Ct)/L)) / (L * (Co + Ct)) ; 
    end

    %Total distributed load (the signs are already in each individual force)
    q = q1 + qw;
    
end 