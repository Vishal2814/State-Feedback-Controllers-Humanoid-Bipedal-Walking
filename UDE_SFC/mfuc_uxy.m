function uxy = mfuc_uxy(u)
%MF_LIPM Summary of this function goes here
%   Detailed explanation goes here
global m taux tauy zc omega2 b 
% 

vx = u(1);
vy = u(2);
dx = u(3);
dy = u(4);
x = u(5);
y = u(6);
ivx = u(7);
ivy = u(8);
%  
dx_hat = (1/taux)*dx-(1/taux)*ivx;
dy_hat = (1/tauy)*dy-(1/tauy)*ivy;


outx = (1/b)*(-omega2*x+vx-dx_hat);
outy = (1/b)*(-omega2*y+vy-dy_hat);
% 
uxy = [outx outy dx_hat dy_hat];

end

