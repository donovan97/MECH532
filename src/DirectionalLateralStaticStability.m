function [CnB_directional, CnB_lateral] = DirectionalLateralStaticStability()

load param.mat 

%Outputs: 
%CnB_directional derivative of yawing moment coefficient wrt sideslip angle, CnB_directional > 0 for directional stability
%CnB_lateral derivative of yawing moment coefficient wrt sideslip angle, CnB_lateral < 0 for lateral stability

%Inputs: 
%bw wing span
%lf length of fuselage
%Sw gross wing area
%Sprojf projected side area of fuselage
%dihedralw dihedral angle in degrees
%Cl lift coefficient
%Kn wing-body interference factor, obtain manually from Pamadi P.271
%Krl Reynolds number factor, obtain manually from Pamadi P.272
%Svt fin area
%avt fin lift curve slope
%zv vertical distance between center of gravity and vertical tail aerodynamic center
%lv horizontal distance between center of gravity and vertical tail aerodynamic center
%alphaw angle of attack in degrees
%a wing lift curve slope

gamma = parameters.dihedralw * (pi/180);
alpha = parameters.alphaw * (pi/180);

CnB_dir_dihedral = -0.075*gamma*parameters.CLmax;
CnB_dir_fuselage = -parameters.Kn*parameters.Krl*(parameters.Sprojf/parameters.Sw)*(parameters.lf/parameters.bw);
CnB_dir_tail = (parameters.Svt*parameters.avt)/(parameters.Sw*parameters.bw);
CnB_directional = CnB_dir_dihedral + CnB_dir_fuselage + CnB_dir_tail;

CnB_lat_dihedral = -(parameters.a*gamma)/4
CnB_lat_tail = ((parameters.Svt*parameters.avt)/parameters.Sw)*((parameters.zv*cos(alpha) - parameters.lv*sin(alpha))/parameters.bw);
CnB_lateral = CnB_lat_dihedral + CnB_lat_tail;


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




