function [X] = LFL(disp)

%Calculation of Landing Field Length
%   Assumptions: V=Vglide=cste during the rotation; Drag negligeable
%   compare to solid friction
%%%% mu is the solid friction coefficient

% Inputs: n=load factor, V=Vglide (m/s), parameters.f=solid friction coefficient, gamma=
% glide angle (degre)
% Outputs: LFL, distance during rotation, distance during ground run
global parameters

g=parameters.g;
m=parameters.Wto;
S=parameters.Sw;
rho=parameters.rho;
if disp==1
    %% Case 1: Approach CLmd, Flare + Ground Run CLmd
    var=0;
    while var==0
        Cl=parameters.Cl;
        Cd=parameters.Cd0 + parameters.k*Cl*Cl;


        V=sqrt(2*m*g/(rho*S*Cl));
        gamma=atan(Cd/Cl);
        x1=sin(gamma)*(V^2)/(parameters.n-1);

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
            test_frottement=g-Cl*0.5*rho*S*(v(end)^2)/m;
            if test_frottement <0
                dv=-dt*0.5*rho*S*Cd*(v(end)^2)/m;
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            else
                dv=(dt*(0.5*rho*S*(parameters.f*Cl-Cd)*(v(end)^2)/m)-parameters.f*g*dt);
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            end
        end

        x(end)
        figure(4)
        plot(t,v)
        title('Case 1: Approach CLmd, Flare + Ground Run CLmd')
        ylabel('Speed (m/s)');
        xlabel('Time (s)');

        hold on
        yyaxis right
        ylabel('Distance (m)');
        plot(t,x)
        x2=x(end)-x(indice);
        X=x1+x2;
        var=1;
    end
    %% Case 2: Approach Clmax, Flare + Ground Run CLmax
    var=0;
    while var==0

        Cl=parameters.CLmax;
        Cd=parameters.Cd0 + parameters.k*Cl*Cl;
        Cl/Cd

        V=sqrt(2*m*g/(rho*S*Cl));
        gamma=atan(Cd/Cl);
        x1=sin(gamma)*(V^2)/(parameters.n-1);

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
            test_frottement=g-Cl*0.5*rho*S*(v(end)^2)/m;
            if test_frottement <0
                dv=-dt*0.5*rho*S*Cd*(v(end)^2)/m;
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            else
                dv=(dt*(0.5*rho*S*(parameters.f*Cl-Cd)*(v(end)^2)/m)-parameters.f*g*dt);
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            end
        end

        figure(5)
        plot(t,v)
        title('Case 2: Approach Clmax, Flare + Ground Run CLmax')
        ylabel('Speed (m/s)');
        xlabel('Time (s)');

        hold on
        yyaxis right
        ylabel('Distance (m)');
        plot(t,x)
        x2=x(end)-x(indice);
        X=x1+x2;
        var=1;
    end
    %% Case 3: Approach CLmax, Flare + Ground Run CL=0
    var=0;
    while var==0

        Cl=parameters.CLmax;
        Cd=parameters.Cd0 + parameters.k*Cl*Cl;


        V=sqrt(2*m*g/(rho*S*Cl));
        gamma=atan(Cd/Cl);
        x1=sin(gamma)*(V^2)/(parameters.n-1);

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

        Cl=0;
        Cd=parameters.Cd0;

        while 0 < v(end)
            test_frottement=g-Cl*0.5*rho*S*(v(end)^2)/m;
            if test_frottement <0
                dv=-dt*0.5*rho*S*Cd*(v(end)^2)/m;
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            else
                dv=(dt*(0.5*rho*S*(parameters.f*Cl-Cd)*(v(end)^2)/m)-parameters.f*g*dt);
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            end
        end

        figure(6)
        plot(t,v)
        title('Case 3: Approach CLmax, Flare + Ground Run Cl=0')
        ylabel('Speed (m/s)');
        xlabel('Time (s)');

        hold on
        yyaxis right
        ylabel('Distance (m)');
        plot(t,x)
        x2=x(end)-x(indice);
        X=x1+x2;
        var=1;
    end
    %% Case 4: Approach CLmax, Flare before the runway + Ground Run CLmax
    var=0;
    while var==0

        Cl=parameters.CLmax;
        Cd=parameters.Cd0 + parameters.k*Cl*Cl;


        V=sqrt(2*m*g/(rho*S*Cl));
        gamma=atan(Cd/Cl);
        x1=sin(gamma)*(V^2)/(parameters.n-1);

        T1=x1/V;
        t1=[0:0.01:T1];
        v=[V];
        t=[0];
        x=[0];

        dt=0.01;


        while 0 < v(end)
            test_frottement=g-Cl*0.5*rho*S*(v(end)^2)/m;
            if test_frottement <0
                dv=-dt*0.5*rho*S*Cd*(v(end)^2)/m;
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            else
                dv=(dt*(0.5*rho*S*(parameters.f*Cl-Cd)*(v(end)^2)/m)-parameters.f*g*dt);
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            end
        end

        figure(7)
        plot(t,v)
        title('Case 4: Approach CLmax, Flare before the runway + Ground Run CLmax')
        ylabel('Speed (m/s)');
        xlabel('Time (s)');

        hold on
        yyaxis right
        ylabel('Distance (m)');
        plot(t,x)
        var=1;
        
    end
    X=x(end);
end
% %% Case 5: Approach CLmax, Flare before the runway + Ground Run CL=0
% var=0;
% while var==0
%     
%     Cl=parameters.CLmax;
%     Cd=parameters.Cd0 + parameters.k*Cl*Cl;
%     
%     
%     V=sqrt(2*m*g/(rho*S*Cl));
%     gamma=atan(Cd/Cl);
%     x1=sin(gamma)*(V^2)/(parameters.n-1);
%     
%     T1=x1/V;
%     t1=[0:0.01:T1];
%     v=[V];
%     t=[0];
%     x=[0];
%        
%     dt=0.01;
%     
%     Cl=0;
%     Cd=parameters.Cd0 + parameters.k*Cl*Cl;
%     while 0 < v(end)
%         test_frottement=g-Cl*0.5*rho*S*(v(end)^2)/m;
%         if test_frottement <0
%             dv=-dt*0.5*rho*S*Cd*(v(end)^2)/m;
%             v=[v dv+v(end)];
%             t=[t t(end)+dt];
%             x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
%         else
%             dv=(dt*(0.5*rho*S*(parameters.f*Cl-Cd)*(v(end)^2)/m)-parameters.f*g*dt);
%             v=[v dv+v(end)];
%             t=[t t(end)+dt];
%             x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
%         end
%     end
%     
%     if disp==1
%         figure(8)
%         plot(t,v)
%         title('Case 5: Approach CLmax, Flare before the runway + Ground Run CL=0')
%         ylabel('Speed (m/s)');
%         xlabel('Time (s)');
% 
%         hold on
%         yyaxis right
%         ylabel('Distance (m)');
%         plot(t,x)
%     end
%     var=1;
% 
% end
%% Case 4: Approach CLmax, Flare before the runway + Ground Run CLmax
    var=0;
    while var==0

        Cl=parameters.CLmax;
        Cd=parameters.Cd0 + parameters.k*Cl*Cl;


        V=sqrt(2*m*g/(rho*S*Cl));
        gamma=atan(Cd/Cl);
        x1=sin(gamma)*(V^2)/(parameters.n-1);

        T1=x1/V;
        t1=[0:0.01:T1];
        v=[V];
        t=[0];
        x=[0];

        dt=0.01;


        while 0 < v(end)
            test_frottement=g-Cl*0.5*rho*S*(v(end)^2)/m;
            if test_frottement <0
                dv=-dt*0.5*rho*S*Cd*(v(end)^2)/m;
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            else
                dv=(dt*(0.5*rho*S*(parameters.f*Cl-Cd)*(v(end)^2)/m)-parameters.f*g*dt);
                v=[v dv+v(end)];
                t=[t t(end)+dt];
                x=[x (((v(end)+v(end-1))*dt/2)+x(end))];
            end
        end

%         figure(7)
%         plot(t,v)
%         title('Case 4: Approach CLmax, Flare before the runway + Ground Run CLmax')
%         ylabel('Speed (m/s)');
%         xlabel('Time (s)');
% 
%         hold on
%         yyaxis right
%         ylabel('Distance (m)');
%         plot(t,x)
          var=1;
        
    end
    X=x(end);
end

