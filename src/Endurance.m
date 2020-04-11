function [E] = Endurance(disp)
% Calcul l'endurance en s durant la mission
%   htypothèse: rho=rho0= 1.225 kg/m, altitude de départ=200m
global parameters
m=parameters.Wto;
S=parameters.Sw;
h=200;  %m

Vt=sqrt(2*parameters.n*m*parameters.g/(parameters.rho*S*parameters.Cl));
V=sqrt(2*m*parameters.g/(parameters.rho*S*parameters.Cl));
Vst=sqrt(2*m*parameters.g/(parameters.rho*S))*(parameters.n/parameters.Cl)^(3/2)*parameters.Cd ;
Vs=parameters.n^(-3/2)*Vst;
R=(Vt^2)/(parameters.g*((parameters.n^2)-1));
w=sqrt(2*parameters.n*m*parameters.g/(parameters.rho*S*parameters.Cl))/R;
t_t=pi/w;
h_t=t_t*Vst;
h_g=100-h_t/2;
t_g=h_g/Vs;


E=t_t+2*t_g;

dt=0.1;
%%Plot trajectoire
t_1=[0:dt:t_g];
x_1=[0:dt:t_g];
z_1=[0:dt:t_g];

z_1(1)=200;
x_1(1)=0;
for k=1:length(t_1)
    z_1(k+1)=z_1(k)-Vs*dt;
    x_1(k+1)=x_1(k)+V*dt;
end
t_2=[0:dt:t_t];
x_2=[0:dt:t_t];
z_2=[0:dt:t_t];

z_2(1)=z_1(end);
x_2(1)=x_1(end);

for k=1:length(t_2)
    z_2(k+1)=z_2(k)-Vst*dt;
    x_2(k+1)=x_2(1)+R*sin(w*t_2(k));
    R*w*sin(w*t_2(k))*dt;
end
t_3=[0:dt:t_g];
x_3=[0:dt:t_g];
z_3=[0:dt:t_g];

z_3(1)=z_2(end);
x_3(1)=x_2(end);
for k=1:length(t_3)
    z_3(k+1)=z_3(k)-Vs*dt;
    x_3(k+1)=x_3(k)-V*dt;
end
x=[x_1 x_2 x_3];
z=[z_1 z_2 z_3];
t=[t_1 t_2+t_1(end) t_3+(t_1(end)+t_2(end))];

if disp==1
    figure(3)
    plot(x,z)
    title("Mission profil")
    xlabel('x (m)')
    ylabel('h (m)')
end
end

