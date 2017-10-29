#!/bin/bash

USER=${DOCKER_USER:-root}
if [[ $USER == root ]]; then 
    ${1:-/script.sh}
else
    USER_ID=${DOCKER_USER_ID:-9001}
    PASSWORD=${DOCKER_PASSWORD:-$USER}
    DOCKER_GROUP_ID=${DOCKER_GROUP_ID:-9001}
    NOTEBOOK_DIR="${NOTEBOOK_DIR:-/jupyter}"
    groupadd -o -g $DOCKER_GROUP_ID docker

    export HOME=/home/$USER
    useradd -om -u $USER_ID -g docker -d $HOME -s /bin/bash -c "$USER" $USER
    echo ${USER}:${PASSWORD} | chpasswd
    gpasswd -a $USER sudo
    
    mkdir -p "$NOTEBOOK_DIR"
    chown $USER:docker "$NOTEBOOK_DIR"
    
    cd $HOME
    su -m $USER && echo $PASSWORD | sudo -S -u $USER ${1:-/scripts/launch.sh}
fi
