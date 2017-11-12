#!/usr/bin/env bash

# create a user
DOCKER_USER_ID=${DOCKER_USER_ID:-9001} 
DOCKER_PASSWORD=${DOCKER_PASSWORD:-$DOCKER_USER} 
DOCKER_GROUP=${DOCKER_GROUP:-docker} 
DOCKER_GROUP_ID=${DOCKER_GROUP_ID:-9001}
/scripts/create_user.sh $DOCKER_USER $DOCKER_USER_ID $DOCKER_PASSWORD $DOCKER_GROUP $DOCKER_GROUP_ID

# source in scripts
for f in $(ls /scripts/[0-9][0-9]-*.sh); do
    source $f
done

# su -m $DOCKER_USER -c /scripts/launch.sh
source /scripts/launch.sh
