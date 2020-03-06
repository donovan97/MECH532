function [M_Root_y,My,M_Max_y,M_Root_x,Mx,M_Max_x] = moment(xeng)
    %returns 
    %M_Root_y : The moment of the y axis (vertical) at the root. 
    %My : Vertical moment throughout the wing
    %M_Max_y : Maximum moment of the 

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
        V0y = Fq_mag; 
        V0x = Fd_mag;

        %M0 magnitude
        M0y = centroid*Fq_mag;
        M0x = centroid_d*Fd_mag;


    %Calculating the shear force (+up) [ all terms have appropriate sign]
    
        Vy = -V0y + cumtrapz(x,q); 
        Vx = -V0x + cumtrapz(x,qd);

    %Calculating the bending moment (+cw)

    My = M0y + cumtrapz(x,Vy);
    M_Max_y = sign(max(abs(My)))*max(abs(My));
    M_Root_y = abs(My(1));
    
    
    Mx = M0x + cumtrapz(x,Vx);
    M_Max_x = sign(max(abs(Mx)))*max(abs(Mx));
    M_Root_x = abs(Mx(1));
end