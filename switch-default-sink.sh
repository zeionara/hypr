#!/bin/bash

# https://forum.manjaro.org/t/change-output-device-from-terminal-on-the-fly/66446

# sinks=(alsa_output.pci-0000_00_1f.3.analog-stereo alsa_output.pci-0000_01_00.1.hdmi-stereo)
sinks=($(pactl list sinks | grep 'Name: ' | cut -c 8- | tr "\n" " "))

max_sink_index=$((${#sinks[@]} - 1))

current_default_sink=$(pactl get-default-sink)

for i in $(seq 0 $max_sink_index); do
    if [[ ${sinks[$i]} == $current_default_sink ]]; then
        if [ $i == $max_sink_index ]; then
            pactl set-default-sink ${sinks[0]}
        else
            pactl set-default-sink ${sinks[$(($i + 1))]}
        fi
        break
    fi
done

#
# Simpler but more laborious way in case there are only 2 sinks
#

# sink1=${1:-alsa_output.pci-0000_00_1f.3.analog-stereo}
# sink2=${2:-alsa_output.pci-0000_01_00.1.hdmi-stereo}

# if [[ $(pactl get-default-sink) == $sink1 ]]; then
#     pactl set-default-sink $sink2 # if currently sink1 is default
# else
#     pactl set-default-sink $sink1 # if currently sink2 is default
# fi
