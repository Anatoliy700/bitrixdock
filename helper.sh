#!/usr/bin/env bash

ACTION=$1
NAME=$2

build(){
  echo 'Пересборка контейнера "'"$NAME"'"'
  docker-compose ps "$NAME" \
  && docker-compose stop "$NAME" \
  && yes y | docker-compose rm "$NAME" \
  && docker-compose build "$NAME" \
  && docker-compose up -d
}

case $ACTION in
build)
  build
  ;;

esac

exit 0
