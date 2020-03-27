%Constants

parameters.Wws     		= 0.5 ;  							% [kg]           Weight of wing structure
parameters.Wfus    		= 1.5 ; 							% [kg]           Weight of the fuselage
parameters.Wto     		= parameters.Wws +parameters.Wfus;   % [kg]           Total aircraft weight
parameters.rho          = 1.225;                            % [kg/m^3]       masse volumique   
parameters.mu           = 18E-6 ;                        % [Pa/s]         viscosit� dynamique   
parameters.e            = 0.87 ;                            %                coefficient d'Oswald   

%Material properties of EPP foam

parameters.Sut          = 0.38 ;                            % [MPa]          Ultimate tensile strength of EPP foam
parameters.Suc          = 0.44 ;                            % [MPa]          Ultimate compressive strength of EPP foam

%frottement avec la piste d'aterrisage
parameters.f            = 0.8 ;                              % [s-u]          coefficient de frottement avec la piste d'aterrissage
%Parameters for longitudinal static stability

parameters.cg           = 0.75 ;                            % [m]            Centerline distance from the front tip of the aircraft to the center of gravity (obtain from CAD?)
parameters.wingDist     = 1 ;                               % [m]            Centerline distance from the front tip of the aircraft to the leading edge of the wing
parameters.h0           = 0.25 ;                            % [-]            Distance of aerodynamic center aft leading edge of MAC(mean aerodynamic chord), normalized by MAC (set to 0.25)
parameters.lt           = 0.5  ;                            % [m]            Tailplane moment arm
parameters.a            = 4.2 ;                             % [-]            Wing lift curve slope
parameters.a1           = 4.3 ;                             % [-]            Tailplane lift curve slope
parameters.a2           = 1.2 ;                             % [-]            Elevator lift curve slope
parameters.b1           = -0.006 ;                          % [-]            Tailplane hinge curve slope
parameters.b2           = -0.014 ;                          % [-]            Elevator hinge curve slope

%Parameters for directional and lateral static stability

parameters.Cd           =  0.036 ;                            % [-]            Drag coefficient (3D?)
parameters.Cl           =  1.1 ;                            % [-]            Lift coefficient (3D?)
parameters.Kn           =  0.003 ;                          % [-]            Wing-body interference factor, obtain manually from Pamadi P.271
parameters.Krl          =  1.5 ;                            % [-]            Reynolds number factor, obtain manually from Pamadi P.272
parameters.zv           =  0.25 ;                           % [m]            Vertical distance between center of gravity and vertical tail aerodynamic center
parameters.lv           =  1 ;                              % [m]            Horizontal distance between center of gravity and vertical tail aerodynamic center

%General Parameters

parameters.Co      		= 2.5 ;     						% [m]            Chord length at wing root
parameters.Ct      		= 1.5 ;     						% [m]            Chord length at wingtip
parameters.c            = 0.1;                              % [m]            Mean chord   
parameters.lambda  		= parameters.Ct/parameters.Co;    	% [-]            Taper ratio
parameters.t       		= 0.12*parameters.Co;  				% [m]            Max thickness of NACA 2412
parameters.h       		= 0.02*parameters.Co;      			% [m]            max camber of NACA 
parameters.n       		= 1.3 ;       						% [-]            load factor
parameters.g       		= 9.81;     						% [m/s^2)        gravitational constant
parameters.dihedralw    = 0 ;           					% [rad]          Dihedral angle of the wing
parameters.drag         = 15 ;           					% [N]            Total drag force on the glider
parameters.u            = 8 ;                               % [m/s]          Speed of glider   
parameters.clmax        = 1.1 ;                             %                clmax 2D
parameters.CLmax        = 0.99 ;                            %                CLmax 3D

%Les param�tres avec un w correspondent aux param�tres de l'aile

parameters.bw           = 2 ;                               % [m]            envergure
parameters.L       		= 0.5*parameters.bw;                % [m]            Needed for load_forces and moment
parameters.x            = linspace(0, parameters.L,1000);
parameters.Sw           = 0.2 ;                             % [m^2]          surface � l'air
parameters.alphaw       = 2 ;                               % [degr�]        angle d'attaque
parameters.tcw          = 0.087 ;                           %                �paisseur max    
parameters.xcw          = 0.302 ;                           %                position de l'�paisseur max   
parameters.Dw           = 5 ;                               % [degr�]        angle de dih�dre
parameters.Q            = 1 ;                               %                coefficient d'interf�rence

%Les param�tres avec un vt correspondent aux param�tres de l'empennage
%horizontal

parameters.Cht          = 0.1 ;                             %                coefficient d'empennage horizontal
parameters.tcht         = 0.15 ;                            %                �paisseur max    
parameters.xcht         = 0.30 ;                            %                position de l'�paisseur max
parameters.Dht          = 0 ;                               % [degr�]        angle de dih�dre
parameters.Sht          = 0.05  ;                           % [m^2]          (Horizontal) tailplane area
parameters.Qt           = 1.04 ;                            %                coefficient d'interf�rence

%Les param�tres avec un vt correspondent aux param�tres de l'empennage
%verticale

parameters.Cvt          = 0.02; %ou 0.04                    %                coefficient d'empennage vertical
parameters.tcvt         = 0.15 ;                            %                �paisseur max    
parameters.xcvt         = 0.30 ;                            %                position de l'�paisseur max
parameters.Dvt          = 0 ;                               % [degr�]        angle de dih�dre
parameters.Svt          = 0.025  ;                          % [m^2]          (Vertical) fin area
parameters.avt          = 3.5  ;                            % [-]            Fin lift curve slope

%Les param�tres avec un f correspondent aux param�tres du fuselage 
parameters.lf           = 2;                                % [m]            longueur du fuselage
parameters.df           = 0.25;                             % [m]            diam�tre du fuselage
parameters.Sf           = 0.5;                              % [m^2]          surface � l'air fuselage  
parameters.Sprojf       = 0.5;                              % [m^2]          projected side area of fuselage 


save('param.mat','parameters')