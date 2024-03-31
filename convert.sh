#!/bin/bash

PARENT_DIR=$1
cd "$PARENT_DIR"

for dir in */; do
    if [ -d "$dir" ]; then
        mv "$dir"*.png .
        rm -r "$dir"
    fi
done
