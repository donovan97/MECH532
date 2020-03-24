%Constants

parameters.Wws     		= 7790 ;  							% [kg]           Weight of wing structure
parameters.Wfus    		= 31160 ; 							% [kg]           Weight of the fuselage
parameters.Wto     		= parameters.Wws +parameters.Wfus   % [kg]           Total aircraft weight
parameters.rho          = 1.225;                            % [kg/m^3]       masse volumique   
parameters.mu           = 18*10E-6 ;                        % [Pa/s]         viscosité dynamique   
parameters.e            = 0.87 ;                            %                coefficient d'Oswald   

%Material properties of EPP foam

parameters.Sut          = 0.38 ;                            % [MPa]          Ultimate tensile strength of EPP foam
parameters.Suc          = 0.44 ;                            % [MPa]          Ultimate compressive strength of EPP foam

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

parameters.Cl           =  1.1 ;                            % [-]            Lift coefficient (3D?)
parameters.Kn           =  0.003 ;                          % [-]            Wing-body interference factor, obtain manually from Pamadi P.271
parameters.Krl          =  1.5 ;                            % [-]            Reynolds number factor, obtain manually from Pamadi P.272
parameters.zv           =  0.25 ;                           % [m]            Vertical distance between center of gravity and vertical tail aerodynamic center
parameters.lv           =  1 ;                              % [m]            Horizontal distance between center of gravity and vertical tail aerodynamic center

%General Parameters

parameters.L       		= 30 ;    							% [m]            Length of one wing
parameters.Co      		= 2.5 ;     						% [m]            Chord length at wing root
parameters.Ct      		= 1.5 ;     						% [m]            Chord length at wingtip
parameters.c            = 0.1;                              % [m]            Mean chord   
parameters.lambda  		= parameters.Ct/parameters.Co;    	% [-]            Taper ratio
parameters.t       		= 0.12*parameters.Co;  				% [m]            Max thickness of NACA 2412
parameters.h       		= 0.02*parameters.Co;      			% [m]            max camber of NACA 
parameters.n       		= 1 ;       						% [-]            load factor
parameters.g       		= 9.81;     						% [m/s^2)        gravitational constant
parameters.dihedralw    = 0 ;           					% [rad]          Dihedral angle of the wing
parameters.x            = linspace(0, parameters.L,1000);
parameters.drag         = 15 ;           					% [N]            Total drag force on the glider
parameters.u            = 8 ;                               % [m/s]          Speed of glider   
parameters.clmax        = 1.1 ;                             %                clmax 2D 
%Les paramètres avec un w correspondent aux paramètres de l'aile
parameters.bw           = 2 ;                               % [m]            envergure
parameters.Sw           = 0.2 ;                             % [m^2]          surface à l'air
parameters.alphaw       = 2 ;                               % [degré]        angle d'incidence
parameters.tcw          = 0.087 ;                           %                épaisseur max    
parameters.xcw          = 0.302 ;                           %                position de l'épaisseur max   
parameters.Dw           = 5 ;                               % [degré]        angle de dihèdre
parameters.Q            = 1 ;                               %                coefficient d'interférence

%Les paramètres avec un vt correspondent aux paramètres de l'empennage
%horizontal
parameters.Cvt          = 0.02; %ou 0.04                    %                coefficient d'empennage vertical
parameters.Cht          = 0.5 ;                             %                coefficient d'empennage horizontal
parameters.tcht         = 0.15 ;                            %                épaisseur max    
parameters.xcht         = 0.30 ;                            %                position de l'épaisseur max
parameters.lht          = 1 ;                               % [m]            distance aile/empennage
parameters.Dht          = 0 ;                               % [degré]        angle de dihèdre
parameters.Sht          = 0.05  ;                           % [m^2]          (Horizontal) tailplane area
parameters.Qt           = 1.04 ;                            %                coefficient d'interférence

%Les paramètres avec un vt correspondent aux paramètres de l'empennage
%verticale
parameters.lvt          = 1 ;                               % [m]            distance aile/empennage
parameters.tcvt         = 0.15 ;                            %                épaisseur max    
parameters.xcvt         = 0.30 ;                            %                position de l'épaisseur max
parameters.Dvt          = 0 ;                               % [degré]        angle de dihèdre
parameters.Svt          = 0.025  ;                          % [m^2]          (Vertical) fin area
parameters.avt          = 3.5  ;                            % [-]            Fin lift curve slope

%Les paramètres avec un f correspondent aux paramètres du fuselage 
parameters.lf           = 2;                                % [m]            longueur du fuselage
parameters.df           = 0.25;                             % [m]            diamètre du fuselage
parameters.Sf           = 0.5;                              % [m^2]          surface à l'air fuselage  
parameters.Sprojf       = 0.5;                              % [m^2]          projected side area of fuselage 

save('param.mat','parameters')