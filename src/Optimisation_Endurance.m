close all
clear all
global parameters
Param_def;
n=20;
ct_min=0.05;
ct_max=0.3;
b_min=1;
b_max=2;
ct=[];
b=[];
column_ct=transpose(linspace(ct_min,ct_max,n));  
line_b=linspace(b_min,b_max,n);
for k=1:n
    b=[b
        line_b];
    ct=[ct column_ct];
end
        
        
E=zeros(n,n);
ct_failure=zeros(4,n*n);      % ligne 1:LFL                    
b_failure=zeros(4,n*n);       % ligne 2:structure
E_failure=zeros(4,n*n);       % ligne 3 et 4: resp long et lat
iter1=1;
iter2=1;
iter3=1;
iter4=1;

ClCd=zeros(n,n);

cl=zeros(n,n);



%%

for i=1:n

%test=test+100;

%save('param.mat','parameters')

    for j=1:n
        parameters.Ct=ct(i,j);
        parameters.Co=ct(i,j);                
        parameters.bw=b(i,j);
        parameters.Sw=parameters.Ct*parameters.bw;
        parameters.L            = 0.5*parameters.bw;  
        parameters.lambda  		= parameters.Ct/parameters.Co;
        parameters.Cvt          = (parameters.Svt*parameters.lt)/(parameters.bw*parameters.Sw) ;
        parameters.Cht          = (parameters.Sht*parameters.lt)/(parameters.c*parameters.Sw)   ;
        parameters.c            = (parameters.Co+parameters.Ct)/2;
        parameters.t       		= 0.12*parameters.Co;
        parameters.h       		= 0.02*parameters.Co; 
       % test=test+1;
        parameters.Wws     		= 30*parameters.bw*pi*parameters.t*parameters.Co/4 ;  					    % [kg]           Weight of wing structure
        parameters.Wfus    		= 0.19+1.5; 						% [kg]           Weight of the fuselage
        parameters.Wto     		= parameters.Wws +parameters.Wfus;  % [kg]           Total aircraft weight
        parameters.Wto 

        [CLmp,CDmp, Cd0, k] = Derivation_CL_mp(0);
        parameters.Cl=CLmp;
        parameters.Cd=CDmp;
        %CLL=Cl
        
        parameters.Cd0=Cd0;
        parameters.k=k;
        V=sqrt(2*parameters.Wto*parameters.g/(parameters.rho*parameters.Sw*parameters.Cl));
        parameters.drag = 0.5*parameters.rho*parameters.Sw*V*V*parameters.Cd;

       % test=test+1;
       % test2=test
        %Vst=sqrt(2*Wto/(rho*Sw))*(n/Cl)^(3/2)*Cd 
         


        Endu=Endurance(0);

        [Hn_fixed, Hn_free] = LongitudinalStaticStability(0);

        [CnB_directional, CnB_lateral] = DirectionalLateralStaticStability(0);

        [V0y, V0x, M0y, M0x, margin_tensile, margin_compressive,structure_test] = moment(0);

        LFL_test=LFL(0);
        if LFL_test >= 15
            ct_failure(1,iter1)=ct(i,j);
            b_failure(1,iter1)=b(i,j);
            E_failure(1,iter1)=Endu;
            iter1=iter1+1;
        end  
        if structure_test == 1
            ct_failure(2,iter2)=ct(i,j);
            b_failure(2,iter2)=b(i,j);
            E_failure(2,iter2)=Endu;
            iter2=iter2+1;
        end
        
        if Hn_fixed <= 0 || Hn_free <= 0
            ct_failure(3,iter3)=ct(i,j);
            b_failure(3,iter3)=b(i,j);
            E_failure(3,iter3)=Endu;
            iter3=iter3+1;
        end
            
        if CnB_directional <= 0 || CnB_lateral >= 0
            ct_failure(4,iter4)=ct(i,j);
            b_failure(4,iter4)=b(i,j);
            E_failure(4,iter4)=Endu;
            iter4=iter4+1;
        end
        
        E_failure;
        E(i,j)=Endu;
        
        
            
            
            
        
        cl(i,j)=parameters.Cl;
    
    
    
    end
end

%%
surf(ct(:,1),b(1,:),transpose(E))
hold on
scatter3(nonzeros(ct_failure(1,:)),nonzeros(b_failure(1,:)),nonzeros(E_failure(1,:)),'x','r')
hold on
scatter3(nonzeros(ct_failure(2,:)),nonzeros(b_failure(2,:)),nonzeros(E_failure(2,:)),'y')
hold on
scatter3(nonzeros(ct_failure(3,:)),nonzeros(b_failure(3,:)),nonzeros(E_failure(3,:)),'b')
hold on
scatter3(nonzeros(ct_failure(4,:)),nonzeros(b_failure(4,:)),nonzeros(E_failure(4,:)),'g')
legend('Endurance','LFL','Structure','Longitudinal','Lateral')
xlabel('Chord (m)')
ylabel('Span (m)')
zlabel('Endurance (s)')