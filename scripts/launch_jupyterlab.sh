#!/bin/bash

for f in $(ls /scripts/config/[0-9][0-9][0-9]-*.sh); do
    source $f
done
NOTEBOOK_DIR=/workdir
if [[ $(id -un) == gitpod ]]; then
    NOTEBOOK_DIR=/workspace
fi
jupyter lab --allow-root --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=$NOTEBOOK_DIR
