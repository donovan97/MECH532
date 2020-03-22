function [E] = Endurance()
% Calcul l'endurance en s durant la mission
%   htypothèse: rho=rho0= 1.225 kg/m, altitude de départ=200m
load param.mat
m=parameters.Wto/parameters.g;
S=parameters.L*(parameters.Co+parameters.Ct);
h=200;  %m

Vt=sqrt(2*parameters.n*m*parameters.g/(parameters.rho*S*parameters.Cl));
V=sqrt(2*m*parameters.g/(parameters.rho*S*parameters.Cl));
Vst=sqrt(2*m*parameters.g/(parameters.rho*S))*(parameters.n/parameters.Cl)^(3/2)*parameters.Cd;
Vs=parameters.n^(-3/2)*Vst;
R=(Vt^2)/(parameters.g*((parameters.n^2)-1));
w=sqrt(2*parameters.n*m*parameters.g/(parameters.rho*S*parameters.Cl))/R;
t_t=pi/w;
h_t=t_t*Vst;
h_g=100-h_t/2;
t_g=h_g/Vs;


E=t_t+2*t_g;


%%Plot trajectoire
t=[0:1:E];
x=[0:1:E];
y=[0:1:E];
z=[0:1:E];
z(1)=200;
x(1)=0;
for k=1:floor(t_g)
    z(k+1)=z(k)-Vs;
    x(k+1)=x(k)+V;
end

for k=floor(t_g+1):floor(t_g+t_t)
    z(k+1)=z(k)-Vst;
    x(k+1)=x(k)+R*w*sin(w*(t(k)-t_g+1));
end

for k=floor(t_g+t_t+1):length(y)-1
    z(k+1)=z(k)-Vs;
    x(k+1)=x(k)-V;
end
    
plot(x,z,'+')
xlabel('x (m)')
ylabel('z (m)')

