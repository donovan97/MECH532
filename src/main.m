clc
clear 
clear all
load param.mat

[E] = Endurance();
[X,x1,x2,x,v,t] = LFL();
[Hn_fixed, Hn_free] = LongitudinalStaticStability();
[CnB_directional, CnB_lateral] = DirectionalLateralStaticStability();

disp('try')
