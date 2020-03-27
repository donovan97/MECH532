clc
clear all
Param_def

[Cd0_w,Cd0_HT, Cd0_VT, Cd0_F, parameters.Cd, f] = Parasitedrag();
[E] = Endurance();
[X,x1,x2,x,v,t] = LFL();
[Hn_fixed, Hn_free] = LongitudinalStaticStability();
[CnB_directional, CnB_lateral] = DirectionalLateralStaticStability();
[V0y, V0x, M0y, M0x] = moment();


