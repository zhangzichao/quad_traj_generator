#!/usr/bin/env python

import numpy as np
import transformations as tf
from math import pi
import os
import sys

workspace_dir = os.path.dirname(os.path.abspath(__file__)) + '/..'
output_dir = os.path.join(workspace_dir, 'output')

traj_euler = np.loadtxt(os.path.join(output_dir, 'txt', "traj_euler.txt"))
output_file = os.path.join(output_dir, 'txt', "traj_quaternion.txt")
open(output_file, 'w').close
traj_quaternion = open(output_file, 'w')
for row in traj_euler:
# convert to z-upward coordinate system
# only need to transform the position
    #Rz = tf.rotation_matrix(pi/2, [0, 0, 1])
    #Rx = tf.rotation_matrix(-pi, [1, 0, 0])
    #R = tf.concatenate_matrices(Rz, Rx)
    #RT = np.transpose(R)
    #R_org = tf.euler_matrix(row[4], row[5], row[6], 'rzyx')
    #R_total = tf.concatenate_matrices(R, R_org)
    #R_total = tf.concatenate_matrices(R_total, RT)
    row[3] = -row[3]
    row[1], row[2] = row[2], row[1]

# convert to quaternion
# note: the quaternion order as [x y z w]
    #quaternion = tf.quaternion_from_matrix(R_total)
    quaternion = tf.quaternion_from_euler(row[4], row[5], row[6]);
    traj_quaternion.write("%.6f %.4f %.4f %.4f %.4f %.4f %.4f %.4f\n" %(row[0], row[1], row[2], row[3],
                 quaternion[1], quaternion[2], quaternion[3], quaternion[0]));
