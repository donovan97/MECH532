clear all 
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Airfoil : AG35

figure(1)

AG35 = load('AG35.dat')
plot(AG35(:,1),smooth(AG35(:,2)))


