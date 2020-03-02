function [Hn_fixed, Hn_free] = LongitudinalStaticStability(cg, wingDist, h0, c0, ct, St, lt, S, a, a1, a2, b, b1, b2)

%Outputs: 
%Hn cg margin stick fixed, Hn = -dCm/dCl, therefore Hn > 0 for stability
%Hn' cg margin stick free, Hn' = -dCm/dCl, therefore Hn' > 0 for stability

%Inputs: 
%cg centerline distance from the front tip of the aircraft to the center of gravity (obtain from CAD?)
%wingDist centerline distance from the front tip of the aircraft to the leading edge of the wing
%h0 distance of aerodynamic center aft leading edge of MAC(mean aerodynamic chord), normalized by MAC (set to 0.25)
%c0 geometric chord at aircraft centerline
%ct geometric chord at wing tip
%lambda taper ratio
%St tailplane area
%lt tailplane moment arm
%S gross wing area
%a wing lift curve slope
%a1 tailplane lift curve slope
%a2 elevator lift curve slope
%b wing span
%b1 tailplane hinge-curve slope
%b2 elevator hinge-curve slope

lambda = ct/c0; %taper ratio
AR = (b^2)/S; %aspect ratio
mac = (2/3)*c0*((1+lambda+lambda^2)/(1+lambda)); %mean aerodynamic chord
Vt = (St*lt)/(S*mac); %tailplane volume coefficient
downwash = (2*a)/(pi*AR); %downwash derivative d(epsilon)/d(alpha)

aerodynamicCenterDistance = wingDist + h0*(c0-mac)/2; %aerodynamic center distance from front tip of the aircraft
h = h0 - (aerodynamicCenterDistance - cg)/mac; %distance of center of gracity aft leading edge of MAC, normalized by MAC

a1_bar = a1 - (a2*b1)/b2; %tailplane lift curve slope with free elevator


Hn_fixed = (h0 - h) + Vt*(a1/a)*(1-downwash)
Hn_free = (h0 - h) + Vt*(a1_bar/a)*(1-downwash)

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




