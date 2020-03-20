%Constants

parameters.Wws     		= 7790 ;  							% [kg]           Weight of wing structure
parameters.Wfus    		= 31160 ; 							% [kg]           Weight of the fuselage (Tru Sim)
parameters.Wto     		= parameters.Wws +parameters.Wfus   % [kg]           Total aircraft weight
parameters.E       		= 73;       						% [GPa]          Young's modulus AL2024 https://amesweb.info/Materials/Youngs-Modulus-of-Aluminum.aspx
parameters.sigma_yield  = 324;          					% [MPa]          Yield stress of AL2024 http://asm.matweb.com/search/SpecificMaterial.asp?bassnum=MA2024T4


%Parameters

parameters.L       		= 30 ;    							% [m]            Length of one wing
parameters.Co      		= 2.5 ;     						% [m]            Chord length at wing root
parameters.Ct      		= 1.5 ;     						% [m]            Chord length at wingtip
parameters.lambda  		= parameters.Ct/parameters.Co;    	% [-]            Taper ratio
parameters.t       		= 0.12*parameters.Co;  				% [m]            Max thickness of NACA 2412
parameters.h       		= 0.02*parameters.Co;      			% [m]            max camber of NACA 
parameters.n       		= 1 ;       						% [-]            load factor
parameters.g       		= 9.81;     						% [m/s^2)        gravitational constant
parameters.dihedral     = 0 ;           					% [rad]          Dihedral angle of the wing
parameters.x            = linspace(0, parameters.L,1000);
parameters.drag         = 15 ;           					% [N]            Total drag force on the glider

save('param.mat','parameters')

