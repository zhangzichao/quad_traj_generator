% save trajectory to txt file: run after the simulation is over

t = quad_states.X.Time();
time_len = length(t);

% save euler angle
traj_matrix = zeros(time_len, 7);

% assign
traj_matrix(:, 1) = t;
traj_matrix(:, 2) = quad_states.X.Data;
traj_matrix(:, 3) = quad_states.Y.Data;
traj_matrix(:, 4) = quad_states.Z.Data;
traj_matrix(:, 5) = quad_states.yaw.Data;
traj_matrix(:, 6) = quad_states.pitch.Data;
traj_matrix(:, 7) = quad_states.roll.Data;

% save
save('output/txt/traj_euler.txt', 'traj_matrix', '-ascii');