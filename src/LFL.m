function [X,x1,x2] = LFL(n,mu,g,CL,CD,rho,S,m)
%Calculation of Landing Field Length
%   Assumptions: V=Vglide=cste during the rotation; Drag negligeable
%   compare to solid friction

% Inputs: n=load factor, V=Vglide (m/s), mu=solid friction coefficient, gamma=
% glide angle (degre)
% Outputs: LFL, distance during rotation, distance during ground run
V=sqrt(2*m*g/(rho*S*CL));
gamma=atan(CD/CL);
x1=sin(gamma)*(V^2)/(n-1);
% x2=(V^2)/(2*mu*g);
% 
%     function dVdt=landing(t,v)
%         if 0<=v
%             dVdt=-mu*g + 0.5*rho*S*v^2*(mu*CL-CD)/m;
%         else
%             dVdt=0
%         end
%     end
%[t,v]= ode45(@landing,[0 10],[V]);     
v=[V];
t=[0];
x=[0];
dt=0.1;



while 0 < v(end)
    test_frottement=g-CL*0.5*rho*S*(v(end)^2)/m;
    if test_frottement <0
        dv=-dt*0.5*rho*S*CD*(v(end)^2)/m;
        v=[v dv+v(end)];
        t=[t t(end)+dt];
        x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
    else
        dv=(dt*(0.5*rho*S*(mu*CL-CD)*(v(end)^2)/m)-mu*g*dt);
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

