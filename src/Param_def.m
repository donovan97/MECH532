


%Constants

parameters.Wws     		= 7790 ;  							% [kg]           Weight of wing structure
parameters.Wf      		= 10000 ;  							% [kg]           Weight of fuel stored in wing
parameters.Wfus    		= 31160 ; 							% [kg]           Weight of the fuselage (Tru Sim)
parameters.Weng    		= 2385;   							% [kg]           Weight of the engine (CFM International CFM56-5B4) (https://en.wikipedia.org/wiki/CFM_International_CFM56)
parameters.Wto     		= parameters.Wws +parameters.Wf + parameters.Wfus + parameters.Weng;% [kg]           Total aircraft weight
parameters.E       		= 73;       						% [GPa]          Young's modulus AL2024 https://amesweb.info/Materials/Youngs-Modulus-of-Aluminum.aspx
parameters.sigma_yield  = 324;          					% [MPa]          Yield stress of AL2024 http://asm.matweb.com/search/SpecificMaterial.asp?bassnum=MA2024T4


%Parameters

parameters.L       		= 30 ;    							% [m]            Length of one wing
parameters.Lf      		= 10 ;  							% [m]            Length of the fuel tank within wing
parameters.Co      		= 2.5 ;     						% [m]            Chord length at wing root
parameters.Ct      		= 1.5 ;     						% [m]            Chord length at wingtip
parameters.Cof     		= 2.0 ;     						% [m]            Width of fuel tank at wing root
parameters.Ctf     		= 1.0 ;    						% [m]            Width of fuel tank at Lf
parameters.lambda  		= parameters.Ct/parameters.Co;    	% [-]            Taper ratio
parameters.t       		= 0.12*parameters.Co;  				% [m]            Max thickness of NACA 2412
parameters.h       		= 0.02*parameters.Co;      			% [m]            max camber of NACA 
parameters.n       		= 1 ;       						% [-]            load factor
parameters.g       		= 9.81;     						% [m/s^2)        gravitational constant
parameters.sweep        = 0;            					% [rad]          Sweep angle of the wing
parameters.dihedral     = 0 ;           					% [rad]          Dihedral angle of the wing
parameters.xeng         = 0;                             	% [m]            Location of the engine on the wing
parameters.x            = linspace(0, parameters.L,1000);
parameters.Thrust       = 20000;                            % [N]            Thrust at cruise for CFM56-5B4


save('param.mat','parameters')

