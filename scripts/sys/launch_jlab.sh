#!/bin/bash
# This script is for launching a JupyterLab service 
# in situations where launch.sh in dclong/jupyterlab is overwritten (e.g., in dclong/vscode-server).
# There are 2 popular use cases.
# 1. Pass the CMD "/scripts/sys/init.sh /scripts/sys/launch_jlab.sh" to the docker command when launching a Docker container.
# 2. Run "/scripts/sys/launch_jlab.sh" in an already launched Docker container.

#@TODO: add --collaborative when it's stable

case "$(id -un)" in
    root )
        su -m $DOCKER_USER -c "jupyter lab --allow-root --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=/workdir"
        ;;
    gitpod )
        jupyter lab --allow-root --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=/workspace
        ;;
    *)
        jupyter lab --allow-root --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=/workdir
esac
