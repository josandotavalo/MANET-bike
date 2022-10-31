#!/bin/bash

# Activate batman-adv
sudo modprobe batman-adv
# Disable and configure wlan0
sudo ip link set wlan0 down
sudo ifconfig wlan0 mtu 1468
sudo iwconfig wlan0 mode ad-hoc
sudo iwconfig wlan0 essid batman-network
sudo iwconfig wlan0 ap any
sudo iwconfig wlan0 channel 1
sleep 1s
sudo ip link set wlan0 up
sleep 1s
sudo batctl if add wlan0
sleep 1s
sudo ifconfig bat0 up
sleep 5s
sudo ifconfig bat0 10.0.30.0/24