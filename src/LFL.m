function [X,x1,x2,x,v,t] = LFL()

%Calculation of Landing Field Length
%   Assumptions: V=Vglide=cste during the rotation; Drag negligeable
%   compare to solid friction
%%%% mu is the solid friction coefficient

% Inputs: n=load factor, V=Vglide (m/s), parameters.f=solid friction coefficient, gamma=
% glide angle (degre)
% Outputs: LFL, distance during rotation, distance during ground run
load param.mat

g=parameters.g;
m=parameters.Wto;
S=parameters.Sw;


V=sqrt(2*m*g/(parameters.rho*S*parameters.Cl));
gamma=atan(parameters.Cd/parameters.Cl);
x1=sin(gamma)*(V^2)/(parameters.n-1);

Cl = 0 ;

% x2=(V^2)/(2*parameters.f*g);
% 
%     function dVdt=landing(t,v)
%         if 0<=v
%             dVdt=-parameters.f*g + 0.5*parameters.rho*S*v^2*(parameters.f*parameters.CLmax-parameters.Cd)/m;
%         else
%             dVdt=0
%         end
%     end
%[t,v]= ode45(@landing,[0 10],[V]);    

T1=x1/V;
t1=[0:0.01:T1];
v=V*ones(1,length(t1));
t=[t1];
x=[0];

for k=1:length(t1)-1
    x=[x x(end)+V*0.01];
    indice=k;
end

dt=0.01;



while 0 < v(end)
    test_frottement=g-Cl*0.5*parameters.rho*S*(v(end)^2)/m;
    if test_frottement <0
        dv=-dt*0.5*parameters.rho*S*parameters.Cd*(v(end)^2)/m;
        v=[v dv+v(end)];
        t=[t t(end)+dt];
        x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
    else
        dv=(dt*(0.5*parameters.rho*S*(parameters.f*Cl-parameters.Cd)*(v(end)^2)/m)-parameters.f*g*dt);
        v=[v dv+v(end)];
        t=[t t(end)+dt];
        x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
    end
end
x(end)
figure(4)
plot(t,v)
title('Landing speed and distance')
ylabel('Speed (m/s)');
xlabel('Time (s)');

hold on
yyaxis right
ylabel('Distance (m)');
plot(t,x) 
x2=x(end)-x(indice);
X=x1+x2;
end

