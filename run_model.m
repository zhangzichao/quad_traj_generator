% run model with this script
clear; close all; clc;

%% parameters
sim_time = 10;
traj_interval = 0.02;
enable_plot = true;

%% load model and run
model = 'sl_quadrotor';
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