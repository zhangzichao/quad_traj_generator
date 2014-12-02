time_length = sim_time;
interval = traj_interval;

t = 0:interval:time_length;

x = sin(2*pi*.125*t - pi/2);
traj.x = timeseries(x', t);

y = sin(2*pi*.125*t);
traj.y= timeseries(y', t);

z = (-4)*ones(1, length(t));
traj.z = timeseries(z', t);

yaw = 0+0.2*(0:interval:1);
yaw = [zeros(1, length(t)-length(yaw)), yaw];
traj.yaw = timeseries(yaw', t);

clear time_length interval t x y z yaw