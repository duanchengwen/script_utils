#!/bin/sh
base_path="/home/zombie/zombie/Lidar/Lidar_ini/LOG"
log_name="ros_data.log"
killp()
{
while true
do
    PROCESS=`ps -ef|grep lcm-logplayer|grep -v grep|grep -v PPID|grep -v codeblocks|awk '{ print $2}'`
    echo ${#PROCESS[@]}
    if [ ${#PROCESS[@]} -le 0 ];then
	echo "replay lcm-log"
	#cd $base_path
	lcm-logplayer -l udpm://239.255.76.21:7621?ttl=3 $log_name
    fi
    sleep 5
done
}

killp "lcm-logplayer"
