function [V0y, V0x, M0y, M0x, margin_tensile, margin_compressive,validation] = moment(plot) 

    global parameters
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
        V0y = Fq_mag ;
        V0x = Fd_mag;

        %M0 magnitude
        M0y = centroid*Fq_mag;
        M0x = centroid_d*Fd_mag;
        
        %M0y will always be bigger than M0x, therefore critical point uses M0y to compute stresses
        
        %Second moment of area of airfoil is approximated as a rectangle of height max airfoil thickness and width 0.5*chord
        
        I = ((parameters.Co/2)*(parameters.t)^3)/12;
        
        sigma = (M0y*(parameters.t/2))/I; %[Pa]
        margin_tensile = sigma - (parameters.Sut*1E06);
        margin_compressive = sigma - (parameters.Suc*1E06);
        %assuming no torsion on the wing, tau = 0
        %Stress caused by M0x is 0 at its neutral axis, which coincides with critical point due to M0y
        %Therefore, sigma_1 = sigma and sigma_3 = 0;
        if plot==1
            if (sigma < (parameters.Sut*1E06) && sigma < (parameters.Suc*1E06))
                disp("Aircraft is structurally sound");
                validation=0;
            else
                disp("Aircraft is not structurally sound");
                validation=1;
            end
        end
        if plot==0
            if (sigma < (parameters.Sut*1E06) && sigma < (parameters.Suc*1E06))
                validation=0;
            else
                validation=1;
            end
        end
end
        
