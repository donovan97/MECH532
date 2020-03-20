function [V0y, V0x, M0y, M0x] = moment(xeng) 

    load param.mat  
    [q,qd]=load_forces(parameters.Wto,parameters.Wws,parameters.n,parameters.L,parameters.Co,parameters.Ct);
    
     %Creating an x domain of the wing
    x = linspace(0, parameters.L,1000);
     
    %Solving for V0 and M0

        %Replacing the  the equivalent force
        Fq_mag = trapz(x,q);
        Fd_mag = trapz(x,qd);

        %Finding the centroid
        for i = 1 : length(x)
            q_centroid(i) = q(i) * x(i);
            qd_centroid(i)= qd(i) *x(i);
        end 
        centroid = trapz(x,q_centroid)/trapz(x,q);
        centroid_d = trapz(x,qd_centroid)/trapz(x,qd);

        %V0 magnitude
        V0y = Fq_mag 
        V0x = Fd_mag

        %M0 magnitude
        M0y = centroid*Fq_mag
        M0x = centroid_d*Fd_mag
        
end