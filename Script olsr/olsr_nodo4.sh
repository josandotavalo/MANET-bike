#!/bin/bash

#config_ad_hoc
sudo systemctl stop dhcpcd
sudo iwconfig wlan0 mode ad-hoc
sudo iwconfig wlan0 essid "olsr_network"
sudo ifconfig wlan0 20.0.0.14 netmask 255.255.255.0 up

sleep 5s

#start_olsrd
sudo olsrd -i wlan0
