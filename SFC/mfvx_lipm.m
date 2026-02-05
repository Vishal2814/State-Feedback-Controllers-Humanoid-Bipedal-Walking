function out = mfvx_lipm(u)
%MF_LIPM Summary of this function goes here
%   Detailed explanation goes here
global k1 k2
% 
x_ref = u(1);
y_ref = u(2);
dx_ref = u(3);
dy_ref = u(4);
ddx_ref = u(5);
ddy_ref = u(6);
x = u(7);
y = u(8);
dx = u(9);
dy = u(10);
%  
vx= ddx_ref+k1*(x_ref-x)+k2*(dx_ref-dx);
vy= ddy_ref+k1*(y_ref-y)+k2*(dy_ref-dy);

out= [vx vy];
% 

end

