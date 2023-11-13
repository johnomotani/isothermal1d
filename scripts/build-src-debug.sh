#!/bin/bash

set -e

cd src

cmake . -B build-debug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_PREFIX_PATH=../BOUT-configs/generic-4.4/BOUT-dev/build-debug/

cmake --build build-debug -j 4
