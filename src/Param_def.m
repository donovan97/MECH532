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

%Parameters

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
%Les paramètres avec un vt correspondent aux paramètres de l'empennage
%verticale
parameters.lvt          = 1 ;                               % [m]            distance aile/empennage
parameters.tcvt         = 0.15 ;                            %                épaisseur max    
parameters.xcvt         = 0.30 ;                            %                position de l'épaisseur max
parameters.Dvt          = 0 ;                               % [degré]        angle de dihèdre
%Les paramètres avec un f correspondent aux paramètres du fuselage 
%parameters.lf           = ;                                 % [m]            longueur du fuselage
%parameters.df           = ;                                 % [m]            diamètre du fuselage
%parameters.Sf           = ;                                 % [m^2]          surface à l'air fuselage        
save('param.mat','parameters')