#!/bin/bash

S=`readlink -f $0`
DIR=`dirname $S`

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

cd "$DIR"

start()
{
    docker-compose up -d "$@"
}

stop()
{
    docker-compose stop
}

if [ "$1" == "stop" ]; then
    shift
    stop
elif [ "$1" == "restart" ]; then
    shift
    stop
    start "$@"
elif [ "$1" == "" -o "$1" == "start" ]; then
    shift
    start "$@"
else
    docker-compose "$@"
fi
