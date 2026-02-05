function uc = mfuc_lipm(u)
%MF_LIPM Summary of this function goes here
%   Detailed explanation goes here
global g zc m omega2
% 

vx = u(1);
vy = u(2);
x=u(3);
y=u(4);

%  
outx = (m*zc)*(-omega2*x + vx);
outy = (m*zc)*(-omega2*y + vy);
% 
uc = [outx outy];

end

