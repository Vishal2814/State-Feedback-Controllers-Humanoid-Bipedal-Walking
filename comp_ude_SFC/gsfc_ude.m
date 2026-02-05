clc; clear;
load gsfc_ude.mat

% ---------------- Data ----------------
t = state_ude(1,:);

x_ude  = state_ude(2,:);
y_ude  = state_ude(3,:);
dist_x = state_ude(8,:);
dist_y = state_ude(9,:);
dx_hat = state_ude(10,:);
dy_hat = state_ude(11,:);

% ---------------- Figure ----------------
figure('Position',[100 100 950 600]);

% ---- x position ----
subplot(2,2,1)
plot(t, x_ude, 'b-', 'LineWidth', 1.6);
grid on
xlabel('$t$ (s)','Interpreter','latex')
ylabel('$x$ (m)','Interpreter','latex')
title('SFC--UDE: $x$ Position','Interpreter','latex')
set(gca,'FontSize',11,'LineWidth',1)

% ---- y position ----
subplot(2,2,2)
plot(t, y_ude, 'b-', 'LineWidth', 1.6);
grid on
xlabel('$t$ (s)','Interpreter','latex')
ylabel('$y$ (m)','Interpreter','latex')
title('SFC--UDE: $y$ Position','Interpreter','latex')
set(gca,'FontSize',11,'LineWidth',1)

% ---- x disturbance estimation ----
subplot(2,2,3)
plot(t, dist_x, 'b-', 'LineWidth', 1.6); hold on
plot(t, dx_hat, 'r--', 'LineWidth', 1.6);
grid on
xlabel('$t$ (s)','Interpreter','latex')
ylabel('$d_x$ (m/s$^2$)','Interpreter','latex')
legend({'Actual','Estimated'}, ...
       'Interpreter','latex','Location','best')
title('Disturbance Estimation in X','Interpreter','latex')
set(gca,'FontSize',11,'LineWidth',1)

% ---- y disturbance estimation ----
subplot(2,2,4)
plot(t, dist_y, 'b-', 'LineWidth', 1.6); hold on
plot(t, dy_hat, 'r--', 'LineWidth', 1.6);
grid on
xlabel('$t$ (s)','Interpreter','latex')
ylabel('$d_y$ (m/s$^2$)','Interpreter','latex')
legend({'Actual','Estimated'}, ...
       'Interpreter','latex','Location','best')
title('Disturbance Estimation in Y','Interpreter','latex')
set(gca,'FontSize',11,'LineWidth',1)

% ---- Global title ----
sgtitle('State Feedback Control with UDE: State Response and Disturbance Estimation', ...
        'Interpreter','latex','FontSize',14)

box on
