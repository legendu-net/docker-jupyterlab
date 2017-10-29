#!/bin/bash

function create_user_nogroup.usage() {
    cat << EOF
Create a new user with the group name "nogroup".
Syntax: create_user_nogroup user user_id [password] 
Arguments:
user: user name
user_id: user id
password: Optional password of the user. If not provided, then the user name is used as the password.
EOF
}

function create_user_nogroup() {
    if [[ $1 == "-h" ]]; then
        create_user_nogroup.usage
        return 0
    fi
    if [[ $# < 2 || $# > 3 ]]; then
        create_user_nogroup.usage
        return 1
    fi
    local user=$1
    local user_id=$2
    local group=nogroup
    local password=${4:-$user}
    /scripts/create_user_group.sh $user $user_id $group $password
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    create_user_nogroup $@
fi
