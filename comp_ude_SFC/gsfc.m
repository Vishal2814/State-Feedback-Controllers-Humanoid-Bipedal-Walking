load g_sfc.mat

% Data
t      = states_sfc(1,:);
x      = states_sfc(2,:);
y      = states_sfc(3,:);
dx     = states_sfc(4,:);
dy     = states_sfc(5,:);
x_ref  = states_sfc(6,:);
y_ref  = states_sfc(7,:);
dx_ref = states_sfc(8,:);
dy_ref = states_sfc(9,:);

figure('Position',[100 100 900 600]);

% --- x position ---
subplot(2,2,1)
plot(t, x, 'b-', 'LineWidth', 1.6); hold on
plot(t, x_ref, 'r--', 'LineWidth', 1.6);
grid on
xlabel('$t$ (s)','Interpreter','latex')
ylabel('$x$ (m)','Interpreter','latex')
title('$x$ position','Interpreter','latex')
legend({'Actual','Reference'},'Interpreter','latex','Location','best')

% --- y position ---
subplot(2,2,2)
plot(t, y, 'b-', 'LineWidth', 1.6); hold on
plot(t, y_ref, 'r--', 'LineWidth', 1.6);
grid on
xlabel('$t$ (s)','Interpreter','latex')
ylabel('$y$ (m)','Interpreter','latex')
title('$y$ position','Interpreter','latex')
legend({'Actual','Reference'},'Interpreter','latex','Location','best')

% --- x velocity ---
subplot(2,2,3)
plot(t, dx, 'b-', 'LineWidth', 1.6); hold on
plot(t, dx_ref, 'r--', 'LineWidth', 1.6);
grid on
xlabel('$t$ (s)','Interpreter','latex')
ylabel('$\dot{x}$ (m/s)','Interpreter','latex')
title('$\dot{x}$ velocity','Interpreter','latex')
legend({'Actual','Reference'},'Interpreter','latex','Location','best')

% --- y velocity ---
subplot(2,2,4)
plot(t, dy, 'b-', 'LineWidth', 1.6); hold on
plot(t, dy_ref, 'r--', 'LineWidth', 1.6);
grid on
xlabel('$t$ (s)','Interpreter','latex')
ylabel('$\dot{y}$ (m/s)','Interpreter','latex')
title('$\dot{y}$ velocity','Interpreter','latex')
legend({'Actual','Reference'},'Interpreter','latex','Location','best')

sgtitle('State Feedback Controller (SFC): Actual vs Reference Trajectory', ...
        'Interpreter','latex','FontSize',14)

set(findall(gcf,'Type','axes'),'FontSize',11,'LineWidth',1)
box on
