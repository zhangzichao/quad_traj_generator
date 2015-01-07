#!/usr/bin/env python

import rospy
import rosbag
import os
import numpy as np
from geometry_msgs.msg import Pose, Point, Quaternion

# output path
workspace_dir = os.path.dirname(os.path.realpath(__file__))+'/..'
output_dir = os.path.join(workspace_dir, 'output')

# rosbag
rospy.init_node('convert_bag')
bag = rosbag.Bag(os.path.join(output_dir, 'test.bag'), 'w')

# load source txt
traj_quad = np.loadtxt(os.path.join(output_dir, 'txt', 'traj_test_quad.txt'))

# time
base_sec = rospy.Time.now().to_sec();

for row in traj_quad:
    # pose
    pose = Pose()
    pose.position = Point(row[1], row[2], row[3])
    pose.orientation = Quaternion(row[5], row[6], row[7], row[4])

    # time
    rel_sec = row[0]
    bag_sec = rospy.Time.from_sec(base_sec+rel_sec)

    # write
    bag.write('traj', pose, bag_sec)

bag.close()


