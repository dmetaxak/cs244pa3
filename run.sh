#!/bin/bash

# this will be the script for getting stuff run

# run sprout

DOWNLINKS=("Verizon-LTE-short.down" "ATT-LTE-driving.down" "TMobile-UMTS-driving.down" "Verizon-EVDO-driving.down" "Verizon-LTE-driving.down" "Verizon-LTE-short.down")
UPLINKS=("Verizon-LTE-short.up" "ATT-LTE-driving.up" "TMobile-UMTS-driving.up" "Verizon-EVDO-driving.up" "Verizon-LTE-driving.up" "Verizon-LTE-short.up")

MYNAME=`whoami`
echo $MYNAME

source setup.sh 

#for i in `seq 0 4`;
for i in `seq 0 0`;
do
  echo $i
  echo ${DOWNLINKS[$i]}
  echo ${UPLINKS[$i]}
  # now run the protocol
  sudo -u ubuntu echo ./run-sprout ${DOWNLINKS[$i]} ${UPLINKS[$i]}
  sudo -u ubuntu ./run-sprout ${DOWNLINKS[$i]} ${UPLINKS[$i]}

  modprobe tcp_vegas
  echo "vegas" > /proc/sys/net/ipv4/tcp_congestion_control

  sudo -u ubuntu echo ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}
  sudo -u ubuntu ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}

  modprobe -r tcp_vegas
  modprobe tcp_cubic
#  sudo su -
 # echo "cubic" > /proc/sys/net/ipv4/tcp_congestion_control
 # logout
 # echo ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}
  
done
