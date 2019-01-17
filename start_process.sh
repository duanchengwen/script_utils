#!/bin/sh
base_path="devel/lib/lidar_ros"
process_name="lidar_ros_node"
process_pid_name=`lidar_ros_node`
killp()
{
while true
do
    PROCESS=`ps -ef|grep $process_pid_name|grep -v grep|grep -v PPID|awk '{ print $2}'`
    if [ ${#PROCESS[@]} -le 0 ];then
	echo "start"
	cd $base_path
	./$process_name
    fi
    sleep 3
done
}

killp `$process_pid_name`
