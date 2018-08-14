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

if [ ! -e $FRAMEWORKS_DIR/$SDL2_FRAMEWORK ]; then
  if [ ! -e tmp/$SDL2_DMG ]; then
    curl -L -o tmp/$SDL2_DMG https://www.libsdl.org/release/$SDL2_DMG
  fi
  hdiutil attach tmp/$SDL2_DMG
  cp -R /Volumes/SDL2/$SDL2_FRAMEWORK $FRAMEWORKS_DIR
  hdiutil detach /Volumes/SDL2
fi
ls tmp/
ls $FRAMEWORKS_DIR

gcc main.c -framework SDL2 -F ~/Library/Frameworks
./a.out
