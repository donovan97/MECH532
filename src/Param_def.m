%Constants

parameters.Wws     		= 7790 ;  							% [kg]           Weight of wing structure
parameters.Wfus    		= 31160 ; 							% [kg]           Weight of the fuselage (Tru Sim)
parameters.Wto     		= parameters.Wws +parameters.Wfus   % [kg]           Total aircraft weight
parameters.E       		= 73;       						% [GPa]          Young's modulus AL2024 https://amesweb.info/Materials/Youngs-Modulus-of-Aluminum.aspx
parameters.sigma_yield  = 324;          					% [MPa]          Yield stress of AL2024 http://asm.matweb.com/search/SpecificMaterial.asp?bassnum=MA2024T4
parameters.rho          = 1.225;                            % [kg/m^3]       masse volumique   
parameters.mu           = 18*10E-6 ;                        % [Pa/s]         viscosit� dynamique   
parameters.e            = 0.87 ;                            %                coefficient d'Oswald   

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
parameters.dihedral     = 0 ;           					% [rad]          Dihedral angle of the wing
parameters.x            = linspace(0, parameters.L,1000);   % [-]            1000 discrete points for wing
parameters.drag         = 15 ;           					% [N]            Total drag force on the glider

%Material properties of EPP foam

parameters.Sut          = 0.38 ;                            % [MPa]          Ultimate tensile strength of EPP foam
parameters.Suc          = 0.44 ;                            % [MPa]          Ultimate compressive strength of EPP foam



parameters.dihedralw    = 0 ;           					% [rad]          Dihedral angle of the wing
parameters.x            = linspace(0, parameters.L,1000);
parameters.drag         = 15 ;           					% [N]            Total drag force on the glider
parameters.u            = 8 ;                               % [m/s]          Speed of glider   
parameters.clmax        = 1.1 ;                             %                clmax 2D    
%Les param�tres avec un w correspondent aux param�tres de l'aile
parameters.bw           = 2 ;                               % [m]            envergure
parameters.Sw           = 0.2 ;                             % [m^2]          surface � l'air
parameters.alphaw       = 2 ;                               % [degr�]        angle d'incidence
parameters.tcw          = 0.087 ;                           %                �paisseur max    
parameters.xcw          = 0.302 ;                           %                position de l'�paisseur max   
parameters.Dw           = 5 ;                               % [degr�]        angle de dih�dre
parameters.Q            = 1 ;                               %                coefficient d'interf�rence
%Les param�tres avec un vt correspondent aux param�tres de l'empennage
%horizontal
parameters.Cvt          = 0.02; %ou 0.04                    %                coefficient d'empennage vertical
parameters.Cht          = 0.5 ;                             %                coefficient d'empennage horizontal
parameters.tcht         = 0.15 ;                            %                �paisseur max    
parameters.xcht         = 0.30 ;                            %                position de l'�paisseur max
parameters.lht          = 1 ;                               % [m]            distance aile/empennage
parameters.Dht          = 0 ;                               % [degr�]        angle de dih�dre
%Les param�tres avec un vt correspondent aux param�tres de l'empennage
%verticale
parameters.lvt          = 1 ;                               % [m]            distance aile/empennage
parameters.tcvt         = 0.15 ;                            %                �paisseur max    
parameters.xcvt         = 0.30 ;                            %                position de l'�paisseur max
parameters.Dvt          = 0 ;                               % [degr�]        angle de dih�dre
%Les param�tres avec un f correspondent aux param�tres du fuselage 
%parameters.lf           = ;                                 % [m]            longueur du fuselage
%parameters.df           = ;                                 % [m]            diam�tre du fuselage
%parameters.Sf           = ;                                 % [m^2]          surface � l'air fuselage        
save('param.mat','parameters')

