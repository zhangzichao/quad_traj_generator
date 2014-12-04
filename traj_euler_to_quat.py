import numpy as np
import transformations as tf
import os
import sys

traj_euler = np.loadtxt("traj_euler.txt")
open("traj_quaternion.txt", 'w').close
traj_quaternion = open("traj_quaternion.txt", 'w')
for row in traj_euler:
    quaternion = tf.quaternion_from_euler(row[4], row[5], row[6], 'rzyx')
    traj_quaternion.write("%.6f %.4f %.4f %.4f %.4f %.4f %.4f %.4f\n" %(row[0], row[1], row[2], row[3],
                 quaternion[0], quaternion[1], quaternion[2], quaternion[3]));
