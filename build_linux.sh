#!/bin/bash

OSDEF="-D__LINUX__ -D__ARM64__"
ARCH="-march=armv8-a"

export CFLAGS="$OSDEF $ARCH"
export CXXFLAGS="$OSDEF $ARCH"
export LDFLAGS=-latomic

make -j 4 -f Makefile all
