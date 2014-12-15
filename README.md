# Trajectory generator for quadrotor
Generate control realistic trajectory for a quadrotor.

## Overview
This repository uses the quadrotor model from Peter Corke's [Robotics Toolbox](http://www.petercorke.com/Robotics_Toolbox.html). Model file and required scripts are all included. Run the trajectory generator with `run_model.m` script. Simulation time, desired trajectory interval and plot enable flag can be changed in the script.
Functions are tested with Matlab2014b.

## Files Description
* `run_model.m`: run the simulation
* `sim` folder
  - `quad_param.m`: quadrotor parameters
  - `ctrl_param.m`: control parameters
  - `des_traj.m`: desired trajectory
  - `sl_quadrotor.mdl`: the quadrotor model with control loop
  - `quadrotro_dynamics.m`: s-function for quadrotor dynamics
  - `quadrotor_plot.m`: s-function for visualizing quadrotor flight during simulation
* `utils` folder
  - `compare_plot.m`: simple script to plot the difference between desired trajectory and simulated trajectory output
  - `save_euler_txt.m`: save simulation result as plain text files
  - `euler_to_quat.py`: covert plain text result from z-y'-x'' euler to quaternion (source and target are hard-coded)
  - `plain_to_bag.py`: convert plain text result(quad format) to rosbag file (source and target are hard-coded)
* `test_traj.m`: simple test trajectory
