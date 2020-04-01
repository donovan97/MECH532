function [Cd0,k] = Parasitedrag(Cl)

load param.mat

Vreynolds=sqrt(2*parameters.Wto*parameters.g/(parameters.rho*parameters.Sw*Cl));
Re_W = parameters.rho*Vreynolds*parameters.c/parameters.mu;

% Analyse XFLR

% Analyse théorique  

M = Vreynolds/(1.4*287*287.75); % Mach number 
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
%CL = a3d*(parameters.alphaw - alphal0)

%a0 slope to ensure the good approximation
    
droite_pente = alphap.*a0;
oo = Clp(t0)-droite_pente(t0);
droite_pente = droite_pente + oo;

% Wing

C_f = 1.328/sqrt(Re_W);
FF = (1+(0.6/parameters.xcw)*parameters.tcw+100*(parameters.tcw)^4)*(1.34*M^0.18)*(cos(parameters.Dw)^0.28);
Swetw = parameters.Sw*(1.977+0.52*parameters.tcw);
Cd0_w = C_f*FF*parameters.Q*Swetw/parameters.Sw;


% Tail

M = 0.02; % Mach number 

%Horizontal tail

Sht = 0.1*parameters.c*parameters.Sw/parameters.lt;

Swetht = Sht*(1.977+0.52*parameters.tcht);
FFht = 1.1*(1+(0.6/parameters.xcht)*parameters.tcht+100*(parameters.tcht)^4)*(1.34*M^0.18)*(cos(parameters.Dht)^0.28);
Cd0_HT = 0.1*FFht*parameters.Qt*Swetht/parameters.Sw;

%Vertical tail

Svt = parameters.Cvt*parameters.bw*parameters.Sw/parameters.lt;

Swetvt = Svt*(1.977+0.52*parameters.tcvt);
FFvt = 1.1*(1+(0.6/parameters.xcvt)*parameters.tcvt+100*(parameters.tcvt)^4)*(1.34*M^0.18)*(cos(parameters.Dvt)^0.28);
Cd0_VT = parameters.Cvt*FFvt*parameters.Qt*Swetvt/parameters.Sw;

% Fuselage

Re_f = parameters.rho*Vreynolds*parameters.lf/parameters.mu;
C_f = 1.328/sqrt(Re_f) ;

FFf = 1+(60/(parameters.lf/parameters.df)^3)+(parameters.lf/parameters.df)/400;
Aside = parameters.lf*parameters.df;
Atop = pi*parameters.df^2;
Swetf = pi*(Aside+Atop)/2;
Cd0_F = C_f*FFf*parameters.Q*Swetf/parameters.Sw;

k = 2*1/(pi*Aw*parameters.e);

Cd0 =(1/12)*(Cd0_w + Cd0_HT + Cd0_VT + Cd0_F);
CD = Cd0_w + Cd0_HT + Cd0_VT + Cd0_F + k*Cl*Cl;
parameters.Cd=CD;
f = Cl/CD;





end

