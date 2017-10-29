#!/bin/bash

function create_user_group.usage() {
    cat << EOF
Create a new user with the given (existing) group name.
Syntax: create_user_group user user_id group [password] 

Arguments:
user: user name
user_id: user id
group: an existing group name
password: Optional password of the user. If not provided, then the user name is used as the password.
EOF
}

function create_user_group() {
    if [[ $1 == "-h" ]]; then
        create_user_group.usage
        return 0
    fi
    if [[ $# < 3 || $# > 4 ]]; then
        create_user_group.usage
        return 1
    fi
    local user=$1
    local user_id=$2
    local group=$3
    local group_id=$(getent group $group | cut -d: -f3)
    local password=${4:-$user}
    /scripts/create_user.sh $user $user_id $password $group $group_id
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    create_user_group $@
fi
