%Constants
parameters.test         =0;
parameters.Wws     		= 0.00216 ;  					    % [kg]           Weight of wing structure
parameters.Wfus    		= 0.19+1.5; 						% [kg]           Weight of the fuselage
parameters.Wto     		= parameters.Wws +parameters.Wfus;  % [kg]           Total aircraft weight
parameters.rho          = 1.225;                            % [kg/m^3]       masse volumique   
parameters.mu           = 18E-6 ;                           % [Pa/s]         viscosité dynamique   
parameters.e            = 0.85 ;                            %                coefficient d'Oswald   

%Material properties of EPP foam

parameters.Sut          = 0.38 ;                            % [MPa]          Ultimate tensile strength of EPP foam
parameters.Suc          = 0.44 ;                            % [MPa]          Ultimate compressive strength of EPP foam

%frottement avec la piste d'aterrisage
parameters.f            = 0.8 ;                             % [s-u]          coefficient de frottement avec la piste d'aterrissage
%Parameters for longitudinal static stability

parameters.cg           = 0.49 ;                            % [m]            Centerline distance from the front tip of the aircraft to the center of gravity (obtain from CAD?)
parameters.wingDist     = 0.45 ;                            % [m]            Centerline distance from the front tip of the aircraft to the leading edge of the wing
parameters.h0           = 0.25 ;                            % [-]            Distance of aerodynamic center aft leading edge of MAC(mean aerodynamic chord), normalized by MAC (set to 0.25)
parameters.lt           = 0.84  ;                           % [m]            Tailplane moment arm
parameters.a            = 4.2 ;                             % [-]            Wing lift curve slope
parameters.a1           = 4.3 ;                             % [-]            Tailplane lift curve slope
parameters.a2           = 1.2 ;                             % [-]            Elevator lift curve slope
parameters.b1           = -0.006 ;                          % [-]            Tailplane hinge curve slope
parameters.b2           = -0.014 ;                          % [-]            Elevator hinge curve slope

%Parameters for directional and lateral static stability

parameters.Cd           =  0.036 ;                          % [-]            Drag coefficient (3D?)
parameters.Cl           =  0.33 ;                            % [-]            Lift coefficient (3D?)
parameters.Kn           =  0.001 ;                          % [-]            Wing-body interference factor, obtain manually from Pamadi P.271
parameters.Krl          =  1.5 ;                            % [-]            Reynolds number factor, obtain manually from Pamadi P.272
parameters.zv           =  0.01 ;                           % [m]            Vertical distance between center of gravity and vertical tail aerodynamic center
parameters.lv           =  0.85 ;                           % [m]            Horizontal distance between center of gravity and vertical tail aerodynamic center

%General Parameters

parameters.Co      		= 0.2 ;     						% [m]            Chord length at wing root
parameters.Ct      		= 0.2;     						% [m]            Chord length at wingtip
parameters.c            = (parameters.Co+parameters.Ct)/2;  % [m]            Mean chord   
parameters.lambda  		= parameters.Ct/parameters.Co;    	% [-]            Taper ratio
parameters.t       		= 0.12*parameters.Co;  				% [m]            Max thickness of MH32
parameters.h       		= 0.02*parameters.Co;      			% [m]            max camber of MH32 
parameters.phi          = 40*2*pi/360;                      % [rad]          banking angle
parameters.n       		= 1/cos(parameters.phi);       		% [-]            load factor
parameters.g       		= 9.81;     						% [m/s^2)        gravitational constant
parameters.dihedralw    = 0 ;           					% [rad]          Dihedral angle of the wing
parameters.drag         = 15 ;           					% [N]            Total drag force on the glider
parameters.u            = 8 ;                               % [m/s]          Speed of glider   
parameters.clmax        = 1.1 ;                             %                clmax 2D
parameters.CLmax        = 0.99 ;                            %                CLmax 3D
parameters.Cl           = 0.99;
parameters.Cd           = 0;
parameters.Cd0          =0.5;
parameters.k            =0.5;

%Les paramètres avec un w correspondent aux paramètres de l'aile

parameters.bw           = 2;                             % [m]            envergure/span
parameters.L       		= 0.5*parameters.bw;                % [m]            Needed for load_forces and moment
parameters.x            = linspace(0, parameters.L,1000);
parameters.Sw           = parameters.bw*parameters.Ct;      % [m^2]          surface à l'air
parameters.alphaw       = 2 ;                               % [degré]        angle d'attaque
parameters.tcw          = 0.087 ;                           %                épaisseur max    
parameters.xcw          = 0.302 ;                           %                position de l'épaisseur max   
parameters.Dw           = 5 *(pi/180);                      % [radian]        angle de dihèdre
parameters.Q            = 1 ;                               %                coefficient d'interférence

%Les paramètres avec un vt correspondent aux paramètres de l'empennage
%horizontal

parameters.tcht         = 0.15 ;                            %                épaisseur max    
parameters.xcht         = 0.30 ;                            %                position de l'épaisseur max
parameters.Dht          = 0 ;                               % [degré]        angle de dihèdre
parameters.Sht          = 0.03  ;                           % [m^2]          (Horizontal) tailplane area
parameters.Qt           = 1.04 ;                            %                coefficient d'interférence
parameters.Cht          = (parameters.Sht*parameters.lt)/(parameters.c*parameters.Sw)   ;                             %                coefficient d'empennage horizontal

%Les paramètres avec un vt correspondent aux paramètres de l'empennage
%verticale

parameters.tcvt         = 0.15 ;                            %                épaisseur max    
parameters.xcvt         = 0.30 ;                            %                position de l'épaisseur max
parameters.Dvt          = 0 ;                               % [degré]        angle de dihèdre
parameters.Svt          = 0.01  ;                           % [m^2]          (Vertical) fin area
parameters.avt          = 3.5  ;                            % [-]            Fin lift curve slope
parameters.Cvt          = (parameters.Svt*parameters.lt)/(parameters.bw*parameters.Sw) ;                   %                coefficient d'empennage vertical

%Les paramètres avec un f correspondent aux paramètres du fuselage 
parameters.lf           = 1.4;                              % [m]            longueur du fuselage
parameters.df           = 0.17;                             % [m]            diamètre du fuselage  
parameters.Sprojf       = 0.15;                             % [m^2]          projected side area of fuselage 


save('param.mat','parameters')