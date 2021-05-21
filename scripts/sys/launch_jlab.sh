#!/bin/bash
# This script is identical to the script launch.sh in this repository.
# It is not redundant even though it is not used in most cases. 
# This script is kept here so that users can still launch a JupyterLab service 
# (by passing the CMD /scripts/sys/init.sh /scripts/sys/launch_jlab.sh to the Docker image) 
# in situations where launch.sh is overwritten (e.g., in dclong/vscode-server).

# jupyter notebook --allow-root --ip=* --port=8888 --no-browser --notebook-dir=/jupyter 
su -m $DOCKER_USER -c "jupyter lab --allow-root --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=/workdir"
