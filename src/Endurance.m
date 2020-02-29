function [E] = Endurance(phi,CL,CD,m,S,rho,g)
% Calcul l'endurance en s durant la mission
%   htypoth�se: rho=rho0= 1.225 kg/m, altitude de d�part=200m
h=200;  %m
n=1/cos(phi)
Vt=sqrt(2*n*m*g/(rho*S*CL))
V=sqrt(2*m*g/(rho*S*CL))
Vst=sqrt(2*m*g/(rho*S))*(n/CL)^(3/2)*CD
Vs=n^(-3/2)*Vst
R=(Vt^2)/(g*((n^2)-1))
w=sqrt(2*n*m*g/(rho*S*CL))/R
t_t=pi/w
h_t=t_t*Vst
h_g=100-h_t/2
t_g=h_g/Vs


E=t_t+2*t_g


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

