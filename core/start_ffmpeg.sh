#!/bin/bash

IP=10.244.1.7

ffmpeg -f concat -safe 0 -i playlist.txt -threads 2 -vcodec flv -acodec copy -s 1280x720 -f flv rtmp://${IP}:1935/stream/client01
