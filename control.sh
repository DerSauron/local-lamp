#!/bin/bash

S=`readlink -f $0`
DIR=`dirname $S`

cd "$DIR"

start()
{
    docker-compose up --build -d "$@"
}

stop()
{
    docker-compose stop
}

if [ "$1" == "stop" ]; then
    stop
elif [ "$1" == "restart" ]; then
    stop
    start
elif [ "$1" == "" -o "$1" == "start" ]; then
    start
else
    docker-compose "$@"
fi
