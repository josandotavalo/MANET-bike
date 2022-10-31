#!/bin/bash

#config_ad_hoc
sudo systemctl stop dhcpcd
sudo iwconfig wlan0 mode Ad-Hoc
sudo iwconfig wlan0 essid "olsr_network"
sudo ifconfig wlan0 20.0.0.1 netmask 255.255.255.0 up


#start_olsrd
sudo olsrd -i wlan0