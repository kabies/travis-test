#!/bin/sh

echo "sdl.sh start"
pwd
whoami

SDL2_FRAMEWORK=SDL2.framework
FRAMEWORKS_DIR=$HOME/Library/Frameworks
mkdir -p $FRAMEWORKS_DIR
ls $FRAMEWORKS_DIR

mkdir -p tmp
SDL2_DMG=SDL2-2.0.8.dmg
curl -L -o tmp/$SDL2_DMG https://www.libsdl.org/release/$SDL2_DMG
hdiutil attach tmp/$SDL2_DMG
cp -R /Volumes/SDL2/$SDL2_FRAMEWORK $FRAMEWORKS_DIR
hdiutil detach /Volumes/SDL2
ls tmp/
ls $FRAMEWORKS_DIR