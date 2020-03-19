function [X,x1,x2,x,t] = LFL(mu)
%Calculation of Landing Field Length
%   Assumptions: V=Vglide=cste during the rotation; Drag negligeable
%   compare to solid friction
%%%% mu is the solid friction coefficient
m=parameters.Wto/parameters.g;
% Inputs: n=load factor, V=Vglide (m/s), mu=solid friction coefficient, gamma=
% glide angle (degre)
% Outputs: LFL, distance during rotation, distance during ground run
S=parameters.L*(parameters.Co+parameters.Ct);
V=sqrt(2*m*g/(parameters.rho*S*parameters.CL));
gamma=atan(parameters.CD/parameters.CL);
x1=sin(gamma)*(V^2)/(parameters.n-1);
% x2=(V^2)/(2*mu*g);
% 
%     function dVdt=landing(t,v)
%         if 0<=v
%             dVdt=-mu*g + 0.5*parameters.rho*S*v^2*(mu*parameters.CL-parameters.CD)/m;
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
end
length(t1)
length(x)
dt=0.01;



while 0 < v(end)
    test_frottement=g-parameters.CL*0.5*parameters.rho*S*(v(end)^2)/m;
    if test_frottement <0
        dv=-dt*0.5*parameters.rho*S*parameters.CD*(v(end)^2)/m;
        v=[v dv+v(end)];
        t=[t t(end)+dt];
        x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
    else
        dv=(dt*(0.5*parameters.rho*S*(mu*parameters.CL-parameters.CD)*(v(end)^2)/m)-mu*g*dt);
        v=[v dv+v(end)];
        t=[t t(end)+dt];
        x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
    end
end
clear figure
plot(t,v)
ylabel('Speed (m/s)');
xlabel('Time (s)');
pause
hold on
yyaxis right
ylabel('Distance(m)');
plot(t,x)
x2=x(end);
X=x1+x2;
end

