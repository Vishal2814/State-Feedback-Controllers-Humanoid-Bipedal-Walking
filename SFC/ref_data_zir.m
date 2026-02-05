clear all;clc;
global g zc m omega2 k1 k2 
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
x0=0.151;
dx0=-0.467;
y0=0.05;
dy0=0.467;
step_length=0.8;
step_time=0.8;

% k1 = 500;
% k2 = 500;
ts = 0.01;zeta = 1;
wn = 4/(ts*zeta);
k1 = wn^2;
k2 = 2*zeta*wn;
% 
% sim('slipm3D_zir');

