#!/bin/bash

set -e

cd src

cmake . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=../BOUT-configs/generic-4.4/BOUT-dev/build/

cmake --build build -j 4
