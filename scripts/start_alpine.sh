#! /bin/sh

CONTAINER_NAME="alpine"
IMAGE=gaodp/alpine:latest

docker version >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "docker is not running!"
	exit 1
fi

running=$(docker container inspect $CONTAINER_NAME -f {{.State.Running}} 2>/dev/null)
if [ $? -ne 0 ]; then
	docker run -it \
        --name $CONTAINER_NAME \
        -v ~/work:/root/work \
        -v ~/data:/root/data $IMAGE
elif [ "${running}" == "true" ]; then
	docker exec -it $CONTAINER_NAME /bin/zsh
else
	docker start $CONTAINER_NAME >/dev/null
	docker exec -it $CONTAINER_NAME /bin/zsh
fi
