clc
clear all
close all
global parameters
Param_def

[CLmd,CDmd, Cd0, k] = Derivation_CL_mp(1);
[E] = Endurance(1);
[X] = LFL(1);
[Hn_fixed, Hn_free] = LongitudinalStaticStability(1);
[CnB_directional, CnB_lateral] = DirectionalLateralStaticStability(1);
[V0y, V0x, M0y, M0x, margin_tensile, margin_compressive,structure_test] = moment(1);


