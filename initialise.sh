#!/bin/bash

# Configure and compile BOUT++ and STORM.
# Creates both optimised and debug versions

# exit when any command fails
set -e

ISOTHERMAL1D_CONFIG_ROOT=$PWD

# Configure/compile BOUT++ and its dependencies
cd BOUT-configs/*/
# Remove existing installs, so that we do a clean build
[ -d "dependencies" ] && rm -rf dependencies
[ -d "BOUT-dev/build" ] && rm -rf BOUT-dev/build
[ -d "BOUT-dev/build-debug" ] && rm -rf BOUT-dev/build-debug
./build-dependencies.sh
./build.sh
./build-debug.sh
cd $ISOTHERMAL1D_CONFIG_ROOT

# Build isothermal1d
# Delete build directories if they exist
[ -d "src/build" ] && rm -rf src/build
[ -d "src/build-debug" ] && rm -rf src/build-debug
scripts/build-src.sh
scripts/build-src-debug.sh
