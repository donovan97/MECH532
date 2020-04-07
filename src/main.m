clc
clear all
close all

Param_def

[CLmd,CDmd, Cd0, k] = Derivation_CL_mp();
[E] = Endurance();
[X,x1,x2,x,v,t] = LFL();
[Hn_fixed, Hn_free] = LongitudinalStaticStability(1);
[CnB_directional, CnB_lateral] = DirectionalLateralStaticStability(1);
[V0y, V0x, M0y, M0x, margin_tensile, margin_compressive] = moment();

load param.mat
