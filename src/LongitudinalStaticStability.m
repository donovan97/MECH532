function [Hn_fixed, Hn_free] = LongitudinalStaticStability(var)

load param.mat  

%Outputs: 
%Hn cg margin stick fixed, Hn = -dCm/dCl, therefore Hn > 0 for stability
%Hn' cg margin stick free, Hn' = -dCm/dCl, therefore Hn' > 0 for stability

%Inputs: 
%cg centerline distance from the front tip of the aircraft to the center of gravity (obtain from CAD?)
%wingDist centerline distance from the front tip of the aircraft to the leading edge of the wing
%h0 distance of aerodynamic center aft leading edge of MAC(mean aerodynamic chord), normalized by MAC (set to 0.25)
%Co geometric chord at aircraft centerline
%lambda taper ratio
%Sht tailplane area
%lt tailplane moment arm
%Sw gross wing area
%a wing lift curve slope
%a1 tailplane lift curve slope
%a2 elevator lift curve slope
%bw wing span
%b1 tailplane hinge-curve slope
%b2 elevator hinge-curve slope

AR = (parameters.bw^2)/parameters.Sw; %aspect ratio
mac = (2/3)*parameters.Co*((1+parameters.lambda+parameters.lambda^2)/(1+parameters.lambda)); %mean aerodynamic chord
Vt = (parameters.Sht*parameters.lt)/(parameters.Sw*mac); %tailplane volume coefficient
downwash = (2*parameters.a)/(pi*AR); %downwash derivative d(epsilon)/d(alpha)

aerodynamicCenterDistance = parameters.wingDist + parameters.h0*(parameters.Co-mac)/2; %aerodynamic center distance from front tip of the aircraft
h = parameters.h0 - (aerodynamicCenterDistance - parameters.cg)/mac; %distance of center of gracity aft leading edge of MAC, normalized by MAC

a1_bar = parameters.a1 - (parameters.a2*parameters.b1)/parameters.b2; %tailplane lift curve slope with free elevator


Hn_fixed = (parameters.h0 - h) + Vt*(parameters.a1/parameters.a)*(1-downwash);
Hn_free = (parameters.h0 - h) + Vt*(a1_bar/parameters.a)*(1-downwash);

if var==1
    if (Hn_fixed <= 0)
        disp("Longitudinal stick-fixed stability condition not met")
    else
        disp("Longitudinal stick-fixed stability condition met");
    end
    
    if (Hn_free <= 0)
        disp("Longitudinal stick-free stability condition not met")
    else
        disp("Longitudinal stick-free stability condition met")
    end
end
end




