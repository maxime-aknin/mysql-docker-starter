#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" >/dev/null && pwd )"
mkdir -p $DIR/data
mkdir -p $DIR/shared

if [ ! "$(docker ps -q -f name=db)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=db)" ]; then
        # cleanup
        docker rm db
    fi

    # run your container
    docker run --name=db -d -p 3306:3306 \
        -e MYSQL_ROOT_PASSWORD=root \
        -e MYSQL_USER=max  -e MYSQL_PASSWORD=123 \
        -e MYSQL_DATABASE=dev \
        --mount type=bind,src=$DIR/config/my.cnf,dst=/etc/my.cnf \
        --mount type=bind,src=$DIR/data,dst=/var/lib/mysql \
        --mount type=bind,src=/$DIR/shared,dst=/home \
        mysql/mysql-server:5.7
else
  echo "already running"  
fi
