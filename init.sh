#!/bin/bash

USER=${DOCKER_USER:-root}
if [[ $USER == root ]]; then 
    ${1:-/script.sh}
else
    USER_ID=${DOCKER_USER_ID:-9001}
    PASSWORD=${DOCKER_PASSWORD:-$USER}
    DOCKER_GROUP_ID=${DOCKER_GROUP_ID:-9001}
    groupadd -o -g $DOCKER_GROUP_ID docker

    export HOME=/home/$USER
    useradd -om -u $USER_ID -g docker -d $HOME -s /bin/bash -c "$USER" $USER
    echo ${USER}:${PASSWORD} | chpasswd
    gpasswd -a $USER sudo
    
    chown $USER:docker /jupyter
    
    cd $HOME
    su -m $USER && echo $PASSWORD | sudo -S -u $USER ${1:-/script.sh}
fi
