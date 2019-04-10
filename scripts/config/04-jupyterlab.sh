#!/usr/bin/env bash

# codemirror configuration
codemirror_dir="$HOME/.jupyter/lab/user-settings/@jupyterlab/codemirror-extension"
mkdir -p "$codemirror_dir"
mv /settings/commands.jupyterlab-settings "$codemirror_dir"
chown -R $DOCKER_USER:$DOCKER_GROUP $HOME/.jupyter
