function [CnB_directional, CnB_lateral] = DirectionalLateralStaticStability(b, l_f, S, S_B, gamma, Cl, Kn, Krl, S_f, a_f, z_v, l_v, alpha, a)

%Outputs: 
%CnB_directional derivative of yawing moment coefficient wrt sideslip angle, CnB_directional > 0 for directional stability
%CnB_lateral derivative of yawing moment coefficient wrt sideslip angle, CnB_lateral < 0 for lateral stability

%Inputs: 
%b wing span
%l_f length of fuselage
%S gross wing area
%S_B projected side area of fuselage
%gamma dihedral angle ***in radians***
%Cl lift coefficient
%Kn wing-body interference factor, obtain manually from Pamadi P.271
%Krl Reynolds number factor, obtain manually from Pamadi P.272
%S_f fin area
%a_f fin lift curve slope
%z_v vertical distance between center of gravity and vertical tail aerodynamic center
%l_v horizontal distance between center of gravity and vertical tail aerodynamic center
%alpha angle of attack ***in radians***
%a wing lift curve slope


CnB_dir_dihedral = -0.075*gamma*Cl;
CnB_dir_fuselage = -Kn*Krl*(S_B/S)*(l_f/b);
CnB_dir_tail = (S_f*a_f)/(S*b);
CnB_directional = CnB_dir_dihedral + CnB_dir_fuselage + CnB_dir_tail;

CnB_lat_dihedral = -(a*gamma)/4
CnB_lat_tail = ((S_f*a_f)/S)*((z_v*cos(alpha) - l_v*sin(alpha))/b)
CnB_lateral = CnB_lat_dihedral + CnB_lat_tail


if (CnB_directional <= 0)
    disp("Directional stability condition not met")
else
    disp("Directional stability condition met");
end

if (CnB_lateral >= 0)
    disp("Lateral stability condition not met")
else
    disp("Lateral stability condition met")
end




