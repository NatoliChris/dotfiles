#!/bin/bash

#cd "$HOME/.i3/"

# import -silent -window root lock.png;
#rm lock.png
#scrot -q 1 lock.png
#notify-send --urgency low "Locking..."
convert lock-bg.png -scale 25% -blur 0x30 -scale 400% lock.png;
#convert lock.png -scale 10% -scale 1000% lock.png;
# composite -gravity center pad.png lock.png lock.png;
convert lock.png -page +2986+620 pad.png -flatten lock.png
convert lock.png -page +583+284 pad.png -flatten lock.png

# i3lock -i lock.png
