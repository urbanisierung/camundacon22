#!/bin/sh

echo "converting to mp4"
ffmpeg -i $1.webm -preset ultrafast $1.mp4

echo "increase speed"
ffmpeg -i $1.mp4 -preset ultrafast -filter:v "setpts=PTS/$2" $1-x$2.mp4
