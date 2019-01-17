#!/bin/sh

cd /proc/ksz9897r_i2c_reg/1
echo 0x3100 s  > addr
sleep 0.5
echo 0x2100 > value
sleep 0.5
echo 0x4100 s  > addr
sleep 0.5
echo 0x2100 > value
sleep 0.5
echo 0x5100 s  > addr
sleep 0.5
echo 0x2100 > value
