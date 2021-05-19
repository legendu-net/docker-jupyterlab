#!/bin/bash

export DOCKER_USER=$(id -un)
/scripts/sys/etc.sh pre 059
NOTEBOOK_DIR=/workdir
if [[ $(id -un) == gitpod ]]; then
    NOTEBOOK_DIR=/workspace
fi
jupyter lab --collaborative --allow-root --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=$NOTEBOOK_DIR &
/scripts/sys/etc.sh post 059
sleep 5
/scripts/list_jupyter.py
