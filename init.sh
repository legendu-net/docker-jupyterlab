#!/bin/bash

USER_ID=${DOCKER_USER_ID:-9001}
USER=${DOCKER_USER:-dclong}
PASSWORD=${DOCKER_PASSWORD:-$USER}
useradd -o -u $USER_ID -d /home/$USER -s /bin/bash -c "$USER" $USER 
gpasswd -a $USER wheel 
export HOME=/home/$USER
mkdir -p $HOME
chown -R $USER:$USER /home/$USER 
mkdir -p /jupyter
chown -R $USER:$USER /jupyter
echo ${USER}:${PASSWORD} | chpasswd

su -m $USER && echo $PASSWORD | sudo -S -u $USER ${1:-/script.sh}
# if [[ "$#" == 0 ]]; then
    # su -m $USER && echo $PASSWORD | sudo -S -u $USER /script.sh
# else
    # for arg in "$@"; do
        # su -m $USER && echo $PASSWORD | sudo -S -u $USER $arg &
    # done
# fi

