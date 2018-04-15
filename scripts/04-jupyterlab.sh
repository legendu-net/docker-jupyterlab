#!/usr/bin/env bash

# codemirror configuration
codemirror_dir="$HOME/.jupyter/lab/user-settings/@jupyterlab/codemirror-extension"
mkdir -p "$codemirror_dir"
cp /settings/commands.json "$codemirror_dir"
