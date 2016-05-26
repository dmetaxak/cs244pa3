#!/bin/bash

# this will be the script for getting stuff run

# run sprout

DOWNLINKS=("Verizon-LTE-short.down" "ATT-LTE-driving.down" "TMobile-UMTS-driving.down" "Verizon-EVDO-driving.down" "Verizon-LTE-driving.down" "Verizon-LTE-short.down")
UPLINKS=("Verizon-LTE-short.up" "ATT-LTE-driving.up" "TMobile-UMTS-driving.up" "Verizon-EVDO-driving.up" "Verizon-LTE-driving.up" "Verizon-LTE-short.up")

for i in `seq 0 4`;
do
  echo $i
  echo ${DOWNLINKS[$i]}
  echo ${UPLINKS[$i]}
  # now run the protocol
  echo ./run-sprout ${DOWNLINKS[$i]} ${UPLINKS[$i]}
  ./run-sprout ${DOWNLINKS[$i]} ${UPLINKS[$i]}
done
