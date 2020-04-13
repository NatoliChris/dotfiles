#! /bin/sh

# Takes a parameter to increase/decrease volume of all sinks. i.e +5%

VOLUME=$1
for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
do
  pactl set-sink-volume $SINK $VOLUME
done
