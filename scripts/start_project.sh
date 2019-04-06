#!/bin/bash

# Build the catkin_ws
cd $(pwd)/../../.. ; catkin_make

## Launch the nodes
# Load Gazebo and the whole MoveIt! setup 
xterm  -e "source devel/setup.bash; roslaunch rll_planning_project moveit_planning_execution.launch" &
sleep 10
# Set the start and goal pose, spawn grasp object, set if the path planner will be called 3 times
xterm  -e "source devel/setup.bash; roslaunch rll_planning_project planning_iface.launch" &
sleep 4	
# Launch the path planing algorithm developed as solution to the project
xterm  -e "source devel/setup.bash; roslaunch rll_planning_project path_planner.launch" &
sleep 4
# Send a goal, evaluate the result, reset robot and environment
xterm  -e "source devel/setup.bash; roslaunch rll_project_runner run_project.launch" &

## Termiante the project
# echo "Press Enter key to terminate the project"
## read reads a single line from standard input, 
## -s Do not echo keystrokes when read is taking input from the terminal
## -n nchars Stop reading after an integer number nchars characters have been read, if the line delimiter has not been reached.

# read -s -n 1 key
# if [[ $key = "" ]]; then 
# 	killall -e xterm
# 	echo "Project terminated!"
## fi closes the if statement
# fi

