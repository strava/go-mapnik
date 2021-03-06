#!/bin/bash

echo "Boostrapping!"

mkdir -p deps/ && cd deps/

if [[ ! -d ./mapnik-vector-tile ]]; then
    echo "Cloning mapnik-vector-tile"
    git clone https://github.com/mapbox/mapnik-vector-tile.git
fi

echo "Building mapnik-vector-tile"

cd mapnik-vector-tile 
git checkout tags/v1.5.0
git submodule init 

#source ./bootstrap.sh 
export CXX=clang++
export CC=clang
echo `mapnik-config --cflags`
echo `mapnik-config --cxxflags`
echo `mapnik-config --ldflags`
make && cd ../../

