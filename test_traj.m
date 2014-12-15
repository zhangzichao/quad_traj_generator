% a simple trajectory to test the workflow
% no change of orientation
% move independently in three directions
% format: [t, p1x3, o1x4] where o:[w x y z]
clear; close all; clc;

%% set parameters
dt = 0.01; v = 0.2;
t1 = 4; t2 = 8; t3 = 12;
p0 = [0, 0, 3];      % make sure cam in the scene
orie = [1, 0, 0, 0]; % fixed
total_len = length(0:0.1:t3);
traj_matrix = zeros(total_len, 8);

%% generate trajectory
t = 0: dt: t1;
for i = 1: length(t)
    traj_matrix(i, :) = ...
        [t(i), p0+[v, 0, 0]*t(i), orie];
end
p0 = traj_matrix(i, 2:4);
t = (t1+dt): dt: t2;
for j = 1: length(t)
    traj_matrix(i+j, :) = ...
        [t(j), p0+[0, v, 0]*(t(j)-t1), orie];
end
p0 = traj_matrix(i+j, 2:4);
t=(t2+dt): dt: t3;
for k = 1: length(t)
    traj_matrix(i+j+k, :) = ...
        [t(k), p0+[0, 0, v]*(t(k)-t2), orie];
end

%% save
save('output/txt/traj_test_quad.txt', 'traj_matrix', '-ascii');