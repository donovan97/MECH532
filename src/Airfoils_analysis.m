clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Airfoils analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Chargement des profils
Profils  

%Data

%Plug the right numbers below

e1 = 0.87; % Oswald coeff
M = 0.3; % Mach number
A = 6; % Aspect ratio
S = 40; %m2
b =  sqrt(S*A);
c = S/b;
alphachoose = 4; % degrees

%Reynolds

T_200 = 250; % Temperature (200m, K)
rho_200 = 1.225; %kg/m3
a_200 = 300; % Speed of sound
visdyn_200 = 18*10^-6; % Viscosité dynamique air (18000ft)
Re = rho_200*M*a_200*c/visdyn_200;

%Loop

for i = 1:1:length(legends)
    alphap = cell2mat(alpha(i)); % abscisses du profil i
    Clp = cell2mat(Cl(i)); % ordonnées du profil i
    temp = legends(i); % legendes du profil i
    
    %a0
    t0 = round(1/3*length(alphap));
    y0 = Clp(t0);
    y1 = Clp(length(alphap)-t0);
    x0 = alphap(t0);
    x1 = alphap(length(alphap)-t0);
    a0 = (y1-y0)/(x1-x0); %a0 en incompressible
    
    a3d = a0/(sqrt(1-M^2)+a0/(pi*e1*A)); % a0 en 3d
    
    %alpha for Cl =0
    [trash ,indice] = min(abs(Clp));
    alphal0 = alphap(indice);
    
    %Final CL
    
    CL = a3d*(alphachoose - alphal0);
    
    %a0 slope to ensure the good approximation
    
    droite_pente = alphap.*a0;
    oo = Clp(t0)-droite_pente(t0);
    droite_pente = droite_pente + oo;
    
    %Cd0
    
    C_f = 0.455/(((log10(Re))^2.58)*(1+0.144*M^2)^0.65);
    FF = (1+(0.6/temp{1}{4})*temp{1}{3}+100*(temp{1}{3})^4)*(1.34*M^0.18);
    Q = 1;
    Swet = S*(1.977+0.52*temp{1}{3});
    Cd0 = C_f*FF*Q*Swet/S;
    
    %Plot
    figure(i)
    hold on
    plot(alphap, Clp)
    plot(alphap, droite_pente)
    title(strcat(temp{1}{1}, ' Re = ',temp{1}{2}, ' alpha = ', num2str(alphachoose)))
    legend(strcat('CL = ', num2str(CL)), strcat('Cd0 = ', num2str(Cd0)))
end