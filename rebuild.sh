#!/bin/bash

# Rebuild if BOUT++ and/or STORM were updated or modified.
# Rebuilds both optimised and debug versions

scripts/build-src.sh
scripts/build-src-debug.sh
