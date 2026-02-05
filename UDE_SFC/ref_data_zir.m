clear all;clc;
global g zc m omega2 k1 k2 taux tauy b 
% 
t_step = 0.001;
t_stop = 0.5;
load lipm3d.mat
data=data';
% 
g=9.81;
zc=0.3528;
m=4.39;
omega2=g/zc;
b = 1/(m*zc);
x0=0.151;
dx0=-0.467;
y0=0.05;
dy0=0.467;
% k1 = 160000;
% k2 = 800;
ts = 0.01;zeta = 1;
wn = 4/(ts*zeta);
k1 = wn^2;
k2 = 2*zeta*wn;

taux = 0.005;
tauy = 0.005;
% 
% sim('slipm3D_zir');

