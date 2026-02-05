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
dist_x = 100*sin(4*t);
dist_y = 100*cos(4*t);
%  
outx = omega2*x + (1/(m*zc))*tau_x+dist_x;
outy = omega2*y + (1/(m*zc))*tau_y+dist_y;
% 
accl = [outx outy dist_x dist_y];

end

