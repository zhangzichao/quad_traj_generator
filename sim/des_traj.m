% desired trajectory. sim_time and traj_interval set in run_model.m

time_length = sim_time;
interval = traj_interval;

t = 0:interval:time_length;

% trajectory 1: circular
% x = sin(2*pi*.125*t - pi/2);
% traj.x = timeseries(x', t);
% 
% y = sin(2*pi*.125*t);
% traj.y= timeseries(y', t);
% 
% z = (-3)*ones(1, length(t));
% traj.z = timeseries(z', t);
% 
% yaw = 0+0.2*(0:interval:8);
% yaw = [zeros(1, length(t)-length(yaw)), yaw];
% traj.yaw = timeseries(yaw', t);

%trajectory 2: straight line
% x = 0.5 * t;
% traj.x = timeseries(x', t);
% 
% y = zeros(1, length(t));
% traj.y = timeseries(y', t);
% 
% z = (-3)*ones(1, length(t));
% traj.z = timeseries(z', t);
% 
% yaw = zeros(1, length(t));
% traj.yaw = timeseries(yaw', t);

% trajecory 3: rotate
x = zeros(1, length(t));
traj.x = timeseries(x', t);

y = zeros(1, length(t));
traj.y = timeseries(y', t);

z = (-3)*ones(1, length(t));
traj.z = timeseries(z', t);

yaw = (2*pi/time_length)*t;
traj.yaw = timeseries(yaw', t);


clear time_length interval t x y z yaw