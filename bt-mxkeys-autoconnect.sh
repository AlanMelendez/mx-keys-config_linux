#!/bin/bash

DEVICE_MAC="DC:70:A7:83:00:49"

/usr/bin/bluetoothctl <<EOF
power on
agent on
default-agent
trust $DEVICE_MAC
connect $DEVICE_MAC
quit
EOF
