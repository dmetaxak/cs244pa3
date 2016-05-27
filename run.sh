#!/bin/bash

# this will be the script for getting stuff run
DOWNLINKS=("Verizon-LTE-short.down" "ATT-LTE-driving.down" "TMobile-UMTS-driving.down" "Verizon-EVDO-driving.down" "Verizon-LTE-driving.down" "Verizon-LTE-short.down")
UPLINKS=("Verizon-LTE-short.up" "ATT-LTE-driving.up" "TMobile-UMTS-driving.up" "Verizon-EVDO-driving.up" "Verizon-LTE-driving.up" "Verizon-LTE-short.up")

source setup.sh

#for i in `seq 0 4`;
for i in `seq 0 0`;
do
  echo "SPROUT: ${DOWNLINKS[$i]} ${UPLINKS[$i]}"
  echo "SPROUT" 1>&2
  echo "Down linkfile: ${DOWNLINKS[$i]}" 1>&2
  echo "Up linkfile: ${UPLINKS[$i]}" 1>&2
  ./run-sprout ${DOWNLINKS[$i]} ${UPLINKS[$i]}
done

for i in `seq 0 0`;
do
  echo "TCP VEGAS: ${DOWNLINKS[$i]} ${UPLINKS[$i]}"
  echo "TCP VEGAS" 1>&2
  echo "Down linkfile: ${DOWNLINKS[$i]}" 1>&2
  echo "Up linkfile: ${UPLINKS[$i]}" 1>&2
  sudo modprobe tcp_vegas
  sudo su <<EOF
  echo "vegas" > /proc/sys/net/ipv4/tcp_congestion_control
EOF
  ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}
done

for i in `seq 0 0`;
do
  echo "TCP CUBIC: ${DOWNLINKS[$i]} ${UPLINKS[$i]}"
  echo "TCP CUBIC" 1>&2
  echo "Down linkfile: ${DOWNLINKS[$i]}" 1>&2
  echo "Up linkfile: ${UPLINKS[$i]}" 1>&2
  sudo modprobe tcp_cubic
  sudo su <<EOF
 echo "cubic" > /proc/sys/net/ipv4/tcp_congestion_control
EOF
  ./run-tcp ${DOWNLINKS[$i]} ${UPLINKS[$i]}
done
