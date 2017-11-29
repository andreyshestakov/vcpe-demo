#!/bin/bash

ffmpeg -f concat -safe 0 -i playlist.txt -threads 1 -vcodec flv -acodec copy -s 1280x720 -f flv rtmp://10.244.1.78:1935/stream/client01
