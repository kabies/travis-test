#!/bin/sh

echo "sdl.sh start"
pwd
whoami

mkdir -p tmp
SDL2_DMG=SDL2-2.0.8.dmg
curl -L -o tmp/$SDL2_DMG https://www.libsdl.org/release/$SDL2_DMG
hdiutil attach tmp/$SDL2_DMG
cp -R /Volumes/SDL2/$SDL2_FRAMEWORK ./tmp/
hdiutil detach /Volumes/SDL2

