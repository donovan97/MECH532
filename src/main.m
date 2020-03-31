clc
clear all
Param_def
[CD0,k] = Parasitedrag()

[E] = Endurance();
[X,x1,x2,x,v,t] = LFL();
[Hn_fixed, Hn_free] = LongitudinalStaticStability();
[CnB_directional, CnB_lateral] = DirectionalLateralStaticStability();
[V0y, V0x, M0y, M0x] = moment();


load param.mat


    % [m/s]
V=sqrt(2*parameters.Wto*parameters.g/(parameters.rho*parameters.Sw*parameters.CLmax));