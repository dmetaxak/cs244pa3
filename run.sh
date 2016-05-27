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

  echo ${DOWNLINKS[$i]}
  echo ${UPLINKS[$i]}


  echo "SPROUT"
  echo ./run-sprout ${DOWNLINKS[$i]} ${UPLINKS[$i]}
  ./run-sprout ${DOWNLINKS[$i]} ${UPLINKS[$i]}

#  echo "TCP VEGAS"
#  sudo modprobe tcp_vegas
#  sudo su <<EOF
#  echo "vegas" > /proc/sys/net/ipv4/tcp_congestion_control
#EOF
#  echo ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}
#  ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}

  echo "TCP CUBIC"
  sudo modprobe tcp_cubic
  sudo su <<EOF
 echo "cubic" > /proc/sys/net/ipv4/tcp_congestion_control
EOF
  echo ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}
  ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}
done
