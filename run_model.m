% run model with this script
clear; close all; clc;
% mat files updated in simulink model
derivatives = zeros(1, 13);
save('derivs.mat', 'derivatives');
rotors = zeros(1, 5);
save('rotors.mat', 'rotors');
thrust_gt = zeros(1, 4);
save('thrust.mat', 'thrust_gt');
torque_gt = zeros(1, 4);
save('torque.mat', 'torque_gt');
drag_torq_gt = zeros(1, 4);
save('drag_torq.mat', 'drag_torq_gt');
% add path
addpath(fullfile(pwd, 'sim'));
addpath(fullfile(pwd, 'utils'));

%% parameters
sim_time = 10;
traj_interval = 0.02;
enable_plot = true;
output_interval = 0.025; % 40fps

%% load model and run
model = 'sim/sl_quadrotor';
sim_out = sim(model, 'StopTime', int2str(sim_time));

%% extract simulation result
des_pitch_roll = sim_out.get('des_pitch_roll');
des_thrust = sim_out.get('des_thrust'); 
des_torq = sim_out.get('des_torq');
des_xy = sim_out.get('des_xy');
des_yaw = sim_out.get('des_yaw');
des_z = sim_out.get('des_z');
four_rotors = sim_out.get('four_rotors');
quad_states = sim_out.get('quad_states');
tout = sim_out.get('tout');


save('result.mat', 'des_pitch_roll', 'des_thrust', 'des_torq', 'des_xy',...
    'des_yaw', 'des_z', 'four_rotors', 'quad_states', 'tout', 'quad');
movefile('*.mat', './output');
mkdir('output/txt')
save_euler_txt;
system('./utils/euler_to_quat.py');