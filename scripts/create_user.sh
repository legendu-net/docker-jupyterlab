#!/bin/bash

function create_user.usage() {
    cat << EOF
Create a new user.
Syntax: create_user user user_id password group group_id
Arguments:
user: user name (which cannot be an empty string)
user_id: user ID (which cannot be an empty string)
password: password of the user (which cannot be an empty string)
group: group name of the user (which cannot be an empty string)
group_id: group ID (which cannot be an empty string)
EOF
}

function create_user() {
    if [[ $1 == "-h" ]]; then 
        create_user.usage
        return 0
    fi
    if [[ $# != 5 ]]; then
        create_user.usage
        return 5
    fi
    local user=$1
    local user_id=$2
    local password=$3
    local group=$4
    local group_id=$5
    if [[ $user == "" || $user_id == "" || $password == "" || $group == "" || $group_id == "" ]]; then 
        create_user.usage
        return 1
    fi
    if [[ "$(getent group $group)" == "" ]]; then
        groupadd -o -g $group_id $group
    fi
    useradd -om -u $user_id -g $group -d /home/$user -s /bin/bash -c "$user" $user
    echo $user:$password | chpasswd
    gpasswd -a $user sudo
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    create_user $@
fi
