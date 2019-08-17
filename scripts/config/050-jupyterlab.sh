#!/usr/bin/env bash

# codemirror configuration
codemirror_dir=$HOME/.jupyter/lab/user-settings/@jupyterlab/codemirror-extension
mkdir -p $codemirror_dir
mv /settings/commands.jupyterlab-settings $codemirror_dir

# apputils-extension configuration
apputils_dir=$HOME/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/
mkdir -p $apputils_dir
mv /settings/themes.jupyterlab-settings $apputils_dir

chown -R $DOCKER_USER:$DOCKER_GROUP $HOME/.jupyter