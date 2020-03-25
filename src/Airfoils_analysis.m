clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Airfoils analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Airfoil : MH32

load param.mat

%figure(1)
%MH32 = load('MH32.dat')
%plot(MH32(:,1),smooth(MH32(:,2)))
%title('MH32 Airfoil')


Re = parameters.rho*parameters.u*parameters.c/parameters.mu;

% Analyse XFLR

CLmax = 0.9*parameters.clmax;

% Analyse théorique  

M = 0.02; % Mach number 
Aw = parameters.bw*parameters.bw/parameters.Sw; % Aspect ratio
alphap = [-5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 12];
Clp = [-4.003 -0.3205 -0.2218 -0.1218 -0.0384 0.0413 0.1256 0.3366 0.4946 0.6596 0.8006 0.9025 0.9854 1.0499 1.0991 0.9141];

%a0
t0 = round(1/3*length(alphap));
y0 = Clp(t0);
y1 = Clp(length(alphap)-t0);
x0 = alphap(t0);
x1 = alphap(length(alphap)-t0);
a0 = (y1-y0)/(x1-x0); %a0 en incompressible
a3d = a0/(sqrt(1-M^2)+a0/(pi*parameters.e*Aw)); % a0 en 3d

%alpha for Cl =0
[trash ,indice] = min(abs(Clp));
alphal0 = alphap(indice);

%Final CL 
CL = a3d*(parameters.alphaw - alphal0);

%a0 slope to ensure the good approximation
    
droite_pente = alphap.*a0;
oo = Clp(t0)-droite_pente(t0);
droite_pente = droite_pente + oo;

% Calcul de Cd0

C_f = 1.328/sqrt(Re);
FF = (1+(0.6/parameters.xcw)*parameters.tcw+100*(parameters.tcw)^4)*(1.34*M^0.18)*(cos(parameters.Dw)^0.28);
Swetw = parameters.Sw*(1.977+0.52*parameters.tcw);
Cd0 = C_f*FF*parameters.Q*Swetw/parameters.Sw;
    
%Plot
figure(2)
hold on
plot(alphap, Clp)
plot(alphap, droite_pente)
title(strcat('MH32', ' Re = ',num2str(Re), ' alpha = ', num2str(parameters.alpha)))
legend(strcat('CL = ', num2str(CL)), strcat('Cd0 = ', num2str(Cd0)))
xlabel('alpha (°)')
ylabel('Cl')

%% Tail

clear all
close all
clc

load param.mat

M = 0.02; % Mach number 

%Horizontal tail

Sht = parameters.Cht*parameters.c*parameters.Sw/parameters.lht;

Swetht = Sht*(1.977+0.52*parameters.tcht);
FFht = 1.1*(1+(0.6/parameters.xcht)*parameters.tcht+100*(parameters.tcht)^4)*(1.34*M^0.18)*(cos(parameters.Dht)^0.28);
CdoHT = parameters.Cht*FFht*parameters.Qt*Swetht/parameters.Sw;

%Vertical tail

Svt = parameters.Cvt*parameters.bw*parameters.Sw/parameters.lvt;

Swetvt = Svt*(1.977+0.52*parameters.tcvt);
FFvt = 1.1*(1+(0.6/parameters.xcvt)*parameters.tcvt+100*(parameters.tcvt)^4)*(1.34*M^0.18)*(cos(parameters.Dvt)^0.28);
CdoVT = parameters.Cvt*FFvt*parameters.Qt*Swetvt/parameters.Sw;


%% Fuselage

clear all
close all
clc

load param.mat

Re = parameters.rho*parameters.u*parameters.c/parameters.mu;
C_f = 1.328/sqrt(Re) ;

FFf = 1+(60/(parameters.lf/parameters.df)^3)+(parameters.lf/parameters.df)/400;
Aside = parameters.lf*parameters.df;
Atop = pi*parameters.df^2;
Swetf = pi*(Aside+Atop)/2;
CdoF = C_f*FFf*parameters.Q*Swetf/parameters.Sw;
%% Archives

% clear all
% close all
% clc
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Airfoils analysis
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % WING
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% %Airfoil : MH32
% 
% figure(1)
% MH32 = load('MH32.dat')
% plot(MH32(:,1),smooth(MH32(:,2)))
% title('MH32 Airfoil')
% 
% rho0 = 1.225;
% c = 0.1; %comparative table
% mu = 18e-6;
% u = 8; %which velocity is required in cruise
% Re = rho0*u*c/mu;
% 
% % Analyse XFLR
% 
% clmax = 1.1;
% CLmax = 0.9*clmax;
% 
% % Analyse théorique  
% 
% e1 = 0.87; % Oswald coeff
% M = 0.02; % Mach number 
% b =  2;
% S = 0.2; %m2
% A = b*b/S; % Aspect ratio
% c = 0.1; 
% alphachoose = 4; % degrees
% 
% tc = 0.087;
% xc = 0.302;
% 
% alphap = [-5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 12];
% Clp = [-4.003 -0.3205 -0.2218 -0.1218 -0.0384 0.0413 0.1256 0.3366 0.4946 0.6596 0.8006 0.9025 0.9854 1.0499 1.0991 0.9141];
% 
% %a0
% t0 = round(1/3*length(alphap));
% y0 = Clp(t0);
% y1 = Clp(length(alphap)-t0);
% x0 = alphap(t0);
% x1 = alphap(length(alphap)-t0);
% a0 = (y1-y0)/(x1-x0); %a0 en incompressible
% a3d = a0/(sqrt(1-M^2)+a0/(pi*e1*A)); % a0 en 3d
% 
% %alpha for Cl =0
% [trash ,indice] = min(abs(Clp));
% alphal0 = alphap(indice);
% 
% %Final CL 
% CL = a3d*(alphachoose - alphal0);
% 
% %a0 slope to ensure the good approximation
%     
% droite_pente = alphap.*a0;
% oo = Clp(t0)-droite_pente(t0);
% droite_pente = droite_pente + oo;
% 
% % Calcul de Cd0
% 
% C_f = 1.328/sqrt(Re);
% D = 0;
% FF = (1+(0.6/xc)*tc+100*(tc)^4)*(1.34*M^0.18)*(cos(D)^0.28);
% Q = 1;
% Swet = S*(1.977+0.52*tc);
% Cd0 = C_f*FF*Q*Swet/S;
%     
% %Plot
% figure(2)
% hold on
% plot(alphap, Clp)
% plot(alphap, droite_pente)
% title(strcat('MH32', ' Re = ',num2str(Re), ' alpha = ', num2str(alphachoose)))
% legend(strcat('CL = ', num2str(CL)), strcat('Cd0 = ', num2str(Cd0)))
% xlabel('alpha (°)')
% ylabel('Cl')
