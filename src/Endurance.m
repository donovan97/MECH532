function [E] = Endurance(phi,CL,CD,m,S,rho)
% Calcul l'endurance en s durant la mission
%   htypothèse: rho=rho0= 1.225 kg/m, altitude de départ=200m
h=200;  %m
n=1/cos(phi)
Vt=sqrt(2*n*m*g/(rho*S*CL));
V=sqrt(2*m*g/(rho*S*CL));
Vst=sqrt(2*m*g/(rho*S))*(n/CL)^(3/2)*CD;
Vs=n^(-3/2)*Vst;
R=(Vt^2)/(g(n^2-1));
w=sqrt(2*n*m*g/(rho*S*CL))/R;
t_t=pi/w;
h_t=t_t*Vst;
h_g=200-h_t/2;
t_g=h_g/Vs;


E=t_t+2*t_g

end

