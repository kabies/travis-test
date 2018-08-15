#!/bin/sh

echo "sdl.sh start"
pwd
whoami

gcc main.c `sdl2-config --cflags --libs` -lGLEW
./a.out
