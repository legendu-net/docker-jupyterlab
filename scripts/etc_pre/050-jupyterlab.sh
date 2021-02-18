#!/usr/bin/env bash

# codemirror configuration
codemirror_dir=$HOME/.jupyter/lab/user-settings/@jupyterlab/codemirror-extension
mkdir -p $codemirror_dir
cp /settings/commands.jupyterlab-settings $codemirror_dir

# apputils-extension configuration
apputils_dir=$HOME/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/
mkdir -p $apputils_dir
cp /settings/themes.jupyterlab-settings $apputils_dir

# jupyterlab-lsp
lsp_dir=/home/dclong/.jupyter/lab/user-settings/@krassowski/jupyterlab-lsp
mkdir -p $lsp_dir
cp /settings/jupyterlab-lsp.json $lsp_dir/plugin.jupyterlab-settings

chown -R $DOCKER_USER:$DOCKER_GROUP $HOME/.jupyter
