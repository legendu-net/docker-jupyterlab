#!/bin/bash

# create a user
DOCKER_GROUP=${DOCKER_GROUP:-docker} 
/scripts/create_user.sh $DOCKER_USER ${DOCKER_USER_ID:-9001} ${DOCKER_PASSWORD:-$DOCKER_USER} $DOCKER_GROUP ${DOCKER_GROUP_ID:-9001}

mkdir -p "$NOTEBOOK_DIR"
chown $USER:$DOCKER_GROUP "$NOTEBOOK_DIR"

/scripts/launch.sh

