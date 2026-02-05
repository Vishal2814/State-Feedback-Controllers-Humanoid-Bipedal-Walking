clc; clear;

load gsfc_ude.mat
load g_sfc.mat

%% --------- UDE + SFC ----------
t1     = state_ude(1,:);
x_ude  = state_ude(2,:);
y_ude  = state_ude(3,:);
dist_x = state_ude(8,:);
dist_y = state_ude(9,:);
dx_hat = state_ude(10,:);
dy_hat = state_ude(11,:);

%% --------- SFC ONLY ----------
t  = states_sfc(1,:);
x  = states_sfc(2,:);
y  = states_sfc(3,:);

%% --------- SINGLE WINDOW COMPARISON ----------
figure('Color','w','Position',[100 100 1200 800]);

% ---- X position ----
subplot(2,2,1)
plot(t1,x_ude,'b','LineWidth',1.6); hold on;
plot(t,x,'r--','LineWidth',1.6);
grid on;
xlabel('Time (s)');
ylabel('x (m)');
title('X Position: SFC vs SFC+UDE');
legend('SFC + UDE','SFC','Location','best');

% ---- Y position ----
subplot(2,2,2)
plot(t1,y_ude,'b','LineWidth',1.6); hold on;
plot(t,y,'r--','LineWidth',1.6);
grid on;
xlabel('Time (s)');
ylabel('y (m)');
title('Y Position: SFC vs SFC+UDE');
legend('SFC + UDE','SFC','Location','best');

% ---- Disturbance X (UDE performance) ----
subplot(2,2,3)
plot(t1,dist_x,'k','LineWidth',1.5); hold on;
plot(t1,dx_hat,'g','LineWidth',1.5);
grid on;
xlabel('Time (s)');
ylabel('d_x');
title('Disturbance X (UDE)');
legend('Actual','Estimated','Location','best');

% ---- Disturbance Y (UDE performance) ----
subplot(2,2,4)
plot(t1,dist_y,'k','LineWidth',1.5); hold on;
plot(t1,dy_hat,'g','LineWidth',1.5);
grid on;
xlabel('Time (s)');
ylabel('d_y');
title('Disturbance Y (UDE)');
legend('Actual','Estimated','Location','best');
%% ================= RMS ERROR ANALYSIS =================

% --- Ensure same time length (safety) ---
N = min([length(t1), length(t)]);
x_sfc     = x(1:N);
y_sfc     = y(1:N);
x_ude_n   = x_ude(1:N);
y_ude_n   = y_ude(1:N);

%% --------- TRAJECTORY RMS (Controller Comparison) ---------
rms_x_sfc     = rms(x_sfc);
rms_y_sfc     = rms(y_sfc);
rms_x_ude     = rms(x_ude_n);
rms_y_ude     = rms(y_ude_n);

traj_table = table( ...
    [rms_x_sfc; rms_x_ude], ...
    [rms_y_sfc; rms_y_ude], ...
    'VariableNames', {'RMS_X','RMS_Y'}, ...
    'RowNames', {'SFC','SFC+UDE'});

disp(' ');
disp('================ TRAJECTORY RMS COMPARISON ================');
disp(traj_table);

%% --------- DISTURBANCE ESTIMATION RMS (UDE ONLY) ---------
rms_dx = rms(dist_x - dx_hat);
rms_dy = rms(dist_y - dy_hat);

dist_table = table( ...
    [rms_dx; rms_dy], ...
    'VariableNames', {'RMS_Error'}, ...
    'RowNames', {'d_x estimation','d_y estimation'});

disp(' ');
disp('=========== DISTURBANCE ESTIMATION RMS (UDE) ============');
disp(dist_table);

