function [x,x1,x2] = LFL(n,V,mu,gamma,g)
%Calculation of Landing Field Length
%   Assumptions: V=Vglide=cste during the rotation; Drag negligeable
%   compare to solid friction

% Inputs: n=load factor, V=Vglide (m/s), mu=solid friction coefficient, gamma=
% glide angle (degre)
% Outputs: LFL, distance during rotation, distance during ground run
x1=sin(2*pi*gamma/360)*(V^2)/(n-1);
x2=(V^2)/(2*mu*g);
x=x1+x2;
end

