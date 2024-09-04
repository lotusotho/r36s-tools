#!/bin/bash

if ! command -v nmap  &> /dev/null
then
    echo "Installing Nmap"
    sleep 3
    sudo apt-get install nmap -y
else
    echo "Mapping local network"
    sleep 3
    nmap -sn $(ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed 's/\(\.[0-9]*\)$/\.0\/24/')
    sleep 20
fi