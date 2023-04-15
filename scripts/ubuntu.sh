#! /bin/bash

exec 2>/dev/null
CONTAINER_NAME="ubuntu"
IMAGE=gaodp/ubuntu:latest

version=$(docker version)
if [ "${#version}" -eq 0 ]; then
	echo "docker is not running!"
	return
fi

running=$(docker container inspect $CONTAINER_NAME -f {{.State.Running}})
if [ "${#running}" -eq 0 ]; then
	docker run -it --name $CONTAINER_NAME -v ~/work:/root/work -v ~/data:/root/data $IMAGE
elif [ "${running}" == "true" ]; then
	docker exec -it $CONTAINER_NAME /bin/zsh
else
	docker start $CONTAINER_NAME
	docker exec -it $CONTAINER_NAME /bin/zsh
fi
