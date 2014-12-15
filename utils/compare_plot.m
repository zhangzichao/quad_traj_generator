% compares desired trajectory and output states.

figure('NumberTitle', 'off','Name', 'desired trajectory vs output');
subplot(411); hold on;
plot(traj.x, 'DisplayName', 'traj.x');
plot(quad_states.X, 'DisplayName', 'output.x'); legend('show');
subplot(412); hold on;
plot(traj.y, 'DisplayName', 'traj.y');
plot(quad_states.Y, 'DisplayName', 'output.y' ); legend('show');
subplot(413); hold on;
plot(traj.z, 'DisplayName', 'traj.z');
plot(quad_states.Z, 'DisplayName', 'output.z'); legend('show');
subplot(414); hold on;
plot(traj.yaw, 'DisplayName', 'traj.yaw');
plot(quad_states.yaw, 'DisplayName', 'output.yaw'); legend('show');