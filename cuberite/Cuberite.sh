#!/bin/bash

cd /roms/tools/

# Install Cuberite
if [ ! -d 'Cuberite' ];
then
    mkdir Cuberite
    cd Cuberite/
    echo 'Downloading and installing Cuberite server'
    sleep 3
    wget https://download.cuberite.org/linux-aarch64/Cuberite.tar.gz
    tar -xvzf Cuberite.tar.gz
    rm Cuberite.tar.gz
    ./Cuberite
    exit
else
    # Kill/Launch Cuberite
    if pgrep -x 'Cuberite' > /dev/null
    then
        echo 'Killing Cuberite'
        sleep 3
        pkill Cuberite
    else
        echo 'Creating Cuberite Instance'
        sleep 3
        cd Cuberite/
        ./Cuberite -d
    fi
fi