function accl = mf_lipm(u)
%MF_LIPM Summary of this function goes here
%   Detailed explanation goes here
global g zc m omega2 
% 
tau_x = u(1);
tau_y = u(2);
x=u(3);
y = u(4);
dx = u(5);
dy =u(6);
t = u(7);
%  
outx = omega2*x + (1/(m*zc))*tau_x+100*sin(4*t);
outy = omega2*y + (1/(m*zc))*tau_y+100*cos(4*t);
% 
accl = [outx outy];

end

