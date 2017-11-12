#!/usr/bin/env bash

export HOME=/home/$DOCKER_USER # do NOT remove!!! Necessary for it to work.
cd $HOME

# codemirror configuration
codemirror_dir="$HOME/.jupyter/lab/user-settings/@jupyterlab/codemirror-extension"
mkdir -p "$codemirror_dir"
cp /settings/commands.json "$codemirror_dir"
chown -R $DOCKER_USER:$DOCKER_GROUP $HOME/.jupyter

# .local directory
chown -R $DOCKER_USER:$DOCKER_GROUP $HOME/.local
